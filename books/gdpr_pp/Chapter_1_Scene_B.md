# Chapter 1: The "Invisible Barrier" Strategy

## Section B: ANPR Technology & Privacy Impact

**Target Readers:** Cloud Architects, Software Engineers, Security Engineers
**Key Concept:** Privacy-by-Design as a Technical Constraint, Not a Legal Afterthought

---

The hardest part of building an ANPR system is not the image recognition—it is deciding what **not** to capture. Modern computer vision models can extract everything from a video stream: license plates, vehicle make and model, driver faces, pedestrian movements, weather conditions, and even the contents of a car's backseat. The temptation for a Product team is to capture all of this data because "we might need it later." This is the wrong instinct. Every additional data point you capture expands your GDPR scope, increases your storage costs, and creates new attack surfaces for breaches. The correct engineering discipline is to capture only what you can legally justify and technically defend.

The Peter Park FreeFlow system makes three specific architectural decisions that define its privacy posture: (1) **edge-only video processing** (full frames never leave the camera site), (2) **image blurring before cloud storage** (faces and surroundings anonymized), and (3) **multi-model voting** (ALPR accuracy without storing raw video for manual review). These are not features you can add retroactively—they are constraints that determine your hardware selection, your ML pipeline design, and your storage architecture.

### Hardware Selection: Axis vs. Dahua (The On-Camera vs. Gateway Decision)

The first architectural fork is whether to perform OCR (Optical Character Recognition) on the camera itself or on a separate gateway device. This decision has compliance implications because it determines where the full video frame exists and for how long.

**Axis Communications cameras** (models Q1785-LE, P1455-LE in 9mm and 29mm variants) run the **FF Group "CAMMRA LPR Lite"** application directly on the camera. The application is an ACAP (Axis Camera Application Platform) plugin that processes the video stream in real-time, detects license plates, performs OCR, and transmits only the recognized plate string and a small image crop to the backend. The full video frame is processed in-camera RAM and discarded. This is the **on-camera processing model**. The advantage is simplicity: you deploy a single device per lane, and the video never leaves the edge. The disadvantage is cost: Axis cameras are premium hardware, typically €2,500-€4,000 per unit depending on lens configuration.

**Dahua Technology cameras** (model IPC-HFW5241E-Z12E in 12mm and 60mm variants) do not have native ALPR capability. Instead, they stream video via RTSP (Real-Time Streaming Protocol) to a local **Nvidia Jetson** gateway device (Nano, TX2, or Orin models) installed in the control cabinet. The Jetson runs a custom application called **"Jetstream"** that uses **Nvidia DeepStream SDK** to process the RTSP feed, run YOLO-based object detection models (compiled to TensorRT engines for GPU acceleration), crop the detected license plate region, and forward the crop to the cloud. This is the **gateway processing model**. The advantage is cost: Dahua cameras are €800-€1,500, and a single Jetson Nano (€150-€200) can process feeds from multiple cameras. The disadvantage is complexity: you now have two devices to manage (camera + gateway), and the video stream exists on the local network for the duration of the RTSP transmission.

From a privacy perspective, the on-camera model (Axis) is cleaner because the video never leaves the device. From a cost and scalability perspective, the gateway model (Dahua + Jetson) is more flexible because you can centralize ML model updates and reuse compute across multiple cameras. The Peter Park architecture uses **both** depending on the deployment scenario: Axis for high-value locations (airports, hospitals, premium retail) and Dahua for cost-sensitive deployments (municipal parking, small retail chains). The critical compliance requirement is the same for both: **the full video frame must never be stored in the cloud**.

::: tech-deep-dive
**Camera Hardware Specifications**

| Vendor | Model | Processing | Range | Use Case | Cost |
|--------|-------|-----------|-------|----------|------|
| **Axis** | Q1785-LE / Q1700 | On-camera (CAMMRA LPR Lite) | >17m | Airports, large retail, highways | €3,500-€4,000 |
| **Axis** | P1455-LE (29mm) | On-camera (CAMMRA LPR Lite) | 9-17m | Standard parking lot entries | €2,800-€3,200 |
| **Axis** | P1455-LE (9mm) | On-camera (CAMMRA LPR Lite) | <9m | Parking garages, confined entries | €2,500-€2,800 |
| **Dahua** | IPC-HFW5241E-Z12E (60mm) | Gateway (Nvidia Jetson) | 5-20m | Cost-sensitive outdoor lots | €1,200-€1,500 |
| **Dahua** | IPC-HFW5241E-Z12E (12mm) | Gateway (Nvidia Jetson) | <5m | Cost-sensitive indoor garages | €800-€1,000 |

**Gateway Processing Units:**
- **Nvidia Jetson Nano (4GB):** Standard (€150-€200), handles 2-4 camera feeds
- **Nvidia Jetson TX2 (4GB/NX):** High-performance (€400-€500), handles 4-8 feeds
- **Nvidia Orin Nano:** Next-gen (€500+), testing phase

**Network Protocol:** RTSP (Real-Time Streaming Protocol) for Dahua → Jetson. HTTPS POST for Axis → Falcon backend.
:::

### Edge Processing: YOLO Models and TensorRT Optimization

The Jetstream application running on Nvidia Jetson devices uses a three-stage pipeline: (1) **vehicle detection**, (2) **license plate detection**, and (3) **OCR**. Each stage uses a distinct YOLO (You Only Look Once) model compiled to a TensorRT engine for GPU inference.

**Stage 1: Vehicle Detection** uses a YOLOv5 model trained to detect vehicles in the frame. This stage is necessary because license plates are small objects (typically 1-3% of the frame), and running OCR on the full frame is computationally expensive. By detecting the vehicle first, you can crop a region of interest (ROI) and run plate detection only on that ROI, which reduces inference time from ~200ms to ~50ms per frame.

**Stage 2: License Plate Detection** runs a second YOLOv5 or YOLOv8 model on the vehicle ROI to detect the plate bounding box. The model is trained on European plates (German, Austrian, Swiss, Italian, French) because the aspect ratios and character sets differ significantly from US or Asian plates. A US-trained model will fail on European plates because it expects a different width-to-height ratio.

**Stage 3: OCR** uses a custom CNN (Convolutional Neural Network) or a YOLOv8 character detection model to recognize individual characters within the plate bounding box. The output is a string (e.g., "M-AB-1234") and a confidence score per character. If the confidence score is below a threshold (typically 0.80), the plate is flagged for cloud-based re-processing.

The entire pipeline runs at approximately **10-15 FPS** (frames per second) on a Jetson Nano, which is sufficient for parking lot entry lanes where vehicles move at <10 km/h. For high-speed scenarios (highways, toll booths), you would need a Jetson TX2 or Orin to hit 30 FPS. The key constraint is that **all processing happens on the Jetson device**—the full video frame is read from the RTSP stream, processed in GPU memory, and discarded. Only the cropped plate image (typically 200x100 pixels) is sent to the cloud.

::: tech-deep-dive
**Jetstream ALPR Pipeline (Edge)**

```
RTSP Stream (1920x1080, 30 FPS)
  ↓
[Stage 1: YOLOv5 Vehicle Detection]
  → Detect vehicle bounding box
  → Crop ROI (e.g., 800x600 region)
  ↓
[Stage 2: YOLOv8 Plate Detection]
  → Detect plate bounding box within vehicle ROI
  → Crop plate region (e.g., 400x200)
  ↓
[Stage 3: CNN/YOLO OCR]
  → Recognize characters (e.g., "M-AB-1234")
  → Output: plate_string, confidence_scores, bounding_box
  ↓
[Post-Processing]
  → If confidence < 0.80, flag for cloud re-processing
  → Compress plate crop (JPEG, 85% quality)
  → Send to Falcon backend via HTTPS POST
  ↓
[Discard Full Frame]
  → Full 1920x1080 frame never stored or transmitted
```

**Performance:**
- **Inference time:** ~50-80ms per frame (Jetson Nano)
- **Throughput:** 10-15 FPS (sufficient for <10 km/h vehicle speed)
- **Memory:** <2GB GPU RAM (allows 2-4 camera feeds per Jetson)
- **Network:** ~10-20 KB per observation (plate crop + metadata)
:::

The compliance implication of this architecture is that **you cannot manually review missed detections by looking at the original video** because the original video does not exist. This is a deliberate trade-off. In a traditional CCTV system, if the ALPR misses a plate, an operator can pull up the video recording and manually read the plate. In the Peter Park system, if the edge device misses the plate, the only fallback is the cloud-based re-processing pipeline (which also operates on the crop, not the full frame). If the crop itself is too blurry or occluded to read, the observation is lost.

This creates an operational challenge: if your ALPR accuracy is 95%, you will lose 5% of observations, which translates to lost revenue if those vehicles overstay their parking. The solution is not to store the full video (which violates data minimization)—the solution is to **increase ALPR accuracy** through better camera placement, better lighting, and multi-model voting in the cloud. This is the correct engineering response to a compliance constraint.

### Cloud ML Pipeline: The Unified Observation Consumer

Once the plate crop reaches the Falcon backend (via the `/observe` endpoint), it enters the **Unified Observation Consumer (UOC)** pipeline. The UOC is a microservice that aggregates observations from multiple sources (Axis cameras, Dahua/Jetson gateways, manual kiosk entries) and enriches them by calling a series of ML "plugins." Each plugin is a separate Lambda function or EKS-hosted container that performs a specific task:

1. **Secondary ALPR (Outrider, ALPRv2, ALPRv3, ALPRv4):** Re-runs OCR on the plate crop using different models (YOLOv5, YOLOv8, YOLOv9) to validate the edge device's reading. Each model returns a candidate plate string and a confidence score.

2. **Voting Logic:** If the edge device read "M-AB-1234" with 0.82 confidence, but ALPRv3 reads "M-A8-1234" with 0.88 confidence, the system uses a voting algorithm (weighted by confidence scores) to determine the most likely correct string. Typically, if two models agree, that result is accepted. If all models disagree, the observation is flagged for manual review (which involves looking at the plate crop, not the full video).

3. **Plate Country Recognition (PCR):** A ConvNext model classifies the plate's country of origin (e.g., "DE" for Germany, "CH" for Switzerland) based on visual features (fonts, aspect ratios, color patterns). This is important for multi-national deployments because OCR models trained on German plates perform poorly on Italian plates.

4. **Vehicle Type Recognition (VTR):** A YOLOv8 model classifies the vehicle type (Car, Truck, Motorcycle, Van) based on the vehicle ROI (if the edge device sent it). This is used for differential pricing (e.g., trucks pay 2x the car rate) or access control (e.g., no trucks in residential parking).

5. **Vehicle Orientation Detection (VOD):** A YOLOv5 model determines if the vehicle is facing forward or backward. This is critical for "Hawk Eye" setups (discussed below) where two cameras scan a single lane from opposite angles.

6. **Vehicle Make Recognition (VMR):** Optionally, the system calls the **OpenALPR API** (a paid third-party service) to infer the vehicle's make, model, and color. Due to cost constraints, this is typically enabled for only a subset of vehicles (e.g., 10% random sample per parking area) rather than every observation.

The output of the UOC is a structured **Observation object** stored in DynamoDB with metadata and an S3 reference to the plate crop. The full video frame is still not stored.

::: tech-deep-dive
**Unified Observation Consumer (Cloud Pipeline)**

```
Observation Input (from edge)
  ↓
[Plugin 1: Secondary ALPR]
  → Outrider (YOLOv5): "M-AB-1234" (confidence 0.81)
  → ALPRv3 (YOLOv8): "M-AB-1234" (confidence 0.89)
  → ALPRv4 (YOLOv9): "M-AB-1234" (confidence 0.91)
  → Voting Result: "M-AB-1234" (3/3 models agree, avg confidence 0.87)
  ↓
[Plugin 2: PCR (Plate Country)]
  → ConvNext Model: "DE" (confidence 0.94)
  ↓
[Plugin 3: VTR (Vehicle Type)]
  → YOLOv8: "Car" (confidence 0.97)
  ↓
[Plugin 4: VOD (Orientation)]
  → YOLOv5: "Front" (confidence 0.92)
  ↓
[Plugin 5: VMR (Make/Model) - Optional]
  → OpenALPR API: Make="BMW", Model="3 Series", Color="Silver"
  → (Only called for 10% of vehicles due to API cost)
  ↓
[Store Observation]
  → DynamoDB: {plate, timestamp, area_id, confidence, vehicle_type, orientation}
  → S3: plate_crop.jpg (stored in `pp-unified-observations-*` bucket)
```

**Result:** Structured data without full video. Observation available for matching against parking sessions, whitelist enforcement, violation detection.
:::

### Privacy-by-Design Measures: Blurring, Virtual Cameras, and Hawk Eye

The UOC pipeline has one additional step before the plate crop is stored in the long-term evidence bucket (`pp-unified-evidences-*`): it is sent to the **Image Service**, which applies a **blur filter** to anonymize surrounding areas. The blur is not applied to the plate itself (which needs to remain readable for enforcement purposes), but to the vehicle context and any visible background. This ensures that if a pedestrian or driver's face appears in the crop, it is not recognizable.

The blur filter is a simple Gaussian blur applied to a dynamically calculated mask: the system detects the plate region, expands the bounding box by 10-20%, and blurs everything outside that expanded region. If the crop accidentally includes part of another vehicle or a person in the background, that area is blurred. This is a **post-processing privacy measure** that reduces the risk of inadvertent personal data capture. It is not a substitute for proper camera placement (cameras should be angled to avoid public streets and pedestrian walkways), but it is a safety net.

**Virtual Cameras** are a software-defined abstraction used when a single physical camera must logically represent both an entry and an exit point. In some parking configurations, it is not feasible to install separate cameras for entry and exit (e.g., a single-lane driveway where cars can enter or exit depending on time of day). In these cases, the system creates two "virtual cameras" in the software: one configured with `freeflow_position: entry` and one with `freeflow_position: exit`. Both virtual cameras receive observations from the same physical camera, but the backend logic uses additional context (e.g., time-of-day rules, vehicle direction analysis via VOD) to determine whether a specific observation represents an entry or exit.

This is purely a software pattern and has no privacy implications, but it is worth documenting because it demonstrates how the compliance requirement (cameras must clearly distinguish entry from exit to accurately calculate parking duration) influences the system's logical data model.

**Hawk Eye (Überkreuzscan)** is a redundancy configuration where two cameras (typically one Axis and one Dahua) are installed at a single lane, positioned to capture the vehicle from both the front and the rear. The goal is to ensure that if one camera fails to read the plate (due to occlusion, dirt, reflections, or poor angle), the other camera will succeed. The two observations are linked by the UOC based on timestamp proximity (if two plates are read within 2-3 seconds at the same location, they are assumed to be the same vehicle).

Hawk Eye configurations are more expensive (double the hardware cost) but are used in high-assurance scenarios where missing a plate is unacceptable (e.g., airport parking where incorrect billing damages the operator's reputation). The privacy implication is that Hawk Eye doubles the number of image crops stored temporarily (one front crop, one rear crop), but both are still subject to the same 48-hour deletion policy for free stays.

### The Privacy vs. Accuracy Trade-Off (And Why You Cannot Cheat)

The architectural decisions described above create a hard trade-off: **you can have high privacy or high recoverability, but not both**. If you delete the full video frames and retain only plate crops, you gain data minimization compliance but lose the ability to manually review missed detections. If you retain full video for manual review, you gain recoverability but lose the data minimization argument, which weakens your GDPR Article 6(1)(f) legitimate interest defense.

The Peter Park system chooses **high privacy, high accuracy** by investing in multi-model voting and Hawk Eye redundancy to push ALPR accuracy above 98%. At 98% accuracy across 1,000 vehicles per day, you miss 20 plates. If each missed plate represents a potential €30 parking fee, you lose €600 per day, or €219,000 per year per location. This is an acceptable loss if it allows you to avoid GDPR fines (which start at €10 million or 2% of global revenue for data minimization violations under Article 83(4)).

The competitors who store full video for 90 days are not making a technical decision—they are making a risk decision. They are betting that their data protection authority will not audit them, or that if audited, they can argue that video retention is "necessary" for fraud prevention. This argument fails under the EDPB's 2024 Legitimate Interest Guidelines, which require controllers to demonstrate that less intrusive means were genuinely considered and found insufficient. If you can achieve 98% accuracy without storing video, you cannot argue that video storage is "necessary." The correct response is to accept the 2% miss rate and improve your ML models, not to expand your data retention scope.

This is the invisible moat. Your competitors see that you are using cameras for parking enforcement and assume they can copy the idea by buying the same hardware. They do not realize that the hard part is designing the system **not to store** the full video, which requires edge processing, multi-model voting, Hawk Eye redundancy, and a 48-hour deletion pipeline. By the time they figure this out, you have already captured the market, and they are trying to retrofit privacy-by-design into a system that was not architected for it. Retrofitting is expensive and often impossible without rebuilding the entire stack.

---

**Next:** Section C will examine the legal defense under GDPR Article 6(1)(f) (legitimate interest), the Data Protection Impact Assessment (DPIA) findings, the specific risks identified by the DPO (unjustified keeper data requests, surveillance overreach), and the mitigations (Enforcement Release Process, privacy filters, transparency signage, KBA interface authorization). The goal is to show how the technical architecture from Section B directly supports the legal justification in Section C—because compliance is not a document you write, it is a system you build.
