# 📂 DOSSIER: Chapter 2 - The Dual-Brand Product Architecture

**Status:** Compiled
**Sources:** Oracle Questions Q12-Q14 (Internal)
**Target Audience:** Product Owners, Cloud Architects, Legal/Compliance Teams
**Purpose:** Factual foundation for Chapter 2 (Sections A, B)

---

## PART 1: THE MHP STRUCTURE (DUAL-BRAND STRATEGY)

### What is MHP?

**MHP (Mobility Hub Parkservice GmbH):** A **100% subsidiary** (*Tochtergesellschaft*) of Peter Park System GmbH.

**Critical Clarification:** MHP is NOT a parent holding company. Peter Park System GmbH is the parent company and the B2B technology provider.

### Strategic Purpose

MHP serves as the **"Enforcement Brand"** to create legal and reputational separation:

**Why This Separation Matters:**
- The system house (Peter Park) provides technical infrastructure
- MHP handles the potentially contentious enforcement (issuing Parking Charge Notices, collecting fines)
- End-users (drivers) deal with MHP regarding penalties
- Prevents misunderstandings where drivers contact the technical provider regarding legal enforcement issues

**Customer Journey Implications:**
- B2B customers (municipalities, hospitals, retailers) buy infrastructure from Peter Park
- When drivers receive parking penalties, they interact with MHP (not the municipality that deployed the system)
- This protects the SaaS brand reputation from enforcement complaints

---

## PART 2: OPERATIONAL SEPARATION (BRAND A VS. BRAND B)

### Brand A: Peter Park System GmbH (B2B SaaS Provider)

**Role:** System house and technology provider

**Responsibilities:**
- Technical infrastructure design and deployment
- Hardware provision (cameras, kiosks, edge devices)
- Software solutions (SaaS platform, backend services)
- Installation and configuration

**Target Customer:** Facility operators (B2B)

**Contract Type:** "SaaS" contracts where customer pays fee for hardware/software
- Customer receives technical infrastructure
- Customer may handle their own enforcement (in SaaS-only model)
- Customer pays fixed fee for technology platform

### Brand B: MHP (B2C Enforcement & Operations)

**Role:** Enforcement operations and B2C customer journey

**Responsibilities:**
- Enforcement (*Nachverfolgung*) of parking terms
- Issuing Parking Charge Notices (PCNs)
- Payment collections
- Customer support for drivers/parkers
- "Bazar" service (B2C payment interface)
- Online Shop / Payment Hub

**Target Customer:** End-user (driver/parker)

**Contract Types:**
1. **"Full Service":** MHP handles entire enforcement cycle + revenue share with operator
2. **"SaaS + Nachverfolgung":** Peter Park provides tech, MHP handles enforcement under separate agreement

**Services Owned by MHP:**
- **Bazar:** B2C payment platform (part of "Delight" team stack)
- **Online Shop:** Payment portal for PCNs
- **Payment Hub:** Financial transaction processing

---

## PART 3: TECHNICAL & LEGAL SEPARATION (HOW IT WORKS)

### A. Databases & Infrastructure (Shared but Logically Segmented)

**Key Finding:** There is **NO separate AWS account** for Peter Park vs. MHP.

**Architecture:**
- **Shared AWS Infrastructure:** Both brands operate within same cloud environment
- **Main Database:** AWS RDS Aurora PostgreSQL ("main-db")
- **Service-Specific Databases/Schemas:**
  - `slave_mhp`: MHP-specific database or schema within main cluster
  - `falcon`: Core backend services
  - Services are consolidated or replicated within main DB cluster

**Why Shared Infrastructure:**
- Cost efficiency (avoid duplicating compute, storage, networking)
- Operational efficiency (single deployment pipeline, unified monitoring)
- Data sharing where necessary (enforcement needs observation data from cameras)

**Trade-off:**
- Requires careful RBAC (Role-Based Access Control) to prevent cross-tenant data leakage
- Must ensure SaaS customers cannot see MHP enforcement data from other tenants

### B. Identity Management (Auth0 - Separated Tenants)

**Critical Separation Point:** Auth0 tenants are the primary mechanism for logical brand separation.

**Auth0 Configuration:**

| Brand | Auth0 Tenant ID | Purpose | User Types |
|-------|----------------|---------|------------|
| **Peter Park (B2B)** | `team-fk4xza2` | Dashboard, ACT (Access Control Tool) | Facility operators, SaaS customers, admins |
| **MHP (B2C)** | `team-izpsgyb` | Online Shop, Bazar | End-users (drivers), MHP support staff |

**Why Separate Tenants:**
1. **User Pool Isolation:** B2B users never authenticate against B2C tenant (prevents accidental data exposure)
2. **Different Identity Providers:** B2B may use enterprise SSO (SAML, OIDC); B2C uses email/phone authentication
3. **Different Security Policies:** B2B requires MFA, complex passwords; B2C optimized for consumer UX

### C. Role-Based Access Control (RBAC Within B2B Tenant)

Even within the B2B tenant (`team-fk4xza2`), there is further segmentation based on customer contract type.

**RBAC Roles (Examples from Oracle Answers):**

| Role Name | Contract Type | Data Visibility | Purpose |
|-----------|--------------|-----------------|---------|
| `mhp_full_service_pcn_share` | Full Service | Can see enforcement data (PCNs, violation details) | Customers who pay MHP for full enforcement + receive revenue share need visibility into enforcement performance |
| `saas_no_pcn_share` | SaaS Only | Cannot see detailed PCN data | Customers who only buy tech (handle their own enforcement) should not see MHP's enforcement operations |

**Why This Matters for Compliance:**
- Prevents unauthorized data access between competing operators
- Ensures that SaaS customers who are not data controllers for enforcement do not have access to enforcement personal data
- Supports data minimization (users only see data relevant to their contract)

### D. Financial Flows & Contract Structure

**Full Service Model (MHP as Primary Operator):**
1. Peter Park installs hardware/software at facility
2. MHP operates the entire parking management (including enforcement)
3. MHP collects all revenue (parking fees + PCNs)
4. MHP pays **percentage revenue share** to facility owner
5. Facility owner has minimal operational involvement

**Financial Risk:** MHP bears risk of non-payment (e.g., if PCNs are not collected, MHP loses money but still pays revenue share)

**SaaS Model (Peter Park as Tech Provider Only):**
1. Peter Park installs hardware/software and charges fixed SaaS fee
2. Facility owner operates parking management themselves (or hires different enforcement company)
3. Peter Park receives predictable recurring revenue (SaaS subscription)
4. Facility owner bears enforcement risk

**Hybrid Model (SaaS + MHP Enforcement):**
1. Peter Park provides tech (SaaS contract)
2. MHP provides enforcement as separate service agreement
3. Two distinct invoices: Peter Park for tech, MHP for enforcement

**Strategic Implication:**
- Full Service = Higher revenue potential, higher risk (MHP)
- SaaS = Lower revenue, zero enforcement risk (Peter Park)
- Dual-brand allows Peter Park to de-risk core business while MHP captures upside from enforcement

---

## PART 4: MULTI-TENANCY ARCHITECTURE (DATA ISOLATION)

### Confirmed Architecture (From Q13)

**How does Peter Park isolate tenant data?**

**Answer:** "We don't isolate tenants. We have a single database and a single schema. We use row-level security to isolate tenants."

**What This Means:**
- **NOT database-per-tenant** (no separate DynamoDB tables per municipality)
- **NOT schema-per-tenant** (no separate RDS schemas for each customer)
- **Row-Level Security (RLS)** via partition key or tenant_id column

### Technical Implementation (Inferred)

**DynamoDB Tables:**
- Each table has a partition key that includes `area_id` or `tenant_id`
- Example: `observations` table → partition key = `area_id + timestamp`
- Queries MUST include tenant identifier to retrieve data
- DynamoDB's partition key structure naturally isolates data (different tenants query different partitions)

**RDS Aurora PostgreSQL:**
- Likely uses `area_id` or `customer_id` foreign keys on all tables
- Application-level enforcement: every query includes `WHERE area_id = ?` or `WHERE customer_id = ?`
- PostgreSQL Row-Level Security (RLS) policies may be enabled to enforce isolation at database level

**API Layer (Falcon Backend):**
- JWT tokens from Auth0 include claims like `area_id`, `customer_id`, `roles`
- API Gateway or application middleware extracts claims from JWT
- All database queries are scoped to tenant identifier from JWT
- Example: User with `area_id=123` can only query observations where `area_id=123`

### Benefits of Row-Level Security Multi-Tenancy

**Pros:**
1. **Cost Efficiency:** Single infrastructure for all tenants (no need to provision separate databases per customer)
2. **Operational Simplicity:** Single deployment, single schema migration, unified monitoring
3. **Data Aggregation:** Can run analytics across all tenants (e.g., "What is average ALPR accuracy across all 500 installations?")

**Cons:**
1. **Risk of Data Leakage:** If a bug in application logic omits `WHERE tenant_id = ?`, queries return data from ALL tenants (catastrophic GDPR breach)
2. **Performance:** Large tables with millions of rows from all tenants require careful indexing to avoid slow queries
3. **Compliance Complexity:** Some customers (especially government entities) may require physical data isolation for security reasons

### Mitigation Strategies (How Peter Park Avoids Leakage)

**Strategy 1: JWT Claims Enforcement**
- Every API request includes JWT token from Auth0
- Token contains `area_id` or list of authorized `area_ids`
- API middleware rejects requests if token missing or invalid
- All queries automatically scoped to JWT claims

**Strategy 2: Database Indexes**
- Primary indexes on all tables include tenant identifier as prefix
- Example: `CREATE INDEX idx_observations ON observations (area_id, timestamp)`
- Ensures queries filtered by `area_id` are fast and use index

**Strategy 3: Audit Logging**
- All database queries logged with user ID, timestamp, query parameters
- Automated alerts if query returns > N rows (potential missing tenant filter)
- Regular audits to detect anomalous data access patterns

**Strategy 4: PostgreSQL RLS (If Enabled)**
- Row-Level Security policies enforce `area_id` filtering at database level
- Even if application has bug, database rejects unauthorized row access
- Requires configuring policies per table: `CREATE POLICY tenant_isolation ON observations USING (area_id = current_setting('app.tenant_id'))`

---

## PART 5: TECHNICAL STACK RECAP (RELEVANT TO CHAPTER 2)

| Component | Technology | Relevance to Dual-Brand Architecture |
|-----------|-----------|-------------------------------------|
| **Cloud Provider** | AWS (eu-central-1) | Single shared infrastructure for both brands |
| **Authentication** | Auth0 | Separate tenants (`team-fk4xza2` B2B, `team-izpsgyb` B2C) enforce brand separation |
| **Database (NoSQL)** | DynamoDB | Partition keys include `area_id` for row-level tenant isolation |
| **Database (Relational)** | Aurora PostgreSQL | Single "main-db" with service-specific schemas (e.g., `slave_mhp`) |
| **API Gateway** | (Inferred: AWS API Gateway or ALB) | Validates JWT tokens, extracts tenant claims, enforces RBAC |
| **Microservices** | Lambda + EKS | Services logically divided: Platform (Peter Park infra) vs. Delight (MHP B2C apps like Bazar) |
| **RBAC** | Auth0 roles + JWT claims | Roles like `mhp_full_service_pcn_share` control data visibility in B2B dashboard |

---

## PART 6: COMPLIANCE IMPLICATIONS OF DUAL-BRAND ARCHITECTURE

### Data Controller vs. Data Processor Roles

**GDPR Distinction:**
- **Data Controller:** Determines purposes and means of data processing (legally responsible under GDPR)
- **Data Processor:** Processes data on behalf of controller (follows controller's instructions)

**Who is the Controller?**

| Scenario | Data Controller | Data Processor | Implications |
|----------|----------------|---------------|--------------|
| **SaaS Contract** | Facility owner (municipality, retailer) | Peter Park (provides tech platform) | Facility owner is responsible for GDPR compliance (DPIA, legal basis, data subject requests). Peter Park must have Data Processing Agreement (DPA) with customer. |
| **Full Service Contract** | MHP (operates parking + enforcement) | Peter Park (provides tech to MHP) | MHP is controller. MHP responsible for GDPR compliance. Peter Park is processor for MHP. |
| **Hybrid (SaaS + MHP Enforcement)** | Facility owner (for parking operations), MHP (for enforcement) | Peter Park (processor for both) | **Joint controllers** or separate controllers for distinct processing activities. Requires clear delineation in contracts. |

**Why This Matters:**
- **Data Processing Agreements (DPAs) Required:** Peter Park must have signed DPAs with every customer, specifying what data is processed, for what purpose, retention periods, security measures
- **Data Subject Requests (DSRs):** If a driver submits GDPR Article 15 request (right of access), who responds? In SaaS model: facility owner. In Full Service model: MHP. Peter Park must provide technical capability for customers to retrieve data.
- **Data Breaches (Article 33/34):** If Peter Park suffers breach (e.g., S3 bucket misconfigured), Peter Park must notify customers (controllers) within 72 hours so customers can assess if they must notify supervisory authority and data subjects.

### Liability Shield (The "Risk Buffer" Concept)

**Strategic Goal of Dual-Brand Structure:**

1. **Reputational Risk Isolation:**
   - When MHP issues PCN, driver is angry at MHP (not Peter Park)
   - If driver disputes PCN and leaves negative review, negative sentiment attaches to MHP brand
   - Peter Park's B2B SaaS reputation remains clean

2. **Legal Liability Isolation:**
   - If MHP is sued by driver for wrongful PCN, lawsuit is against MHP (not Peter Park)
   - Peter Park's liability is limited to contractual obligations under SaaS agreement (providing tech that works as specified)
   - MHP bears risk of enforcement errors (incorrect plate reading → wrong person charged)

3. **Financial Risk Isolation:**
   - If MHP has high non-collection rate (drivers don't pay PCNs), MHP loses money
   - Peter Park's SaaS revenue is unaffected (predictable subscription fees)
   - Conversely, if MHP's collection rate is high, MHP captures upside (Peter Park does not share in enforcement revenue in pure SaaS model)

**Legal Structure:**
- Separate legal entities (GmbHs) with separate balance sheets
- If MHP becomes insolvent, Peter Park is protected (limited to equity investment in MHP)
- If Peter Park faces tech liability (e.g., GDPR fine for data breach), MHP is separate entity (though practically both would be affected if infrastructure is shared)

---

## PART 7: CHALLENGES & TRADE-OFFS

### Challenge 1: Shared Infrastructure Creates Contagion Risk

**Problem:** If AWS account is compromised or data breach occurs, both brands are affected because infrastructure is shared.

**Mitigation:**
- Strong access controls (IAM policies restricting which teams can access which services)
- Encryption at rest (KMS) and in transit (TLS)
- Regular security audits and penetration testing

### Challenge 2: RBAC Complexity

**Problem:** As number of customers grows, number of RBAC roles/policies grows exponentially. A bug in role assignment could grant incorrect access.

**Mitigation:**
- Automated role provisioning based on contract type
- Regular access reviews (audit which users have which roles)
- Principle of least privilege (default deny, explicit allow)

### Challenge 3: Customer Confusion

**Problem:** Customers may not understand why they're buying tech from Peter Park but receiving enforcement invoices from MHP.

**Mitigation:**
- Clear contract language explaining dual-brand structure
- Sales training to explain value proposition
- Transparent branding (e.g., "Powered by Peter Park" on MHP invoices)

### Challenge 4: Data Residency & Sovereignty

**Problem:** Some customers (especially government entities) may require data to be stored in specific geography or physically isolated from other customers.

**Current Architecture Limitation:** Single AWS region (eu-central-1), shared database.

**Future Enhancement Needed:**
- For high-security customers: option for dedicated RDS instance or separate AWS account
- For international expansion: deploy in additional regions (e.g., eu-west-1 for UK, eu-central-2 for Switzerland)

---

## PART 8: COMPETITIVE ANALYSIS

### What Competitors Do Wrong

**Competitor Pattern 1: Single Brand**
- Enforcement company directly issues PCNs under their own brand
- When drivers dispute, negative sentiment attaches to company's main brand
- Harder to sell SaaS to new customers if brand is associated with parking tickets

**Competitor Pattern 2: Full Vertical Integration (No SaaS Option)**
- Company only offers Full Service (no SaaS-only option)
- Customers who want to control their own enforcement cannot buy the tech
- Limits addressable market

**Competitor Pattern 3: Database-Per-Tenant (Over-Engineered)**
- Separate AWS account per customer for "data isolation"
- 10x operational overhead (separate deployments, separate monitoring, separate incident response)
- Cannot run cross-tenant analytics
- Does not actually improve security if application code is buggy (attacker can still pivot between accounts if IAM is misconfigured)

### What Peter Park Does Right

1. **Dual-Brand Optionality:** Customers can choose SaaS-only (Peter Park) or Full Service (MHP) based on risk appetite
2. **Shared Infrastructure Efficiency:** Single codebase, single deployment, but logical separation via Auth0 + RBAC
3. **Scalable Multi-Tenancy:** Row-level security allows adding new customers without infrastructure changes
4. **Clear Liability Boundaries:** Contracts specify who is data controller, who is processor, who handles enforcement risk

---

## END OF DOSSIER

**Next Step:** Write Chapter 2 sections based on this dossier.

**Section A (Strategy):** Focus on "Why B2B SaaS needs a Risk Buffer" → explain reputational risk, legal liability isolation, financial risk isolation, and how dual-brand structure creates optionality for customers.

**Section B (Tech):** Focus on "Multi-tenant architecture for separating liability" → explain Auth0 tenant separation, RBAC, row-level security, data controller vs. processor roles, and technical safeguards to prevent data leakage.
