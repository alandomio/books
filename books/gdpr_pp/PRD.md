# 📑 PRD: Compliance as a Product

**Status:** Draft
**Target:** Product Owners, Cloud Architects
**Vibe:** Strategic, Technical, Invisible Compliance

## 1. PROJECT OVERVIEW
This project aims to write the book *Compliance as a Product* using the "Ralph Wiggum" agentic loop.
The goal is to produce high-quality, technically accurate, and strategically sound content that bridges the gap between Legal (NIS2/GDPR) and Product/Engineering.

## 2. THE CHECKLIST (BACKLOG)
Mark tasks as `[x]` when completed.

### Part I: The Product Vision & Legal Framework
- [x] **Chapter 1: The "Invisible Barrier" Strategy**
    - [x] **Section A (Concept):** Pitching "FreeFlow" vs. Physical Barriers. The UX of invisibility.
    - [x] **Section B (Tech):** ANPR Technology & Privacy Impact. How to design it without being a surveillance state.
    - [x] **Section C (Legal):** The "Legitimate Interest" defense (GDPR Art. 6(1)(f)).
- [x] **Chapter 2: The Dual-Brand Product Architecture**
    - [x] **Section A (Strategy):** Why B2B SaaS needs a "Risk Buffer". The MHP Structure.
    - [x] **Section B (Tech):** Multi-tenant architecture considerations for separating Liability.

### Part II: Building the Compliant Backlog
- [ ] **Chapter 3: Privacy as a Feature**
    - [ ] **Section A (Product):** Shifting the roadmap from "Data Retention" to "Data Destruction".
    - [ ] **Section B (Tech):** Designing TTL (Time To Live) policies in DynamoDB/S3.
- [ ] **Chapter 4: The 48-Hour Deletion Logic**
    - [ ] **Section A (Process):** The "Data Minimization" masterclass.
    - [ ] **Section B (Tech):** Implementing the 48h purge loop. Serverless Lambdas vs. Cron Jobs. Reliability patterns.
- [ ] **Chapter 5: Identity & Multi-Tenancy**
    - [ ] **Section A (User):** Admin roles vs. Municipality roles.
    - [ ] **Section B (Tech):** Auth0 integration, JWT claims, and RBAC implementation details.

### Part III: Technical Excellence for Product Leaders
- [ ] **Chapter 6: NIS2: The New "Definition of Done"**
    - [ ] **Section A (Strategy):** The "Resilience Budget". Explaining NIS2 to stakeholders.
    - [ ] **Section B (Tech):** Incident reporting pipelines (EventBridge to OpsGenie).
- [ ] **Chapter 7: Payment UX vs. PCI Compliance**
    - [ ] **Section A (UX):** The "Post-Payment" flow (Bazar). Frictionless vs. Secure.
    - [ ] **Section B (Tech):** Tokenization, PCI-DSS scope reduction, and API security.
- [ ] **Chapter 8: IoT Fleet Management**
    - [ ] **Section A (Ops):** Managing 1,000+ cameras.
    - [ ] **Section B (Tech):** IoT Core, mTLS certificates, "Secure-by-default" provisioning.

### Part IV: Operations & Growth
- [ ] **Chapter 9: The Automated Enforcement Pipeline**
    - [ ] **Section A (Process):** HAlterdaten (PII) interface with KBA.
    - [ ] **Section B (Tech):** Batch processing, secure file transfer (SFTP/S3), and audit logging.
- [ ] **Chapter 10: Scaling to Municipalities**
    - [ ] **Section A (Sales):** The Security Helpbook as a sales tool. Winning government contracts.
    - [ ] **Section B (Summary):** The "Compliance Moat".

## 3. SUCCESS METRICS (DEFINITION OF DONE)
*   **Technical Accuracy:** Cloud Architects must nod in agreement. No made-up terms.
*   **Strategic Value:** Head of Product must see revenue potential.
*   **Audience:** Written for the "Smart Skeptic".

## 4. RESOURCES
*   `INSTRUCTION.md`: The Agents and Tone.
*   `oracle_questions.md`: The Q&A with the User.
*   `dossier_*.md`: The research files.
