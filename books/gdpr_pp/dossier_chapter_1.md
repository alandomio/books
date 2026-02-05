# 📂 DOSSIER: Chapter 1 - The "Invisible Barrier" Strategy

**Status:** Compiled
**Sources:** Oracle Questions (Internal) + EDPB/ICO (Public)
**Target Audience:** Cloud Architects, Product Owners
**Purpose:** Factual foundation for Chapter 1 (Scenes A, B, C)

---

## PART 1: THE PRODUCT (FreeFlow/CameraPark)

### What is FreeFlow?
**Internal Name:** "FreeFlow" or "CameraPark" (Kameraparken)
**Definition:** A barrier-free parking technology where entry/exit are automatically activated via Automatic Number Plate Recognition (ANPR/ALPR). Users enter and leave without interacting with barriers or ticket machines, provided they have activated the function in a supported parking app (EasyPark, Parkster).

**Technical Flow:**
1. **Observation:** Camera recognizes license plate → sends data to `/observe` endpoint (Falcon backend)
2. **Verification:** System calls partner API (e.g., EasyPark `/external/parkings/start`) to verify ANPR is active
3. **Session Start:** If successful, stay is created in Peter Park system (some partners like Parkster use Redis cache + callback)
4. **Session End:** Upon exit, pricing engine calculates fee → calls partner API (`/external/parkings/stop`)

**Supported Partners:**
- EasyPark: Full FreeFlow support
- Parkster: Full FreeFlow support
- PayByPhone: Prepaid only (no FreeFlow)

**Hybrid Mode:** "Manual Freeflow" (EasyPark) - user manually starts via app, but system links to camera observation.

**Hardware Requirements:** Virtual Cameras must be configured with `freeflow_position: entry` and `freeflow_position: exit` when physical cameras cover both directions.

### What Physical Barriers are Being Replaced?
- **Boom Gates (Schranken):** Primary target. System is marketed as "barrier-free" (schrankenlos/schrankenfrei)
- **Paper Tickets:** Eliminates entry columns that issue plastic/paper tickets
- **Pay-and-Display Machines (Parkscheinautomaten):** Replaced in municipalities like Plüderhausen
- **Manual Patrols:** Reduces need for manual enforcement personnel

**Marketing Benefit:** Elimination of "Stau vor der Schranke" (congestion in front of barrier).

### Target Market (B2B Only)
**Four Primary Verticals:**

1. **Municipalities & Public Infrastructure**
   - Municipalities (Gemeinden), Public Utilities (Stadtwerke)
   - Transportation Hubs: Airports (Hannover, Nürnberg, Memmingen), Train Stations, Ferry Terminals

2. **Retail & Commercial Real Estate**
   - Supermarkets: Lidl (key account), Edeka, Rewe, Aldi
   - Shopping Centers, Hardware stores (OBI), Furniture stores (Mömax)
   - Fitness centers, Business campuses

3. **Healthcare (Krankenhäuser)**
   - Hospitals (Helios, Vamed), Regional clinics, Medical centers

4. **Tourism & Recreation**
   - Mountain Railways (Bergbahnen), Ski Resorts (Hintertux, Wurmberg)
   - Lakes, Thermal Baths, Hotels, Event Venues

5. **Residential & Campus**
   - Housing associations, University campuses (Johann-Goethe-Universität Frankfurt)

---

## PART 2: THE TECHNOLOGY (ANPR Hardware & Processing)

### ANPR Hardware (Vendors & Models)

**A. Axis Communications (Premium)**
- Runs **FF Group "CAMMRA LPR Lite"** app on-camera (edge processing)
- Models:
  - **Axis Q1785-LE / Q1700:** Long distance (>17m) - airports, large retail
  - **Axis P1455-LE (29mm):** Medium distance (9-17m)
  - **Axis P1455-LE (9mm):** Short distance (<9m) - garages, confined entries

**B. Dahua Technology (Cost-Efficient)**
- Requires external Nvidia Jetson for processing (unlike Axis)
- Model: **Dahua IPC-HFW5241E-Z12E** (12mm for <5m, 60mm for 5-20m)

**C. Processing Hardware (Edge Computing)**
- **Nvidia Jetson Nano (4GB):** Standard processing unit
- **Nvidia Jetson TX2 (4GB/NX):** High-performance requirements
- **Nvidia Orin Nano:** Newer "Developer Experience" phase

**Special Configurations:**
- **Hawk Eye (Überkreuzscan):** Two cameras (Axis + Dahua) scan front AND rear to ensure capture
- **Virtual Cameras:** Software-defined logical separation of entry/exit from single physical stream

### Where is Image Processing Done? (Hybrid Edge + Cloud)

**1. Edge Processing (On-Site)**
- **On-Camera (Axis):** FF Group "CAMMRA LPR Lite" handles detection + OCR locally before sending to backend
- **On-Premise Gateway (Nvidia Jetson):** For Dahua cameras, processes video via custom "Jetstream" application using Nvidia DeepStream + YOLO models (TensorRT engines)

**2. Cloud Processing (AWS - Serverless ML)**
- **Unified Observation Consumer:** Central processor that calls ML "plugins" for validation
- **Secondary/Cloud ALPR Models:**
  - **Outrider:** Legacy baseline (YOLOv5)
  - **ALPRv2/v3/v4:** Newer services (YOLOv8, YOLOv9) for improved accuracy, night-time optimization
- **Advanced Classification:**
  - **PCR (Plate Country Recognition):** ConvNext model
  - **VTR (Vehicle Type Recognition):** YOLOv8 (car, truck, motorcycle)
  - **VOD (Vehicle Orientation Detection):** YOLOv5 (front/back)

**3. Third-Party APIs**
- **OpenALPR:** Paid API for **Vehicle Make Recognition (VMR)** - Make, Model, Color (cost-limited to percentage of vehicles per area)

---

## PART 3: DATA STORAGE & RETENTION

### What Data is Stored? (The "Observation" Object)

**1. Visual Data (Images stored in S3)**
- **License Plate Crop:** Specific image crop of detected plate
- **Context Image:** Vehicle image with **blur applied** (anonymizes faces/surrounding areas via Image Service) before storage in `unified-evidences` S3 bucket
- **No Video Recording:** System only captures text files + snapshots upon entry/exit events (not continuous recording)

**2. Alphanumeric & Temporal Data (DynamoDB + RDS)**
- License Plate String (recognized alphanumeric)
- Timestamps (entry/exit times for duration calculation)
- Confidence Scores:
  - `box_confidence` (plate detection confidence)
  - `character_confidences` (per-character confidence)
  - `country_confidence` (plate country confidence)
- Location Data: Linked to Area Entity ID (static longitude/latitude of facility)

**3. Vehicle Metadata (ML Enrichment)**
- Vehicle Orientation (Front/Back)
- Vehicle Type (Car, Truck, Motorcycle, Van)
- Country of Origin (e.g., DE, AT, CH)
- Vehicle Make/Model (limited to tracking rate % per area due to OpenALPR cost)

### S3 Storage Details

**Buckets:**
- `pp-unified-evidences-*`: Processed images for enforcement (blurred)
- `pp-unified-observations-*`: Processing pipeline
- `ml-labelled-data`: ML training data

**Encryption:** AWS KMS (Customer Managed Keys for RDS snapshots: `arn:aws:kms:eu-central-1:870191396401:alias/rds-cross-account`)

**Storage Class:** Not explicitly documented (likely Standard, but S3 costs flagged as "rapidly growing" in June 2024 Cost Explorer - indicates need for lifecycle policies/Intelligent-Tiering)

**Access Control:** IAM roles + AWS SigV4 authentication for inter-service communication

### The 48-Hour Deletion Mechanism (GDPR Service)

**NOT** DynamoDB TTL or S3 Lifecycle Policy. It's an **application-level queue-based process**.

**Technical Flow:**
1. **Classification:** Payment Reconciliation Service identifies "Free Stays" (no payment required, not a violation)
2. **Delay Mechanism:** Free stays are pushed to GDPR Service queue with **48-hour delay**
3. **Execution:** After 48h elapsed, GDPR Service consumes message and:
   - Deletes S3 objects (images/evidence)
   - Anonymizes license plate data in `stays` database table

**Scope:** Currently applies to **Free Stays only**. Paid stays and non-paid stays (violations) do NOT have automated deletion support yet.

---

## PART 4: LEGAL BASIS (GDPR Art. 6(1))

### Internal Justification (Legitimate Interest - Art. 6(1)(f))

**Primary Purposes:**
1. **Payment Enforcement (Art. 6(1)(b) + 6(1)(f)):**
   - By entering, driver enters implied contract (konkludentes Handeln) with operator
   - Processing license plate documents stay duration to calculate fee and enforce contractual penalty (Vertragsstrafe) or usage fee (Nutzungsentgelt)
   - Legitimate interest in obtaining vehicle owner data from authorities (KBA) to pursue civil claims

2. **Protection of Property Rights (Besitzstörung - Art. 6(1)(f)):**
   - Operator has legitimate interest protecting private property against unauthorized use
   - Vehicle holder responsible for "disturbances of possession" by their vehicle
   - Allows operator to assert injunctive relief (Unterlassungsansprüche) against future violations

3. **Evidence & Burden of Proof:**
   - System records entry/exit timestamps to mathematically prove parking duration
   - Documentation required to substantiate claims if user disputes session

**NOT Primary Justifications:**
- Crime Prevention (only secondary - assist police upon specific legal demand)
- Traffic Management (not systematic justification for all users)

### Risk Assessment (Internal DPIA/LIA)

**Status:** Supervised by external DPO **Richard Metz**. GDPR Art. 6(1)(f) explicitly cited in public documentation (parking flyers).

**Key Risks Identified:**
1. **Unjustified Keeper Data Requests ("Unberechtigte Halterabfragen"):**
   - Most critical risk: requesting vehicle owner data (from KBA) for non-violations due to system error
   - DPO warning: unauthorized queries = severe breach → immediate fines (Bußgeld)

2. **Surveillance Overreach (Image Privacy):**
   - Risk of capturing non-relevant data (faces, public streets)
   - Police inquiries flagged instances where privacy filters might be inactive

3. **Data Retention:**
   - Maintaining data longer than necessary (particularly images and Data Subject Requests under Art. 15)

**Mitigations Implemented:**
1. **Privacy Filters (Blurring):** Applied via Image Service before storage. TechOps conducts checks to verify filters are active
2. **Enforcement Release Process:** Manual/automated "Approval" step before sending owner data requests to KBA to prevent unjustified queries
3. **Transparency & Information:** Physical signage at entries clearly explains data processing: "At entry, only the license plate is recorded... If no violation occurs, data regarding entry and exit is automatically deleted"
4. **Automated Data Cleanup:** Processes to purge non-relevant data while retaining only enforcement cases

---

## PART 5: PUBLIC LEGAL STANDARDS (EDPB/ICO)

### EDPB Guidelines 1/2024 (Legitimate Interest)

**Issued:** October 2024
**Source:** European Data Protection Board

**Three-Part Test for Art. 6(1)(f):**
1. **Pursuit of Legitimate Interest:** Controller or third party must have legitimate interest that is lawful, clearly articulated, real and present (not speculative)
2. **Necessity:** Processing must be strictly necessary for purposes of legitimate interests
3. **Balancing Test:** Interests or fundamental rights of data subjects must NOT take precedence over legitimate interests of controller

**Requirement:** Controllers must conduct **Legitimate Interest Assessment (LIA)** addressing necessity and balancing of interests.

### EDPB Video Surveillance Guidelines (3/2019)

**Key Principle:** Use of biometric data (especially facial recognition) entails heightened risks. Must respect lawfulness, necessity, proportionality, and **data minimization** as per GDPR.

### ICO ANPR Guidance (UK)

**Requirements:**
- Conduct **Data Protection Impact Assessment (DPIA)** that fully addresses ANPR use
- Explore impact on rights and freedoms of individuals
- Data retention limits critical

**Real-World Example:** York & Scarborough Teaching Hospitals NHS Foundation Trust cites Art. 6(1)(f) for ANPR parking management, specifically for:
- Parking management
- Crime prevention/investigation
- Protecting staff, visitors, premises

### Privacy-by-Design Principles for ANPR

**Data Minimization:**
- Capture ONLY essential information (license plate numbers for intended application)
- Do NOT store additional unnecessary personal information

**Data Retention Limits:**
- Automated retention policies (maximum 60 days default for general ALPR data)
- Delete data once no longer needed

**Access Controls:**
- Restrict to trained/authorized users
- Specific and approved authorization for lawful purpose

**System Design:**
- Minimize number of cameras (fully justifiable locations)
- Place cameras to avoid accidentally capturing irrelevant vehicles

**Legal Precedent:**
- **German Federal Constitutional Court (2008):** Retention of number plate data without pre-destined use violates right to privacy
- **GDPR Compliance:** Added strict requirements for ANPR utilization

---

## PART 6: TECH STACK CONFIRMATION

| Component | Technology | Details |
|-----------|-----------|---------|
| **Cloud Provider** | AWS | eu-central-1 (Frankfurt) |
| **Authentication** | Auth0 | Separate tenants: B2B (`team-fk4xza2`), B2C (`team-izpsgyb`) |
| **Database (NoSQL)** | DynamoDB | Metadata storage |
| **Database (Relational)** | Aurora PostgreSQL | "main-db" (RDS) with service-specific schemas |
| **IoT Fleet Management** | AWS IoT Core | + Teltonika RMS |
| **Payment Processors** | Stripe, Adyen | Elavon/NMI for kiosks |
| **Image Storage** | S3 with KMS encryption | CMK: `arn:aws:kms:eu-central-1:870191396401:alias/rds-cross-account` |
| **Logging/Monitoring** | CloudWatch + Datadog | (not OpsGenie) |
| **Edge Computing** | Nvidia Jetson (Nano, TX2, Orin) | Runs "Jetstream" app with DeepStream + YOLO |

**Multi-Tenancy:** Single database + single schema. Row-level security via partition key (no database-per-tenant or schema-per-tenant).

---

## PART 7: THE DUAL-BRAND STRUCTURE (MHP)

### What is MHP?
**MHP (Mobility Hub Parkservice GmbH):** 100% subsidiary of Peter Park System GmbH. NOT a parent holding company.

**Purpose:** "Enforcement Brand" - legal separation where:
- **Peter Park System GmbH:** B2B tech provider (system house, SaaS)
- **MHP:** B2C enforcement (issues Parking Charge Notices, collects fines)

**Customer Journey:**
- Drivers deal with MHP for penalties (not tech provider Peter Park)
- Prevents misunderstandings where drivers contact wrong entity

### Operational Separation

**Brand A (Peter Park - B2B):**
- System house: technical infrastructure, hardware, software
- Customer: Facility operator (B2B contracts)
- Contracts: SaaS fees for hardware/software

**Brand B (MHP - B2C):**
- Enforcement: issues PCNs, manages payment collections
- Customer: End-user (driver/parker)
- Contracts: "Full Service" or "SaaS + Nachverfolgung" (enforcement)
- Services: Includes "Bazar" (B2C Delight team), Online Shop, Payment Hub

### Technical & Legal Separation

**Databases & Infrastructure:**
- **Shared AWS infrastructure** (NO separate AWS accounts for brands)
- **Service ownership:** Teams divided into "Platform" (Infrastructure/Enforcement) and "Delight" (B2C apps)
- **Database schemas:** MHP services (e.g., `slave_mhp`) exist as distinct databases/schemas within main RDS cluster (not isolated physical hardware)

**Identity Management (Auth0):**
- **Separate tenants** for user pools:
  - B2B Tenant: `team-fk4xza2` (Dashboard, ACT)
  - B2C Tenant: `team-izpsgyb` (Online Shop, Bazar)
- **RBAC:** Roles distinguish SaaS vs. MHP customers (e.g., `mhp_full_service_pcn_share` vs. `saas_no_pcn_share`) to control visibility of enforcement data

**Financial Flows:**
- Contracts allow Peter Park to transfer enforcement to MHP
- Invoicing: Full Service = MHP handles cycle + revenue share; SaaS = customer pays Peter Park tech fee + separate MHP enforcement agreement

---

## PART 8: USER NOTIFICATION (Transparency)

### Physical Signage (Primary)
**Location:** Entry points at eye level before driver enters facility

**Specific Sign Types:**
1. **Entry Sign:** "Kostenpflichtiger Parkplatz" (Paid Parking)
2. **T&C & Privacy Sign:** "Einfahrt AGB und Datenschutz" (Terms & Data Protection) - explains operator, enforcement
3. **Tariff Information:** "Informationsschild Parktarife" (pricing)
4. **Stop/Payment Sign:** "Hinweisschild Zahlungspflicht Stop" (payment obligation)

**Content:**
- No barrier used
- License plate scanned at entry/exit to determine parking duration
- Only plate recorded (not driver) for calculating fees and enforcing payment (KBA request for owner data if violation)
- **Video Recording Disclaimer:** NO video recording (only snapshots at entry/exit), no public ground recorded

### In-App Notification
**For third-party app users (EasyPark, Parkster):**
- Must activate **"CameraPark"/"Kameraparken"** feature in app for automatic start/stop
- Manual areas require user to start session via app using **Zone Code** displayed on signage

---

## PART 9: EDGE CASES & PROPRIETARY TECH

### Proprietary Algorithms
1. **"Honest Payment" Fallback:** Kiosk (Viking) + backend (Orbiter) allow users to manually select arrival time and pay if system can't find entry image (camera failure/occlusion) - ensures revenue continuity during sensor failure

2. **"Unified Observation Consumer" Voting:** Aggregates multiple ML model readings (Outrider, ALPRv2/v3/v4), performs voting to determine most likely correct plate string, reducing false positives

3. **"Pool Parking" (Grouping):** Tracks shared spots (e.g., company rents 5 spots for 50 employees). **GDPR Flag:** Internally flagged for potential profiling issues; sales teams advised to stop aggressive selling due to complexity/privacy concerns

4. **"Picard" (Door Opener):** Raspberry Pi triggers barriers/door buzzers via GPIO pins, checks whitelist authorization before opening

### Regulatory Approvals
- **KassenSichV Exemption:** Parking machines exempt from German fiscal anti-tampering law (no TSE required)
- **PCI DSS Level 4:** Maintained for card payments via Elavon/NMI terminals (Feig, Ingenico) using P2PE
- **KBA Interface (Germany):** Automated interface with Kraftfahrt-Bundesamt for owner data retrieval; requires legal power of attorney (Vollmacht) per parking area
- **"Richterliches Verbot" (Switzerland):** Judicial ban from civil court required in many Cantons for enforcement + owner data requests

### Operational Edge Cases
- **E-Plates (Electric):** End with "E" in Germany; if OCR misses "E", may cause false enforcement (common in Dangast)
- **Diplomatic/Police Plates:** Often require manual whitelisting or cancellation
- **Canary Deployments:** Firmware updates pushed to small "Canary" group (office kiosks, low-risk sites) before production rollout to prevent fleet-wide bricking

### International Data Handling
- **Austria:** Decentralized - interface with 79 different Bezirkshauptmannschaften (District Authorities)
- **Switzerland:** Cantonal level requests (Strassenverkehrsamt), often manual forms or region-specific APIs (Axiom, Viacar)

---

## END OF DOSSIER
**Next Step:** Generate Scene Cards for Chapter 1 (A, B, C)
