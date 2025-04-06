# Secure DevSecOps Pipeline & Cybersecurity Hardening for OWASP Juice Shop

## Overview
This project focuses on securing the OWASP Juice Shop, a deliberately insecure web application, by implementing security best practices, DevSecOps automation, and infrastructure hardening. The main goals include threat modeling, vulnerability assessments, security hardening, incident response planning, and the implementation of a secure CI/CD pipeline.

## Features & Security Enhancements

### **1. Cyber Security Implementations**

#### **Application Threat Modeling**
- Conducted a detailed threat modeling using the **STRIDE** framework.
- Identified and mitigated risks in the following areas:
  - **Network vulnerabilities** (MITM attacks, eavesdropping).
  - **Data vulnerabilities** (data leakage, broken access control).
  - **Application vulnerabilities** (XSS, SQL injection, RCE).
  - **Authentication vulnerabilities** (session fixation, weak passwords, brute force attacks).
- Implemented risk mitigation strategies and security controls.

#### **Advanced Vulnerability Scanning & Exploitation**
- Performed **DAST** using:
  - **OWASP ZAP** for automated security scanning.
  - **Burp Suite** for penetration testing and manual exploitation.
- Identified and documented security vulnerabilities.
- Provided remediation strategies for each vulnerability.

#### **Security Hardening for Web Applications**
- **HTTPS Enforcement:** Used **Flask Talisman** to enforce HTTPS.
- **Input Validation:** Implemented secure input handling to prevent SQL Injection & XSS.
- **Authentication Security:**
  - Enabled **Multi-Factor Authentication (MFA)**.
  - Implemented **secure session management** (secure, HTTP-only cookies).
- **Security Headers Implementation:**
  - **Content Security Policy (CSP).**
  - **Strict-Transport-Security (HSTS).**
  - **X-Frame-Options, X-XSS-Protection, X-Content-Type-Options.**

#### **Incident Response & Disaster Recovery Plan**
- Implemented **automated logging & alerting** for security events.
- Designed **incident response playbooks** for:
  - SQL Injection attacks.
  - Unauthorized access attempts.
  - Privilege escalation detection.
- Automated recovery for disaster scenarios.

---

### **2. DevSecOps Enhancements**

#### **Secure CI/CD Pipeline Implementation**
- Integrated security at every stage:
  - **SAST (Static Analysis):** Used **Bandit** for Python vulnerability detection.
  - **DAST (Dynamic Analysis):** OWASP **ZAP** for web security testing.
  - **SCA (Software Composition Analysis):** Used **Snyk** for dependency vulnerability checks.
  - **Container Image Scanning:** Implemented **Trivy** to scan Docker images.
  - **Secret Scanning:** Configured **TruffleHog** to detect API keys & credentials.
- Automated security checks before deployment.

#### **Infrastructure Security as Code (IaC)**
- Used **Terraform** to provision **secure cloud infrastructure**.
- Implemented:
  - **Least privilege IAM roles**.
  - **Data encryption at rest & in transit**.
  - **Security groups & firewall configurations**.
  - **Cloud-native security tools** (AWS GuardDuty, GCP SCC).

#### **Continuous Monitoring & Vulnerability Management**
- **Monitoring Setup:**
  - Configured **Prometheus** for real-time metrics collection.
  - Created **Grafana dashboards** for security visualization.
- **Alerting & Vulnerability Scanning:**
  - Configured alerts for critical security events.
  - Used **Trivy** for periodic vulnerability scanning.

#### **Automated Patch Management & Updates**
- **Dependabot** enabled for automated dependency updates.
- Implemented **automated OS & Docker image patching**.
- Set up **automated tests** to validate patches before deployment.

---

## Tools Used

### Cybersecurity & Penetration Testing
<img src="https://img.shields.io/badge/-OWASP%20ZAP-000000?style=for-the-badge&logo=OWASP&logoColor=white" />
<img src="https://img.shields.io/badge/-Burp%20Suite-FF5722?style=for-the-badge&logo=PortSwigger&logoColor=white" />

- **OWASP ZAP** – Dynamic analysis for detecting runtime vulnerabilities (DAST)
- **Burp Suite** – Web application penetration testing and exploitation
- **STRIDE** – Threat modeling framework to identify application risks

---

### DevSecOps & Secure CI/CD
<img src="https://img.shields.io/badge/-Bandit-000000?style=for-the-badge&logo=python&logoColor=white" />
<img src="https://img.shields.io/badge/-Snyk-4C4A73?style=for-the-badge&logo=Snyk&logoColor=white" />
<img src="https://img.shields.io/badge/-Trivy-0F92A2?style=for-the-badge&logo=aqua&logoColor=white" />
<img src="https://img.shields.io/badge/-TruffleHog-FF4088?style=for-the-badge&logoColor=white" />
<img src="https://img.shields.io/badge/-Dependabot-025E8C?style=for-the-badge&logo=Dependabot&logoColor=white" />
<img src="https://img.shields.io/badge/-Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white" />

- **Bandit** – Static code analyzer for Python (SAST)
- **Snyk** – Open-source dependency scanning (SCA)
- **Trivy** – Container image and IaC vulnerability scanner
- **TruffleHog** – Detect secrets in code repositories
- **Dependabot** – Automated security patching for dependencies
- **Docker** – Containerization for secure app deployment

---

### Infrastructure as Code (IaC)
<img src="https://img.shields.io/badge/-Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white" />

- **Terraform** – Infrastructure provisioning with security-first configurations
- **AWS GuardDuty / GCP Security Command Center** – Cloud-native threat detection

---

### Monitoring & Logging
<img src="https://img.shields.io/badge/-Prometheus-E6522C?style=for-the-badge&logo=Prometheus&logoColor=white" />
<img src="https://img.shields.io/badge/-Grafana-F46800?style=for-the-badge&logo=Grafana&logoColor=white" />

- **Prometheus** – Metrics collection for continuous monitoring
- **Grafana** – Real-time dashboards and security alerting
---

## **License**
This project is open-source and follows the OWASP Juice Shop license.

---

## **Acknowledgments**
Special thanks to the OWASP Foundation for providing the Juice Shop as a security training tool.
