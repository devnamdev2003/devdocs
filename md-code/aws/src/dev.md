# 🗂️ AWS MASTER GITHUB PROJECT STRUCTURE

> **Repository name (recommended):**
> `aws-cloud-mastery`

---

## 📁 ROOT STRUCTURE

```text
aws-cloud-mastery/
│
├── README.md
├── .gitignore
│
├── 00-cloud-foundations/
├── 01-iam-security/
├── 02-compute/
├── 03-storage/
├── 04-databases/
├── 05-networking/
├── 06-serverless/
├── 07-application-integration/
├── 08-monitoring-logging/
├── 09-devops-automation/
├── 10-security-compliance/
├── 11-cost-optimization/
├── 12-migration-hybrid/
├── 13-architecture-design/
│
├── projects/
└── diagrams/
```

# 📁 DETAILED FOLDER BREAKDOWN

---

## 📁 `00-cloud-foundations/`

**Purpose:** Core cloud + Linux + networking basics

```text
00-cloud-foundations/
├── linux-basics.md
├── networking-basics.md
├── cloud-computing-notes.md
└── hands-on/
    ├── linux-practice.md
    └── networking-practice.md
```

---

## 📁 `01-iam-security/`

**Purpose:** AWS IAM mastery

```text
01-iam-security/
├── iam-concepts.md
├── iam-policies.md
├── best-practices.md
└── hands-on/
    ├── create-users.md
    ├── roles-for-ec2.md
    └── least-privilege-lab.md
```

---

## 📁 `02-compute/`

**Purpose:** EC2, Auto Scaling, Load Balancing

```text
02-compute/
├── ec2/
│   ├── ec2-basics.md
│   ├── ec2-pricing.md
│   └── hands-on/
│       ├── launch-ec2.md
│       ├── user-data.md
│       └── ebs-attach.md
│
├── auto-scaling/
│   ├── asg-concepts.md
│   └── hands-on/
│       └── asg-with-alb.md
│
└── elastic-beanstalk/
    └── deploy-springboot.md
```

---

## 📁 `03-storage/`

**Purpose:** S3, EBS, EFS

```text
03-storage/
├── s3/
│   ├── s3-concepts.md
│   ├── s3-security.md
│   └── hands-on/
│       ├── bucket-policy.md
│       ├── lifecycle-rule.md
│       └── static-website.md
│
├── ebs/
│   └── ebs-hands-on.md
│
└── efs/
    └── efs-multi-ec2.md
```

---

## 📁 `04-databases/`

**Purpose:** RDS, DynamoDB, Aurora

```text
04-databases/
├── rds/
│   ├── rds-basics.md
│   └── hands-on/
│       ├── create-rds.md
│       ├── multi-az.md
│       └── read-replica.md
│
└── dynamodb/
    ├── dynamodb-concepts.md
    └── hands-on/
        ├── crud-operations.md
        └── lambda-integration.md
```

---

## 📁 `05-networking/`

**Purpose:** VPC deep dive

```text
05-networking/
├── vpc/
│   ├── vpc-basics.md
│   └── hands-on/
│       ├── custom-vpc.md
│       ├── public-private-subnet.md
│       └── nat-gateway.md
│
├── route53/
│   └── routing-policies.md
│
└── cloudfront/
    └── cdn-setup.md
```

---

## 📁 `06-serverless/`

**Purpose:** Lambda, API Gateway

```text
06-serverless/
├── lambda/
│   ├── lambda-basics.md
│   └── hands-on/
│       ├── s3-trigger.md
│       └── api-gateway.md
```

---

## 📁 `07-application-integration/`

**Purpose:** Messaging & events

```text
07-application-integration/
├── sqs/
│   └── producer-consumer.md
├── sns/
│   └── notifications.md
└── step-functions/
    └── workflow.md
```

---

## 📁 `08-monitoring-logging/`

```text
08-monitoring-logging/
├── cloudwatch/
│   ├── metrics.md
│   └── alarms.md
├── cloudtrail.md
└── xray.md
```

---

## 📁 `09-devops-automation/`

**Purpose:** CI/CD & IaC

```text
09-devops-automation/
├── cloudformation/
│   ├── ec2-stack.yaml
│   └── vpc-stack.yaml
├── cicd/
│   └── codepipeline.md
```

---

## 📁 `10-security-compliance/`

```text
10-security-compliance/
├── kms.md
├── secrets-manager.md
├── waf.md
└── guardduty.md
```

---

## 📁 `11-cost-optimization/`

```text
11-cost-optimization/
├── pricing-models.md
├── cost-explorer.md
└── budgets.md
```

---

## 📁 `12-migration-hybrid/`

```text
12-migration-hybrid/
├── migration-strategy.md
└── dms-lab.md
```

---

## 📁 `13-architecture-design/`

**Purpose:** Professional-level thinking

```text
13-architecture-design/
├── high-availability.md
├── disaster-recovery.md
├── microservices.md
└── case-studies/
```

---

## 📁 `projects/` ⭐ MOST IMPORTANT

```text
projects/
├── project-1-web-application/
│   ├── README.md
│   ├── architecture.png
│   └── setup-steps.md
│
├── project-2-serverless-api/
│   ├── README.md
│   ├── lambda-code/
│   └── api-gateway.md
│
└── project-3-disaster-recovery/
    ├── README.md
    └── failover-design.md
```

---

## 📁 `diagrams/`

Store all architecture diagrams:

```text
diagrams/
├── vpc-architecture.drawio
├── serverless-flow.drawio
└── multi-region-dr.png
```