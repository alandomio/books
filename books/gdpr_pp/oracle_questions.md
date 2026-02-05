# 🔮 ORACLE QUESTIONS: Chapter 1
**Status:** Awaiting Answers
**Agent:** Ralph Wiggum (Oracle Proxy Mode)
**Target Chapter:** Chapter 1 - The "Invisible Barrier" Strategy

---

## INSTRUCTIONS FOR THE ORACLE (User)
Please answer the questions below with as much technical detail as possible. These answers will be used to write **Chapter 1** with precision.

**Format:** Replace `[YOUR ANSWER HERE]` with your response. Be specific about:
- Product names, vendor names, AWS service names
- Data flows (what gets stored where, for how long)
- Legal justifications (exact wording from your privacy policy or LIA)

---

## SCENE A: THE FREEFLOW CONCEPT

### Q1: What is "FreeFlow"?
**Context:** Is this a product name, a feature, or an architectural pattern?

**Answer:**
FreeFlow (also referred to as "CameraPark" or "Kameraparken") is defined as a technology and parking process where the start and end of a parking session are activated automatically upon vehicle entry and exit. It utilizes Automatic Number Plate Recognition (ANPR/ALPR) to recognize the license plate, allowing the user to enter and leave the parking area without interacting with a barrier or a machine, provided they have activated this function in a supported parking app.
Nature of FreeFlow: Feature vs. Product
Based on the internal documentation, FreeFlow is a feature and a specific integration mode, rather than a standalone product name or architectural pattern.
• It is listed as a specific "systematic" or mode alongside "manual start/stop" in project descriptions.
• It is described as a specific type of integration supported by certain third-party app partners.
• It contrasts with "Prepaid" or "Manual" parking flows.
How it Works (Technical Flow)
The FreeFlow process relies on an interaction between Peter Park's backend (Falcon) and third-party app providers:
1. Observation: A camera recognizes the license plate upon entry, and the data is sent to the /observe endpoint in the Falcon backend.
2. Verification: The observation pipeline triggers a service (e.g., easypark/freeflow or parkster/freeflow) to check if the recognized plate is registered and enabled for FreeFlow with the partner.
3. Session Start:
    ◦ EasyPark: The system calls the EasyPark API (/external/parkings/start). If EasyPark returns a success message (indicating the user has ANPR active), a stay is created in the Peter Park system.
    ◦ Parkster: The system sends a start request. If successful, the plate is stored in Redis. Parkster then calls back to Peter Park endpoints to create the stay.
4. Session End: Upon exit, the system calculates the price using the internal pricing engine and calls the partner API (e.g., /external/parkings/stop) to end the session and transmit the fee.
Supported Partners
• EasyPark: Supports FreeFlow integration.
• Parkster: Supports FreeFlow integration.
• PayByPhone: Does not support FreeFlow; it only supports prepaid stays.
Variations
• Manual Freeflow: A hybrid flow (specifically mentioned regarding EasyPark) where the user manually starts the parking process via the app upon entry (/easypark/v1/freeflow/start), but the system links this to the camera observation and manages the session. This is distinct from fully automatic FreeFlow where no user action is required at the time of parking.
Technical Requirements
Implementing FreeFlow requires specific hardware configurations, such as the use of Virtual Cameras to define freeflow_position: entry and freeflow_position: exit when physical cameras cover both directions.
How is FreeFlow integration handled for different third-party app partners?
What technical requirements must be met to implement FreeFlow parking?
How do virtual cameras function in the FreeFlow entry/exit process?

---

### Q2: What physical barrier is being replaced?
**Context:** Boom gates, turnstiles, ticket machines, manned guard posts?

**Answer:**
Based on the provided documents, the primary physical barrier being replaced by the Peter Park system is the boom gate (referred to in the texts as "Schranke" or "Schrankenanlage"). The solution is consistently described as a "barrier-free" (schrankenlos or schrankenfrei) parking management system.
Here are the specific physical elements and systems being replaced:
• Boom Gates / Barriers (Schranken): The system is explicitly designed to replace traditional barrier systems,,,,. Marketing materials highlight the elimination of "congestion in front of the barrier" (Stau vor der Schranke) as a key benefit. In specific project instances, such as Fuschl am See and Worms, the documents note that a barrier was previously in place or is being dismantled,. At Lindenberg, an old barrier system from 2001 that was frequently broken is being replaced.
• Paper Tickets (Papiertickets): Alongside the physical barrier, the system eliminates the need for physical tickets made of paper or plastic,,,. This replaces the need for entry columns that issue tickets.
• Pay-and-Display Machines (Parkscheinautomaten): In some municipalities (e.g., Plüderhausen), the digital system replaces "normal parking ticket machines" (normale Parkscheinautomaten) where users previously had to buy a ticket upon arrival and display it in the vehicle,.
• Manual Control / Manned Posts: While not a physical "barrier" in the architectural sense, the system replaces the need for manual patrolling (manuelle Bestreifung) and personnel required to control access or check for tickets,,,.
The "FreeFlow" (or "CameraPark") process allows users to enter and exit without interacting with any barrier or machine at the lane, as the parking session starts and ends automatically via license plate recognition.

---

### Q3: What is the target market?
**Context:** Parking lots, toll roads, campus access, residential complexes, municipalities?

**Answer:**
Based on the audit of our internal documentation and client project lists, our target market encompasses a broad spectrum of **off-street parking facilities**. We operate strictly in the B2B sector, providing infrastructure and software to operators and property owners.

We do **not** operate toll roads or on-street moving traffic enforcement systems.

Our market is segmented into four primary verticals, with specific detailed sub-segments confirmed by active client projects:

### 1. Municipalities & Public Infrastructure ("Innercity Parking")
We actively target and service public entities. This includes:
*   **Municipalities ("Kommunen" & "Gemeinden"):** We manage public parking for towns and cities, often replacing legacy barrier systems or pay-and-display machines.
*   **Public Utilities ("Stadtwerke"):** We partner with municipal utility companies to manage city parking structures and lots (e.g., Stadtwerke Amberg, Stadtwerke Sigmaringen, Stadtwerke Forchheim).
*   **Transportation Hubs:** This is a significant growth area, including:
    *   **Airports:** We service parking areas for airports such as Hannover, Nürnberg, and Memmingen.
    *   **Train Stations:** Parking garages at railway stations (e.g., Hannover Hbf, Linz Bahnhof).
    *   **Harbors/Ferries:** Parking for ferry terminals and harbors (e.g., Lübeck Hafen, AG Ems/Borkum).

### 2. Retail & Commercial Real Estate
We service high-volume commercial locations, often focusing on preventing long-term misuse of customer parking spaces.
*   **Supermarkets & Discounters:** A major portion of our volume comes from retail chains. **Lidl** is a key account with numerous installations. We also service Edeka, Rewe, and Aldi locations.
*   **Shopping Centers:** We manage large-scale parking decks for malls (e.g., Spandau Arcaden, Palais Vest).
*   **Specialty Retail:** This includes hardware stores (e.g., OBI) and furniture stores (e.g., Mömax).
*   **Fitness & Business Campuses:** We manage access for gyms (e.g., FitGroup) and mixed-use business parks ("Gewerbecampus").

### 3. Healthcare ("Krankenhäuser")
This is a dedicated target segment for our sales and marketing teams.
*   **Hospitals & Clinics:** We manage parking for staff, patients, and visitors to ensure availability. Clients include large clinic groups (Helios, Vamed) and regional hospitals (e.g., Klinikum Friedrichshafen, St. Martinus Hospital).
*   **Medical Centers:** Smaller medical care centers and rehabilitation facilities.

### 4. Tourism & Recreation
We service seasonal and high-traffic leisure destinations.
*   **Mountain Railways ("Bergbahnen") & Ski Resorts:** We have a specific marketing campaign targeting this sector, particularly in the DACH region (e.g., Söllereckbahn, Hintertux, Wurmberg).
*   **Lakes & Baths:** We manage parking for bathing lakes ("Badeseen"), thermal baths ("Thermen"), and lidos (e.g., Unterbacher See, Bodetal Therme).
*   **Hotels & Camping:** We service hotel parking lots and campsites (e.g., NH Hotels, Camping Pilsensee).
*   **Event Venues:** Parking for stadiums, arenas, and cultural sites (e.g., Stadthalle Bremerhaven, Meistersingerhalle).

### 5. Residential & Campus Access
Regarding your specific query on these categories:
*   **Residential Complexes:** Yes, we service residential areas ("Anwohnerparken") and housing associations (e.g., Bauverein zu Lünen), often managing permits for residents alongside visitor parking.
*   **Campus Access:** Yes, we operate on university campuses (e.g., Johann-Goethe-Universität Frankfurt).

**Summary of Data Subject Categories per Market:**
*   **Retail/Tourism:** High volume of transient "Short-term Parkers" (Kurzzeitparker).
*   **Residential/Office/Campus:** High volume of "Permit Holders" (Dauerparker/Whitelists).
*   **Healthcare:** Mixed user base requiring specific sensitivity regarding patient access and staff permits.

---

## SCENE B: ANPR TECHNOLOGY & PRIVACY

### Q4: What ANPR hardware/vendor are you using?
**Context:** Axis cameras, Hikvision, Bosch, or custom solution? Include model numbers if possible.

**Answer:**
Based on the internal technical documentation and project guidelines, we utilize a hybrid hardware approach combining **Axis Communications** and **Dahua Technology** cameras, often paired with **Nvidia Jetson** processing units. We do not currently use Hikvision or Bosch cameras in our standard setup.

Here is the detailed breakdown of the hardware and vendors used:

### 1. Camera Vendors & Models

**A. Axis Communications (Premium/Standard)**
Axis cameras are preferred for "high value" areas or complex setups. They run the **FF Group "CAMMRA LPR Lite"** application directly on the edge,.

*   **Axis Q1785-LE / Q1700:** Used for long distances (greater than 17 meters). These are often deployed at major entry points like airports or large retail parking lots,,.
*   **Axis P1455-LE (29 mm):** Used for medium distances (approx. 9 to 17 meters).
*   **Axis P1455-LE (9 mm):** Used for short distances (less than 9 meters), typical for parking garages, confined entries, or "Kiss & Ride" zones,.

**B. Dahua Technology (Cost-Efficient/Supplemental)**
Dahua cameras are used as a cost-effective alternative or in combination with Axis cameras for "Hawk Eye" setups. Unlike the Axis setup, Dahua cameras in our infrastructure generally require an external Jetson unit to process the LPR data.

*   **Dahua IPC-HFW5241E-Z12E:** This is the standard model cited, available in configurations often referred to internally as "12mm" (short range < 5m) or "60mm" (range 5-20m),.

### 2. Processing Hardware (Edge Computing)

To facilitate ALPR (Automatic License Plate Recognition) and connect the cameras to our cloud backend ("Falcon"), we use **Nvidia Jetson** mini-computers installed in local control cabinets (Schaltkästen).

*   **Nvidia Jetson Nano (4GB):** The standard processing unit.
*   **Nvidia Jetson TX2 (4GB / NX):** Used for higher performance requirements,.
*   **Nvidia Orin Nano:** Mentioned in newer documentation as part of the "New Developer Experience" and testing phase.

### 3. Setup Configurations

*   **Hawk Eye (Überkreuzscan):** For high-precision requirements, we utilize a "Hawk Eye" setup. This involves using two cameras (often one Axis and one Dahua) to scan a vehicle from both the front and the rear to ensure capture regardless of plate condition or position,.
*   **Virtual Cameras:** In "FreeFlow" scenarios where physical separation of entry and exit isn't possible with separate cameras, we configure "Virtual Cameras" in the software to logically separate entry and exit events from a single physical video stream.

### 4. Software & Recognition Logic

*   **On-Camera (Edge):** Axis cameras run the **CAMMRA LPR Lite** app by FF Group,.
*   **Serverless/Cloud ML:** We utilize our own machine learning pipelines ("Outrider", "ALPRv2/v3/v4") for processing images. These pipelines utilize **YOLOv5, YOLOv8, and YOLOv9** frameworks for object detection, vehicle make recognition (VMR), and optical character recognition (OCR),.

---

### Q5: Where is the image processing done?
**Context:** Edge device (on-camera), AWS Lambda, EC2, or third-party API (like OpenALPR, Sighthound)?

**Answer:**
Based on the internal technical documentation, image processing is performed in a **hybrid environment** distributed across **edge devices** (both on-camera and on-premise gateways) and the **cloud** (AWS).

Here is the breakdown of where specific processing tasks occur:

### 1. Edge Processing (On-Site)
Initial detection and License Plate Recognition (LPR/ANPR) occur locally to ensure speed and reduce bandwidth. The method depends on the camera hardware:

*   **On-Camera (Axis):**
    *   **Axis cameras** run the **FF Group "CAMMRA LPR Lite"** application directly on the device.
    *   This app handles the detection and OCR locally before sending data to the backend.
*   **On-Premise Gateway (Nvidia Jetson):**
    *   For **Dahua cameras** (and some Axis setups), the video stream is processed by a local **Nvidia Jetson** device (Nano, TX2, or Orin) installed in the control cabinet.
    *   These devices run our custom **"Jetstream"** application, which utilizes **Nvidia DeepStream** and **YOLO** models (built to TensorRT engines) for vehicle detection and license plate recognition.

### 2. Cloud Processing (AWS)
We utilize a **Serverless ML** infrastructure on AWS (Lambda and EKS) for advanced recognition, validation, and enrichment.

*   **Unified Observation Consumer:** This service receives data from the edge and acts as a central processor. It calls various "plugins" (ML services) to verify and refine the data.
*   **Secondary/Cloud ALPR:** We run multiple generations of ALPR models in the cloud for validation or "voting" logic to ensure accuracy. These include:
    *   **Outrider:** Our legacy baseline service using **YOLOv5**.
    *   **ALPRv2 / ALPRv3 / ALPRv4:** Newer services using **YOLOv8** and **YOLOv9** for improved accuracy, including specific models for night-time or low-resolution images.
*   **Advanced Classification:**
    *   **PCR (Plate Country Recognition):** Uses a **ConvNext** model to determine the country of origin.
    *   **VTR (Vehicle Type Recognition):** Uses **YOLOv8** to classify vehicles (e.g., car, truck, motorcycle).
    *   **VOD (Vehicle Orientation Detection):** Uses **YOLOv5** to determine if a car is facing front or back.

### 3. Third-Party APIs
*   **OpenALPR:** We use the paid **OpenALPR API** specifically for **Vehicle Make Recognition (VMR)** (Make, Model, Color). Due to cost/limits, this is often restricted to a random selection or specific percentage of vehicles per area rather than every single observation.

---

### Q6: What data is stored after plate recognition?
**Context:** Raw image? Plate number only? Timestamp? GPS coordinates? Vehicle make/model?

**Answer:**
Based on our technical documentation and data processing pipelines, the system stores a structured object referred to as an "**Observation**" following a plate recognition event. This data is processed through our "Unified Observation Consumer" and stored in our cloud infrastructure (AWS S3 and DynamoDB).

For the purpose of the audit, here is the specific data breakdown:

### 1. Visual Data (Images)
We do not store raw, full-frame video streams permanently. Instead, we store specific "crops" and context images related to the recognition event:
*   **License Plate Crop:** A specific image crop of the detected license plate.
*   **Context Image:** An image of the vehicle to prove presence. To ensure GDPR compliance, the system applies a **blur** on the image (specifically surrounding areas/faces) via our Image Service before long-term storage in the `unified-evidences` S3 bucket.
*   **No Video Recording:** The system explicitly does not perform continuous video recording; it only captures text files and image snapshots upon entry and exit events.

### 2. Alphanumeric & Temporal Data
For every observation, the following metadata is generated and stored:
*   **License Plate String:** The recognized alphanumeric character string.
*   **Timestamps:** A text file containing the date and time stamp is generated to calculate parking duration (entry and exit times).
*   **Confidence Scores:** The system stores the detection confidence, specifically:
    *   `box_confidence`: The confidence that a plate was detected.
    *   `character_confidences`: The confidence score for individual characters.
    *   `country_confidence`: The confidence score regarding the license plate's country of origin.
*   **Location Data:** While individual images may not carry embedded GPS metadata, every observation is linked to a specific **Area Entity ID** (Parking Lot). The Area Entity itself contains the static `longitude` and `latitude` coordinates of the facility.

### 3. Vehicle Metadata (Enrichment)
Our serverless ML pipeline enriches the observation with additional vehicle attributes. Depending on the specific configuration and services enabled (e.g., OpenALPR integration or internal models), we store:
*   **Vehicle Orientation (VOD):** Whether the vehicle was facing "Front" or "Back".
*   **Vehicle Type (VTR):** Classification of the vehicle (e.g., Car, Truck, Motorcycle, Van).
*   **Country of Origin (PCR):** The predicted country code (e.g., "DE", "AT", "CH").
*   **Vehicle Make/Model (VMR):** We utilize detection models to infer vehicle make (e.g., "Toyota"). *Note: For deep make/model/color analysis via third-party APIs (OpenALPR), this is often limited to a specific "tracking rate" (percentage of cars) per area to manage costs.*

### 4. Data Retention Status
It is critical to note for the audit that the storage of this data is subject to a strict lifecycle:
*   **Free Stays (No Violation):** If a parking session is completed within the free period or paid for correctly, the system is designed to anonymize the plate and cleanup the related observations (images) from S3, typically after **48 hours**,.
*   **Violations/Transactions:** Data linked to financial transactions or unpaid parking charge notices (PCNs) is retained to fulfill legal and fiscal obligations.

---

### Q7: What is the 48-hour deletion mechanism?
**Context:** DynamoDB TTL attribute? S3 Lifecycle Policy? Lambda function triggered by EventBridge?

**Answer:**
Based on the internal documentation regarding the **GDPR Service**, the 48-hour deletion mechanism is **not** handled by DynamoDB TTL or S3 Lifecycle policies. Instead, it is an application-level process driven by a delayed queue system involving the **Payment Reconciliation Service** and the **GDPR Service**.

Here is the specific technical flow described in the documentation:

### 1. Classification & Trigger (Payment Reconciliation)
The process begins with the **Payment Reconciliation Service**. This service identifies "Free Stays" (parking sessions that do not require payment and are not violations). Once a stay is determined to be free, the Payment Reconciliation service takes the responsibility of pushing this stay into a processing queue.

### 2. The Delay Mechanism (Queue-Based)
The deletion is not immediate. The system utilizes a queue-based architecture where the free stays are pushed with a configured **delay of 48 hours**. The documentation explicitly states that "Every determined free stay will be pushed to GDPR service, with a 48 hours delay".

### 3. Execution (GDPR Service)
After the 48-hour period elapses, the **GDPR Service** consumes the message from the queue. It then performs two specific actions:
1.  **S3 Cleanup:** It actively cleans up the related observations (images/evidence) from the S3 buckets.
2.  **Anonymization:** It anonymizes the license plate data recorded in the `stays` database table.

### 4. Data Scope
Currently, this automated 48-hour deletion mechanism applies specifically to **Free Stays**. Support for the automated deletion/anonymization of "Paid Stays" and "Non-paid stays" (violations) was listed as "No support yet" in the provided documentation.

### Summary for Audit
To answer your specific context question: The mechanism is a **delayed queue message** (pushed by Payment Reconciliation) that triggers the **GDPR Service** to execute code that deletes S3 objects and updates DB records, rather than a passive infrastructure setting like DynamoDB TTL or S3 Lifecycle Rules.

---

### Q8: Do you store vehicle images in S3?
**Context:** If yes, what encryption (SSE-S3, SSE-KMS)? Which S3 storage class (Standard, Intelligent-Tiering)?

**Answer:**
Based on the technical documentation provided, here is the status of our S3 storage regarding vehicle images for the audit:

### 1. Storage Location
**Yes**, we store vehicle images in AWS S3.
Our architecture relies on S3 for storing payload data (images) while metadata is stored in DynamoDB. The primary buckets involved in the observation and enforcement pipeline are:
*   **`pp-unified-evidences-*`**: Stores the processed images used for enforcement. Before storage here, the **Unified Observation Consumer** service invokes an Image Service to apply a **blur** to the images (anonymizing surrounding areas/faces).
*   **`pp-unified-observations-*`**: Used during the processing of incoming camera shots.
*   **`ml-labelled-data`**: Stores data used for training machine learning models.

### 2. Encryption Strategy
While specific configuration for the image buckets is not explicitly detailed in the provided excerpts, our infrastructure utilizes **AWS KMS** (Key Management Service) for critical data protection.
*   **Database Backups:** We explicitly use **Customer Managed Keys (CMK)** for encrypting RDS snapshots to ensure they can be securely shared across accounts for disaster recovery (e.g., `arn:aws:kms:eu-central-1:870191396401:alias/rds-cross-account`).
*   **Access Control:** Access to these resources is strictly governed by IAM roles and policies, often utilizing **AWS SigV4** authentication for inter-service communication (e.g., between the Unified Observation Interface and other microservices).

### 3. Storage Class & Cost Management
The specific S3 storage class (e.g., Standard vs. Intelligent-Tiering) for the image buckets is not explicitly defined in the provided configuration snippets. However, **S3 storage costs** have been identified as a rapidly growing expense in our internal "Cost Explorer" analysis as of June 2024. This indicates that cost-optimization strategies (which typically involve lifecycle policies or storage classes like Intelligent-Tiering) are a subject of active review to manage the high volume of data processing.

### 4. Data Lifecycle (GDPR Compliance)
Regardless of the storage class, we enforce strict retention policies to minimize data footprint and meet compliance standards:
*   **48-Hour Deletion (Free Stays):** For compliant parking sessions ("Free Stays"), the **GDPR Service** is triggered via a queue with a 48-hour delay. Once processed, this service actively **cleans up the related observations (images)** from the S3 buckets and anonymizes the license plate data in the database.

---

## SCENE C: LEGAL DEFENSE (LEGITIMATE INTEREST)

### Q9: What is the specific "Legitimate Interest" justification?
**Context:** Why do you process license plates? (Facility security, payment enforcement, traffic management, crime prevention?)

**Answer:**
Based on our internal data protection guidelines and legal templates, our processing of license plate data is justified under **GDPR Article 6 (1)**, specifically citing **lit. b (Contract Performance)** and **lit. f (Legitimate Interest)**.

Here is the specific breakdown of our Legitimate Interest justification for the audit:

### 1. Enforcement of Civil Claims & Contractual Rights
The primary legitimate interest is the **enforcement of payment and contractual penalties** (Payment Enforcement).
*   **Context:** By entering the parking facility, the driver enters into a usage contract (implied contract/konkludentes Handeln) with the operator.
*   **Justification:** We process the license plate to document the duration of the stay ("Verweildauer") to calculate the fee and, in the event of non-payment, to enforce the contractual penalty ("Vertragsstrafe") or usage fee ("Nutzungsentgelt"). We assert a legitimate interest in obtaining the vehicle owner's data to pursue these civil claims.

### 2. Protection of Property Rights (Besitzstörung)
We process data to protect the property owner against **unauthorized use** or "Possession Disturbance" (*Besitzstörung*).
*   **Context:** The owner/operator has a legitimate interest in ensuring their private property is used according to the terms (e.g., payment of fees, adherence to maximum parking time).
*   **Justification:** The vehicle holder is considered responsible for "disturbances of possession" caused by their vehicle. Processing the plate allows the operator to assert injunctive relief ("Unterlassungsansprüche") against future violations.

### 3. Evidence & Burden of Proof (Beweislast)
The processing acts as necessary documentation to meet the **burden of proof** regarding the usage contract.
*   **Context:** To prove that a specific vehicle utilized the parking space for a specific duration.
*   **Justification:** The system records entry and exit timestamps to mathematically prove the parking duration, which determines the fee owed. This documentation is required to substantiate claims if a user disputes the parking session.

**Summary of Purposes:**
*   **Primary:** **Payment Enforcement** (Contract execution, collecting parking fees and penalties).
*   **Secondary:** **Facility Management** (preventing long-term abuse/parking by unauthorized vehicles).
*   **Not Primary:** While we assist police with data requests upon specific legal demand (e.g., theft or damage), "Crime Prevention" or generic "Traffic Management" are not the primary GDPR justifications cited for the systematic processing of *all* users; the focus is strictly on the contractual relationship and property rights.

---

### Q10: Have you conducted a Legitimate Interest Assessment (LIA) or DPIA?
**Context:** If yes, what were the key findings? Did you identify any high risks? What mitigations did you implement?

**Answer:**
Based on our internal documentation and compliance processes, we operate under a strict data protection framework supervised by our Data Protection Officer (DPO).

### 1. Assessment Status
**Yes**, we operate under a defined data protection strategy that includes the assessment of processing risks.
*   **DPO Oversight:** Our data protection compliance is supervised by our external Data Protection Officer, **Richard Metz**.
*   **Legal Basis:** We explicitly cite **GDPR Art. 6 (1) lit. f (Legitimate Interest)** alongside **lit. b (Contract)** in our public-facing documentation (e.g., parking area flyers) to justify the capture of license plates. This confirms that a determination regarding legitimate interest has been made.

### 2. Key Risks Identified
Through our ongoing assessments and DPO consultation, we have identified specific high-risk areas regarding data processing:
*   **Unjustified Keeper Data Requests ("Unberechtigte Halterabfragen"):**
    The most critical risk identified is requesting vehicle owner data (from authorities like the KBA) for a parking session that was not actually a violation (e.g., due to system error or wrong matching). Our DPO has explicitly warned that unauthorized queries constitute a severe breach that could lead to immediate fines ("Bußgeld") by supervisory authorities.
*   **Surveillance Overreach (Image Privacy):**
    There is a risk that cameras might capture data beyond the license plate and vehicle context (e.g., faces of passersby or public streets). Police inquiries have previously flagged instances where privacy filters might have been inactive or insufficient.
*   **Data Retention ("Aufbewahrungszeiten"):**
    Maintaining data longer than necessary, particularly regarding images and "Data Subject Requests" (GDPR Art. 15), is a flagged compliance risk.

### 3. implemented Mitigations
To mitigate these risks, we have implemented the following technical and organizational measures:

*   **Privacy Filters (Blurring):**
    We apply **Privacy Filters** to our camera systems to mask non-relevant image areas (surroundings, faces). We conduct specific checks (e.g., by the TechOps team) to verify that these filters are active and functioning to satisfy data protection requirements,.
*   **Enforcement Release Process ("Nachverfolgungsfreigabe"):**
    To mitigate the risk of unjustified data requests, we utilize a "Release" process. Violations are reviewed (often involving a manual or automated "Approval" step) before a request for owner data is sent to the authority. This ensures that we do not request owner data for cases that are not valid violations,.
*   **Transparency & Information:**
    We place information notices (Flyers/Signs) at parking facilities that clearly explain the data processing: "At entry, only the license plate is recorded... If no violation occurs, data regarding entry and exit is automatically deleted." This ensures transparency for the data subject.
*   **Automated Data Cleanup:**
    We have processes in place to clean area data and ensure that only data linked to financial transactions or active enforcement cases is retained, while non-relevant data is purged.

I can provide further details on our **Technical Operations** regarding camera configuration or our **Enforcement Release** workflows if needed.

---

### Q11: How are users notified before entry?
**Context:** Physical signage at entry point? In-app notification? What does the notice say exactly? (e.g., "CCTV in operation - license plates recorded for access control")

**Answer:**
Based on the internal documentation and project guidelines, users are notified primarily through **physical signage** placed directly at the entry points and throughout the parking facility.

### 1. Physical Signage at Entry (Primary Notification)
Strict "signage guidelines" (Schilder Leitfaden) are followed to ensure legal compliance (contract formation via "implied conduct") and GDPR transparency.

*   **Location:** Signs are mounted at the **entry ("Einfahrt")** at eye level for the driver, ensuring they are clearly visible before entering the facility.
*   **Specific Sign Types:**
    *   **Entry Sign ("Einfahrtsschild"):** Clearly states **"Kostenpflichtiger Parkplatz"** (Paid Parking Lot),.
    *   **T&C & Privacy Sign ("AGB & Datenschutz"):** A specific sign titled **"Einfahrt AGB und Datenschutz"** informs users about the Terms & Conditions and Data Protection policies, specifically regarding the operator and enforcement,.
    *   **Tariff Information:** A separate sign (**"Informationsschild Parktarife"**) details the costs.
    *   **Stop/Payment Sign:** A **"Hinweisschild Zahlungspflicht Stop"** reminds users of the obligation to pay.

### 2. Content of the Notice
The signage explicitly informs the user about the digital nature of the system and the data processing involved.

*   **License Plate Scanning:** The notices explain that **no barrier** is used and that the **license plate is scanned** upon entry and exit to determine the parking duration.
*   **Data Processing:** The text clarifies that only the license plate (not the driver) is recorded for the purpose of calculating fees and, if necessary, enforcing payment (via KBA request for owner data in case of violations).
*   **Video Recording Disclaimer:** It is explicitly stated that **no video recording** takes place (only image captures at entry/exit) and no public ground is recorded.

### 3. In-App Notification
For users of third-party parking apps (EasyPark, Parkster), there are specific settings required:
*   **"CameraPark" / "FreeFlow" Activation:** Users are advised (often via website FAQs or additional on-site stickers) to activate the **"CameraPark"** or **"Kameraparken"** feature in their app. This allows the automatic start/stop of the parking session via the license plate recognition,.
*   **Manual Start/Stop:** For areas without automatic "FreeFlow" integration, users must manually start the session in the app, often identified by a specific **Zone Code** displayed on the signage.

---

## ARCHITECTURE CONTEXT (Critical for Technical Accuracy)

### Q12: Tech Stack Confirmation
Please confirm or correct the following assumptions:

| Component | Assumed Technology | Your Actual Technology |
|-----------|-------------------|------------------------|
| Cloud Provider | AWS | AWS |
| AWS Region(s) | eu-central-1 (Frankfurt) | eu-central-1 |
| Authentication | Auth0 (B2B + B2C) | Auth0 |
| Database | DynamoDB | DynamoDB |
| Relational DB (if any) | RDS PostgreSQL | Aurora PostgreSQL |
| IoT Fleet Management | AWS IoT Core | AWS Iot Core - Teltonika RMS |
| Payment Processor | Stripe | Stripe/Adyen |
| Image Storage | S3 with KMS encryption | S3 with KMS encryption |
| Logging/Monitoring | CloudWatch + (OpsGenie?) | CloudWatch + Datadog |

---

### Q13: Multi-Tenancy Architecture
**Context:** How do you isolate customer data?

- [ ] Database-per-tenant (separate DynamoDB tables per municipality)
- [ ] Row-level security (partition key = tenant_id)
- [ ] Schema-per-tenant (RDS schemas)
- [ ] Other: [DESCRIBE]

**Answer:**
We don't isolate tenants. We have a single database and a single schema. We use row-level security to isolate tenants.

---

### Q14: The Dual-Brand Structure (MHP)
**Context:** You mentioned "MHP Structure" in the PRD. What is MHP?

- Is it a parent holding company?
- Does Brand A (B2C "Bazar"?) operate separately from Brand B (B2B SaaS)?
- How does this legal separation work in practice? (Separate AWS accounts? Separate databases?)

**Answer:**
Based on the internal documentation, here is the breakdown of the **Dual-Brand Strategy** involving Peter Park System GmbH and Mobility Hub Parkservice GmbH (MHP).

### 1. What is MHP?
**MHP (Mobility Hub Parkservice GmbH)** is a **100% subsidiary** (*Tochtergesellschaft*) of Peter Park System GmbH.
*   **It is NOT a parent holding company.** Peter Park System GmbH is the parent company and the B2B technology provider.
*   **Purpose:** MHP serves as the "Enforcement Brand." It allows for a clear separation where the system house (Peter Park) provides the technical infrastructure, while MHP handles the potentially contentious topic of issuing parking penalties and collecting fines.
*   **Customer Journey:** This ensures that end-users (drivers) deal with MHP regarding Parking Charge Notices (PCNs), preventing misunderstandings where drivers might contact the technical provider (Peter Park) regarding legal enforcement issues.

### 2. Operational Separation (Brand A vs. Brand B)
Yes, the operations are separated by function and target audience, though they work in tandem.

*   **Brand A (Peter Park System GmbH - B2B):**
    *   **Role:** Acts as the system house. Responsible for the **technical infrastructure**, hardware (cameras, kiosks), and software solutions (SaaS).
    *   **Customer:** The facility operator (B2B).
    *   **Contracts:** "SaaS" contracts where the customer pays a fee for hardware/software.

*   **Brand B (MHP - B2C / Enforcement):**
    *   **Role:** Responsible for the **enforcement** (*Nachverfolgung*) of parking terms and the "B2C Customer Journey".
    *   **Customer:** The end-user (driver/parker).
    *   **Contracts:** "Full Service" or "SaaS + Nachverfolgung" contracts. MHP acts as the contracting party towards the parker for the usage contract and penalty enforcement,.
    *   **Services:** Includes the "Bazar" service (part of the B2C "Delight" team stack) and the Online Shop/Payment Hub.

### 3. Technical & Legal Separation in Practice
While legally distinct, the technical infrastructure is highly integrated but logically segmented.

**A. Databases & Infrastructure (Shared but Structured)**
*   **Shared Infrastructure:** There is **no evidence of physically separate AWS accounts** for the two brands. The documentation describes a "main-db" (AWS RDS) where various microservices (including `slave_mhp` and `falcon`) are consolidated or replicated,.
*   **Service Ownership:** The technical teams are divided into "Platform" (Infrastructure/Enforcement chain) and "Delight" (B2C facing apps like "Bazar", "Online Shop", "Viking").
*   **Database Schema:** Services related to MHP (like `slave_mhp`) exist as distinct databases or schemas within the main database cluster, rather than totally isolated physical hardware.

**B. Identity Management (Auth0 - Separated)**
*   **Separate Tenants:** We utilize **Auth0** for identity management with separate tenants to distinguish user pools:
    *   **B2B Tenant:** `team-fk4xza2` (for Dashboard, ACT).
    *   **B2C Tenant:** `team-izpsgyb` (for Online Shop/Bazar).
*   **Role-Based Access Control (RBAC):** Inside the B2B dashboard, specific roles distinguish between SaaS customers and MHP customers (e.g., `mhp_full_service_pcn_share` vs. `saas_no_pcn_share`) to control visibility of enforcement data.

**C. Financial Flows**
*   **Contractual Separation:** Contracts allow Peter Park to transfer enforcement duties to an affiliated company (MHP).
*   **Invoicing:** In "Full Service" models, MHP takes care of the whole cycle and the customer receives a percentage of revenue. In "SaaS" models, the customer pays Peter Park a fee for the tech, while MHP might handle enforcement under a separate agreement,.

**Summary for Audit:**
MHP is a wholly-owned subsidiary used to legally decouple the "technology provider" persona from the "enforcement/penalty" persona. While they share a cloud technical foundation (AWS/RDS), they are logically separated via Auth0 tenants, specific microservices (e.g., Bazar for B2C), and distinct legal contracts.

---

## ADDITIONAL CONTEXT (Optional but Helpful)

### Q15: Any other technical or legal details I should know?
**Context:** Unique edge cases, proprietary algorithms, special regulatory approvals, etc.

**Answer:**
Based on the internal knowledge base, here are the critical technical, legal, and operational nuances relevant to a NIS2 audit, specifically regarding proprietary technology, regulatory exemptions, and edge-case handling.

### 1. Proprietary Technologies & Algorithms

*   **"Honest Payment" Fallback Logic:**
    This is a critical failsafe algorithm in our kiosk software ("Viking") and backend ("Orbiter"). If a customer enters their license plate at the kiosk and the system *cannot* find an entry image (due to camera failure or occlusion), the system does not block the payment. Instead, it switches to "Honest Payment" mode, allowing the user to manually select their arrival time and pay. This ensures revenue continuity even during partial sensor failure,,.
*   **"Unified Observation Consumer" (UOI) & Voting:**
    We do not rely on a single ANPR reading. Our "Unified Observation Consumer" aggregates data from multiple ML models (internally named "Outrider", "ALPRv2", "ALPRv3", "ALPRv4") and performs a **voting process** to determine the most likely correct license plate string, vehicle make, and orientation before storing the data. This reduces false positives in enforcement,.
*   **"Pool Parking" (Grouping) & Profiling Risks:**
    We developed a logic called "Car Pooling" or "Grouping" to track shared parking spots (e.g., a company rents 5 spots for 50 employees). The system tracks how many cars from a specific "Group" are currently entered to enforce limits. **Audit Note:** This feature has been internally flagged for potential GDPR issues regarding "profiling" and sales teams have been advised to stop selling it aggressively due to complexity and data privacy concerns,.
*   **"Picard" (Door Opener):**
    We deploy Raspberry Pis (running a project named "Picard") to physically trigger barriers or door buzzers via GPIO pins. This logic checks if a specific license plate is authorized (e.g., a whitelist entry) before sending the electrical signal to open a gate,.

### 2. Specific Regulatory Approvals & Exemptions

*   **KassenSichV Exemption (Fiscal Law):**
    While Germany has strict anti-tampering laws for cash registers (Kassensicherungsverordnung), our parking ticket machines and charging stations are explicitly **exempt** from this regulation. We do not require the specific technical security device (TSE) used in retail.
*   **PCI DSS Level 4:**
    We maintain PCI DSS Level 4 compliance for our card payments. We process payments via **Elavon** or **NMI** using specific terminal hardware (Feig, Ingenico). The terminals use Point-to-Point Encryption (P2PE), ensuring we do not store raw cardholder data in our electronic forms,.
*   **KBA Interface (Germany):**
    We have a specialized, automated interface with the **Kraftfahrt-Bundesamt (KBA)** to retrieve vehicle owner data for violations. This requires a specific legal power of attorney ("Vollmacht") for *every* individual parking area to be filed and approved before data retrieval is permitted,,.
*   **"Richterliches Verbot" (Switzerland):**
    For operations in Switzerland, we often require a "Richterliches Verbot" (judicial ban) obtained from a civil court for the specific property. This legal instrument is necessary in many Cantons to enforce parking fines and request owner data from authorities,.

### 3. Operational Edge Cases

*   **"FreeFlow" vs. "Manual" App Integration:**
    We support two distinct modes with third-party apps (EasyPark/Parkster):
    *   **FreeFlow (CameraPark):** The camera automatically starts/stops the session via API callbacks.
    *   **Manual:** The user must manually start the session in the app. If they forget, they might receive a penalty even if registered, requiring complex reconciliation logic,,.
*   **Special License Plates:**
    *   **E-Plates (Electric):** In Germany, these end with an "E". If a user or the OCR fails to capture the "E", it can lead to false enforcement if the car was entitled to free parking (common in municipalities like Dangast). We often have to manually correct these or set up specific rules,.
    *   **Diplomatic/Police:** Generally processed but often require manual "Whitelisting" or cancellation as enforcement against these groups is politically sensitive or legally restricted.
*   **Canary Deployments:**
    For firmware and software updates to our IoT fleet (Kiosks), we utilize a "Canary" deployment strategy. Updates are pushed to a small, defined group of "Canary" kiosks (e.g., internal office kiosks, specific low-risk sites) before a general rollout to production to mitigate the risk of fleet-wide bricking.

### 4. International Data Handling (Cross-Border)

*   **Austria (Bezirkshauptmannschaften):** Unlike the centralized KBA in Germany, data retrieval in Austria is decentralized. We must interface with 79 different "Bezirkshauptmannschaften" (District Authorities), each potentially having different requirements for data disclosure.
*   **Switzerland (Cantons):** Similar to Austria, data requests are handled at the Cantonal level (e.g., Strassenverkehrsamt), often requiring manual forms or specific API integrations like "Axiom" or "Viacar" depending on the region,.

---

## WHEN YOU'RE DONE
Save this file and notify Ralph. I will proceed to:
1. Research public NIS2/GDPR standards
2. Compile `dossier_chapter_1.md`
3. Generate scene cards
4. Write Chapter 1

**Status:** 🔴 Blocked (Waiting for Oracle Answers)
