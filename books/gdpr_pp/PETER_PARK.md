Hello. As requested for the NIS2 audit, I will outline our business operations, the specific nature of our services, and a detailed breakdown of the data types we handle within our ecosystem.
1. Company Business Overview
Core Business Model Peter Park System GmbH acts as a system house providing digital, barrier-free parking management solutions. Our primary mission is to replace traditional barrier-based systems with cloud-based license plate recognition technology (ALPR/ANPR). We position ourselves as a technology provider for digital infrastructure and software solutions.
Dual-Brand Strategy & Legal Structure To ensure clear separation between technical provision and enforcement, we operate a two-brand strategy:
• Peter Park System GmbH: Responsible for the technical infrastructure, hardware (cameras, kiosks), and the software platform (SaaS).
• Mobility Hub Parkservice GmbH (MHP): A 100% subsidiary responsible for the enforcement of parking terms. MHP handles the issuance of Parking Charge Notices (PCN) for parking violations (non-payment or overstaying). This separation ensures that end-users (drivers) deal with MHP regarding penalties, while Peter Park remains the B2B technology partner.
Customer Segments & Service Models We serve a wide range of B2B clients, including municipalities ("Kommunen"), hospitals, supermarkets (retail), tourism operators (ski resorts, lakes), and real estate developers. Our contractual models generally fall into three categories:
1. Full Service (MHP): We manage the entire cycle, including enforcement. The customer receives a percentage of parking and violation fees.
2. SaaS + Enforcement: The customer pays a fee for hardware/software and keeps parking revenue, while MHP handles enforcement under a separate contract.
3. SaaS Only: The customer uses our hardware/software but manages operations and profits themselves.
2. Operational Data Handling
Our systems process high volumes of data to facilitate "FreeFlow" parking, where entry and exit are automatically recorded without barriers.
A. Vehicle and Movement Data (Observations & Stays)
• Data Capture: Our cameras capture images of vehicle license plates at entry and exit points. These events are termed "Observations".
• Processing: Observations are sent to our "Unified Observation Consumer" (UOI) service, which converts camera-specific formats into a common format for processing.
• Matching: The system matches entry and exit observations to calculate the duration of a "Stay".
• Storage: Images and context data are stored in cloud infrastructure (AWS S3 and DynamoDB).
B. Payment and Financial Data We handle various streams of financial data through multiple integration points:
• On-Site Payments: Users pay at kiosks via card or cash. For card payments, we utilize terminals (e.g., Feig, Ingenico) and payment processors like NMI or Elavon. We maintain PCI DSS Level 4 certification compliance for these transactions.
• Mobile Payments: We integrate with third-party parking apps such as EasyPark, Parkster, and PayByPhone. These partners transmit transaction data to us to validate parking sessions.
• Post-Payment: We offer a "Post Payment" feature allowing users to pay online within 24 hours after leaving. This is handled by our "Bazar" backend service, utilizing payment providers like Stripe or Secupay.
• Transaction Matching: We perform payment reconciliation to match payments against calculated stays to determine if a violation occurred.
C. Personal Data (PII) & Enforcement Data When a parking violation occurs (non-payment or overstay), we process specific PII to enforce the contract:
• Vehicle Owner Data: For enforcement, we request vehicle owner information ("Halterdaten") from relevant authorities (e.g., KBA in Germany). This process is often automated via interfaces or batch processing.
• Parking Charge Notices (PCNs): We generate and mail payment requests to violators. This involves processing names, addresses, and specific violation details (time, location, photos).
• GDPR (DSGVO) Compliance: We have strict retention policies. For standard parking processes where payment occurs correctly, data regarding entry/exit and license plate images is typically deleted after 48 hours.
D. User and Access Data
• Identity Management: We use Auth0 for authentication and authorization of all users, including internal employees, B2B customers, and B2C users.
• Customer Databases: We maintain databases of B2B customer contacts, contract details, and technical configurations (e.g., HubSpot, internal Dashboards).
• Whitelists/Long-term Parkers: We manage lists of "Permit" holders (e.g., employees, residents) who are exempt from payment or have special rates.
3. Technical Infrastructure Overview
To protect this data, our architecture is cloud-native and microservice-based:
• Cloud Provider: We primarily utilize AWS (Amazon Web Services) for infrastructure, including EKS (Kubernetes), Lambda, and S3.
• IoT Connectivity: We manage a fleet of IoT devices (cameras, kiosks, routers) that communicate securely with our cloud backend.
• Service Communication: Internal services communicate via REST APIs and message queues (RabbitMQ, SQS).
I hope this provides a sufficient overview of our business scope and data landscape for your audit. Are there specific areas regarding our data retention policies or payment security you would like to examine next?