<style>
h2{
    margin-top: 0;
}

</style>

## [👈](../src)

# ☁️ COMPLETE AWS MASTER ROADMAP

**(Beginner → Advanced → Professional Level)**

## 📌 Purpose of This Roadmap

This roadmap is designed to help you:

* Learn AWS **from absolute basics**
* Build **strong fundamentals**
* Gain **hands-on practical experience**
* Clear the following certifications **in order**:

  1. AWS Certified Cloud Practitioner
  2. AWS Certified Developer – Associate
  3. AWS Certified Solutions Architect – Associate
  4. AWS Certified Solutions Architect – Professional

This roadmap is **technology-complete**, meaning:

* No important topic is missing
* Concepts are ordered logically
* You can use it as a **permanent AWS notes index**

---

## 🟢 PHASE 1: CLOUD & IT FOUNDATIONS (PRE-AWS)

Before touching AWS services, you must understand **what AWS is built on**.
Many people fail AWS exams because they skip this phase.

---

### 1.1 What is Cloud Computing?

Cloud computing is the **on-demand delivery of computing resources** over the internet.

Key concepts:

* On-demand self-service
* Broad network access
* Resource pooling
* Rapid elasticity
* Measured service

Types of cloud:

* Public cloud
* Private cloud
* Hybrid cloud
* Multi-cloud

Service models:

* **IaaS** (EC2, EBS, VPC)
* **PaaS** (Elastic Beanstalk, RDS)
* **SaaS** (Amazon WorkMail, QuickSight)

Benefits:

* No upfront hardware cost
* Pay-as-you-go
* Scalability
* Global availability
* High reliability

---

### 1.2 Core Networking Fundamentals

AWS networking makes sense **only if basics are clear**.

Learn and understand:

* IPv4 address structure
* Private IP ranges
* Public IP addresses
* CIDR notation (e.g. 10.0.0.0/16)
* Subnetting basics
* Ports (22, 80, 443, 3306, etc.)
* TCP vs UDP
* HTTP vs HTTPS
* DNS resolution flow
* NAT (Network Address Translation)
* Firewalls and security concepts

---

### 1.3 Linux Fundamentals for AWS

AWS heavily relies on Linux. You must be comfortable with:

* Linux directory structure
* Files and directories
* Permissions (`rwx`)
* Users and groups
* SSH access
* Package managers (`yum`, `apt`)
* Services (`systemctl`)
* Environment variables
* Logs (`/var/log`)
* Bash scripting basics

This knowledge is **mandatory** for EC2, containers, and automation.

---

## 🟦 PHASE 2: AWS CORE CONCEPTS & GLOBAL INFRASTRUCTURE

This phase builds your **AWS mindset**.

---

### 2.1 AWS Global Infrastructure

Understand:

* AWS Regions
* Availability Zones (AZs)
* Edge Locations
* Regional vs global services

Why AWS uses AZs:

* Fault tolerance
* High availability
* Disaster recovery

---

### 2.2 AWS Shared Responsibility Model

Very important for exams.

AWS is responsible for:

* Physical data centers
* Network infrastructure
* Hardware

You are responsible for:

* OS security
* Application security
* Data encryption
* IAM configuration

---

### 2.3 AWS Well-Architected Framework

Five pillars:

1. Operational Excellence
2. Security
3. Reliability
4. Performance Efficiency
5. Cost Optimization

Every AWS architecture question is based on these pillars.

---

### 2.4 AWS Access Methods

* AWS Management Console
* AWS CLI
* AWS SDKs
* Infrastructure as Code (CloudFormation / CDK)

---

## 🟩 PHASE 3: IDENTITY & ACCESS MANAGEMENT (IAM)

IAM is **the backbone of AWS security**.

---

### 3.1 IAM Concepts

* Authentication vs Authorization
* IAM Users
* IAM Groups
* IAM Roles
* Temporary credentials
* Root user risks

---

### 3.2 IAM Policies

* JSON policy structure
* Effect
* Action
* Resource
* Conditions
* Managed vs inline policies

---

### 3.3 Security Best Practices

* Least privilege
* MFA everywhere
* Never use root user
* Role-based access
* Access Analyzer

---

## 🟦 PHASE 4: COMPUTE SERVICES

Compute is how your applications **run on AWS**.

---

### 4.1 Amazon EC2 (DEEP DIVE)

Topics to master:

* EC2 instance lifecycle
* Instance types
* AMIs
* Key pairs
* Security groups
* Elastic IP
* User data scripts
* Placement groups
* EC2 pricing models:

  * On-Demand
  * Reserved Instances
  * Spot Instances
* Auto Scaling Groups
* Launch Templates

Hands-on:

* Launch EC2
* SSH access
* Host a web app
* Auto scale instances

---

### 4.2 Containers

* ECS
* EKS (Kubernetes basics)
* Fargate
* Container networking
* Container security

---

### 4.3 Serverless Compute

* AWS Lambda
* Event sources
* Cold start
* Limits
* Lambda pricing
* Lambda with API Gateway

---

### 4.4 Platform Services

* Elastic Beanstalk
* App Runner
* Lightsail

---

## 🟨 PHASE 5: STORAGE SERVICES

Storage is **one of the most tested AWS topics**.

---

### 5.1 Amazon S3 (VERY DEEP)

Understand:

* Buckets & objects
* Storage classes
* Versioning
* Encryption
* Lifecycle rules
* Bucket policies
* ACLs
* Static website hosting
* Cross-region replication
* S3 events

---

### 5.2 Block & File Storage

* EBS
* EFS
* FSx
* AWS Backup
* Storage Gateway

---

### 5.3 Data Transfer Services

* Snowball
* Snowmobile
* DataSync

---

## 🟧 PHASE 6: DATABASE SERVICES

---

### 6.1 Relational Databases

* Amazon RDS
* Multi-AZ deployments
* Read replicas
* Backups and snapshots
* Aurora architecture

---

### 6.2 NoSQL & Analytics Databases

* DynamoDB
* Partition keys
* Global secondary indexes
* ElastiCache
* Redshift
* Athena
* OpenSearch

---

## 🟥 PHASE 7: NETWORKING & CONTENT DELIVERY

This is **core for Solutions Architect exams**.

---

### 7.1 Amazon VPC (VERY DEEP)

Topics:

* VPC creation
* CIDR planning
* Subnets
* Route tables
* Internet Gateway
* NAT Gateway
* Security Groups
* NACLs
* VPC Endpoints
* VPC Peering
* Transit Gateway
* VPN
* Direct Connect

---

### 7.2 Load Balancing & DNS

* Application Load Balancer
* Network Load Balancer
* Gateway Load Balancer
* Route 53

  * Routing policies
* CloudFront CDN

---

## 🟪 PHASE 8: APPLICATION INTEGRATION

* API Gateway
* SQS
* SNS
* EventBridge
* Step Functions
* AppSync

Used heavily in **event-driven architectures**.

---

## 🟫 PHASE 9: MONITORING, LOGGING & GOVERNANCE

* CloudWatch
* CloudTrail
* AWS Config
* X-Ray
* Trusted Advisor

---

## 🟦 PHASE 10: DEVOPS & AUTOMATION

* AWS CLI
* CloudFormation
* CDK
* CI/CD services:

  * CodeCommit
  * CodeBuild
  * CodeDeploy
  * CodePipeline
* Deployment strategies:

  * Rolling
  * Blue-Green
  * Canary

---

## 🟥 PHASE 11: SECURITY & COMPLIANCE

* KMS
* Secrets Manager
* Parameter Store
* WAF
* Shield
* GuardDuty
* Inspector
* Macie
* Encryption at rest & in transit

---

## 🟨 PHASE 12: COST MANAGEMENT

* AWS pricing models
* Cost Explorer
* Budgets
* Savings Plans
* Reserved Instances
* Cost allocation tags

---

## 🟩 PHASE 13: MIGRATION & HYBRID CLOUD

* Migration Hub
* DMS
* Application Migration Service
* Hybrid cloud design
* On-prem to AWS strategies

---

## 🟪 PHASE 14: ADVANCED ARCHITECTURE (PRO LEVEL)

* Multi-account architecture
* AWS Organizations
* Control Tower
* Cross-region DR
* Event-driven microservices
* Large-scale system design
* Failure handling
* Chaos engineering concepts

---

## 🎓 CERTIFICATION ALIGNMENT

* Cloud Practitioner → Phases 1–3
* Developer Associate → Phases 4–8
* SA Associate → Phases 4–9
* SA Professional → All phases

---

## 🧠 HOW TO USE THIS DOCUMENT

1. Copy into your notes
2. Convert bullet points into checklists
3. Add diagrams for each service
4. Add screenshots from AWS Console
5. Practice after every topic

---

## ✅ FINAL WORD

This roadmap is **complete, realistic, and industry-aligned**.
If you follow this **line by line**, you will not only clear certifications, but **actually master AWS**.

---


# 🛠️ AWS HANDS-ON, PROJECTS & PRACTICE ROADMAP

*(Beginner → Associate → Professional Level)*

> **Rule:**
> ❌ Reading without practice = no real learning
> ✅ Every AWS service → at least one hands-on task

---

## 🟢 PHASE 1: FOUNDATIONAL HANDS-ON (PRE-AWS + BASICS)

### 🔹 Goal

Become comfortable with **cloud environments, Linux, and networking** before deep AWS services.

---

### 1️⃣ Linux Hands-On Practice (AWS Context)

Practice on:

* Local VM (VirtualBox)
* OR EC2 Free Tier

#### Tasks

* Create users and groups
* Practice file permissions (`chmod`, `chown`)
* Install packages (`yum`, `apt`)
* Run and manage services (`systemctl`)
* Read logs (`/var/log`)
* Write simple bash scripts
* SSH into machines using key pairs

📌 **Outcome:**
You should feel comfortable managing a Linux server without fear.

---

### 2️⃣ Networking Hands-On (Conceptual + Practical)

* Calculate CIDR blocks manually
* Identify public vs private IPs
* Test ports using `curl`, `telnet`, `nc`
* Observe DNS resolution using `nslookup`, `dig`

📌 **Outcome:**
You understand how traffic flows from browser → server.

---

## 🟦 PHASE 2: AWS ACCOUNT & CORE PRACTICE

### 🔹 Goal

Understand **AWS environment setup** and navigation.

---

### 3️⃣ AWS Account Setup & Safety

Hands-on tasks:

* Create AWS Free Tier account
* Enable MFA on root account
* Create IAM admin user
* Log in using IAM user
* Set billing alerts
* Explore AWS Console sections

📌 **Outcome:**
You can safely use AWS without risk of accidental billing.

---

### 4️⃣ AWS CLI Hands-On

Tasks:

* Install AWS CLI
* Configure CLI using access keys
* List S3 buckets
* Describe EC2 instances
* Upload file to S3 via CLI

📌 **Outcome:**
You can interact with AWS without UI.

---

## 🟩 PHASE 3: IAM – SECURITY HANDS-ON

### 🔹 Goal

Master **access control**, which is critical for real systems.

---

### 5️⃣ IAM Practical Labs

Tasks:

* Create IAM users
* Create IAM groups
* Attach policies
* Create IAM roles for EC2
* Test permission boundaries
* Enable MFA
* Use least privilege policies

Real practice:

* Create a user who can only read S3
* Create a role EC2 can assume to access S3

📌 **Outcome:**
You understand **who can do what and why**.

---

## 🟦 PHASE 4: COMPUTE HANDS-ON (EC2 + SCALING)

### 🔹 Goal

Run real applications on AWS compute.

---

### 6️⃣ EC2 Core Labs

Hands-on tasks:

* Launch EC2 (Amazon Linux)
* Configure security groups
* SSH into instance
* Install Nginx / Apache
* Host a static website
* Use user-data scripts
* Allocate Elastic IP

📌 **Outcome:**
You can launch and manage servers independently.

---

### 7️⃣ EC2 + Storage Integration

* Attach EBS volume
* Mount EBS
* Take snapshots
* Resize volume
* Detach & attach to another EC2

---

### 8️⃣ Auto Scaling & Load Balancing

Hands-on:

* Create Launch Template
* Create Auto Scaling Group
* Attach Application Load Balancer
* Test auto-scaling by CPU load

📌 **Outcome:**
You understand high availability and scalability.

---

## 🟨 PHASE 5: STORAGE HANDS-ON (S3 & FILE SYSTEMS)

### 🔹 Goal

Store and manage data properly.

---

### 9️⃣ Amazon S3 Deep Practice

Hands-on tasks:

* Create S3 buckets
* Upload/download objects
* Enable versioning
* Configure lifecycle rules
* Apply bucket policies
* Enable encryption
* Static website hosting
* Cross-region replication
* Trigger Lambda from S3 event

📌 **Outcome:**
You fully understand object storage.

---

### 1️⃣0️⃣ File & Block Storage Labs

* Create EFS
* Mount EFS to multiple EC2s
* Compare EBS vs EFS
* Test FSx
* Use AWS Backup

---

## 🟧 PHASE 6: DATABASE HANDS-ON

### 🔹 Goal

Run production-ready databases.

---

### 1️⃣1️⃣ RDS Labs

Hands-on tasks:

* Create RDS instance
* Connect from EC2
* Enable Multi-AZ
* Create read replica
* Backup & restore
* Monitor performance

---

### 1️⃣2️⃣ DynamoDB Labs

Hands-on:

* Create DynamoDB table
* Insert items
* Query & scan
* Add secondary index
* Connect DynamoDB with Lambda

📌 **Outcome:**
You understand SQL vs NoSQL use cases.

---

## 🟥 PHASE 7: NETWORKING HANDS-ON (VPC DEEP DIVE)

### 🔹 Goal

Design secure cloud networks.

---

### 1️⃣3️⃣ VPC Core Labs

Hands-on:

* Create custom VPC
* Create public & private subnets
* Configure route tables
* Setup Internet Gateway
* Setup NAT Gateway
* Security Groups vs NACLs

📌 **Outcome:**
You can design secure VPCs from scratch.

---

### 1️⃣4️⃣ Advanced VPC Labs

* VPC peering
* VPC endpoints
* Site-to-site VPN (conceptual lab)
* Transit Gateway (theory + diagrams)

---

## 🟪 PHASE 8: APPLICATION INTEGRATION & SERVERLESS

### 🔹 Goal

Build event-driven architectures.

---

### 1️⃣5️⃣ Lambda & API Gateway Project

Project:

* Create REST API using Lambda
* Use API Gateway
* Store data in DynamoDB
* Secure with IAM

📌 **Outcome:**
You can build serverless backends.

---

### 1️⃣6️⃣ Messaging & Events

Hands-on:

* SQS producer-consumer
* SNS notifications
* EventBridge rules
* Step Functions workflows

---

## 🟫 PHASE 9: MONITORING & GOVERNANCE

### 🔹 Goal

Observe and audit systems.

---

### 1️⃣7️⃣ Monitoring Labs

* CloudWatch metrics
* Custom metrics
* CloudWatch alarms
* Centralized logging
* X-Ray tracing

---

### 1️⃣8️⃣ Auditing Labs

* Enable CloudTrail
* Track API calls
* Use AWS Config
* Security insights

---

## 🟦 PHASE 10: DEVOPS & AUTOMATION HANDS-ON

### 🔹 Goal

Automate infrastructure and deployments.

---

### 1️⃣9️⃣ Infrastructure as Code

Hands-on:

* Write CloudFormation templates
* Deploy EC2 & VPC using IaC
* Modify stacks safely
* Use CDK (optional)

---

### 2️⃣0️⃣ CI/CD Pipeline Project

Project:

* Source code in CodeCommit
* Build using CodeBuild
* Deploy via CodeDeploy
* Automate using CodePipeline

📌 **Outcome:**
You understand DevOps on AWS.

---

## 🟥 PHASE 11: SECURITY & COMPLIANCE PRACTICE

### 🔹 Goal

Protect data and applications.

---

### 2️⃣1️⃣ Security Labs

* Encrypt data using KMS
* Store secrets securely
* Setup WAF rules
* Enable GuardDuty
* Inspect vulnerabilities

---

## 🟨 PHASE 12: COST OPTIMIZATION PRACTICE

### 🔹 Goal

Control AWS billing.

---

### 2️⃣2️⃣ Cost Labs

* Use Cost Explorer
* Create budgets
* Analyze service costs
* Optimize EC2 pricing
* Use Savings Plans

---

## 🟩 PHASE 13: MIGRATION & HYBRID PRACTICE

### 🔹 Goal

Move real workloads to AWS.

---

### 2️⃣3️⃣ Migration Project

Project:

* Migrate on-prem app to AWS
* Use DMS
* Use Application Migration Service
* Validate post-migration

---

## 🟪 PHASE 14: PROFESSIONAL-LEVEL PROJECTS

### 🔹 Goal

Think like a Solutions Architect.

---

### 2️⃣4️⃣ CAPSTONE PROJECTS (VERY IMPORTANT)

#### Project 1: Production Web Application

* Multi-AZ architecture
* ALB + ASG
* RDS + Read Replicas
* S3 for static content
* CloudFront CDN
* Secure with IAM & WAF

---

#### Project 2: Event-Driven System

* API Gateway
* Lambda
* DynamoDB
* EventBridge
* SQS
* Monitoring

---

#### Project 3: Disaster Recovery Design

* Multi-region setup
* Failover strategy
* Backup automation
* Cost vs availability analysis

📌 **Outcome:**
You are **job-ready** and **professional-level**.

---

## 🧠 HOW TO PRACTICE EFFECTIVELY

* Always draw architecture diagrams
* Break things intentionally
* Read AWS docs after labs
* Write post-mortems
* Track costs daily

---

## ✅ FINAL ADVICE

If you **complete these hands-on labs and projects**, you will:

* Clear **all AWS certifications**
* Be confident in **real interviews**
* Understand AWS **deeply**, not superficially

---
