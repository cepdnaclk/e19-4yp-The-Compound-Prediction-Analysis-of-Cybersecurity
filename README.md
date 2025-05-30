# Compound Prediction Analysis of  Network Security Situation Based on Support Vector Combined with Classification Algorithm

## Overview

This repository contains the implementation and resources for our final year research project: **Compound Prediction Analysis of  Network Security Situation Based on Support Vector Combined with Classification Algorithm**. The project aims to enhance the detection and analysis of web application vulnerabilities during cyber attacks by integrating machine learning-based detection with forensic log analysis. The proposed framework is designed for seamless integration into modern security infrastructures, such as Web Application Firewalls (WAFs) and API gateways, to provide actionable insights into vulnerable application components and improve overall application-layer security.

---

## Table of Contents

- [Background](#background)
- [Objectives](#objectives)
- [Methodology](#methodology)
  - [Data Collection](#data-collection)
  - [Data Preprocessing](#data-preprocessing)
  - [Model Development](#model-development)
  - [Detection Pipeline](#detection-pipeline)
  - [Evaluation](#evaluation)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [Contributing](#contributing)
- [Team](#team)
- [References](#references)

---

## Background

The sophistication and frequency of cyber threats targeting web applications have outpaced traditional security measures. Attackers exploit vulnerabilities in web applications and APIs, often bypassing rule-based or signature-based Intrusion Detection Systems (IDS) and WAFs. Existing solutions typically focus on attack classification but lack mechanisms to identify the specific vulnerable components within applications. This project addresses these limitations by proposing a hierarchical, multi-stage intrusion detection framework that combines supervised classification, anomaly detection, and root cause analysis through log correlation.

---

## Objectives

- **Design and develop** a hierarchical, multi-stage intrusion detection framework.
- **Detect both known and unknown web application attacks** using supervised and anomaly detection techniques.
- **Identify the specific vulnerable application component** during an attack via forensic log analysis.
- **Evaluate the framework** in terms of detection accuracy, computational efficiency, scalability, and adaptability.
- **Facilitate integration** with existing security infrastructures (e.g., WAFs, API gateways).

---

## Methodology

### Data Collection

- **Vulnerable Server Environment:** Deploy intentionally vulnerable web applications (e.g., DVWA, OWASP Juice Shop, WebGoat) on isolated environments.
- **Traffic Generation:** Simulate normal user activity using tools like Selenium, JMeter, or Locust; generate attack traffic using OWASP ZAP, Burp Suite, and custom scripts.
- **Log Collection:** Aggregate network, system, and application logs using ELK Stack, Splunk, or custom scripts for correlation and forensic analysis.

### Data Preprocessing

- **Feature Extraction:** Extract numerical and categorical features (e.g., request size, HTTP methods, suspicious keywords) from logs.
- **Cleaning & Anonymization:** Remove redundant entries, anonymize sensitive data, and split data into training, validation, and test sets.

### Model Development

- **Supervised Classifier:** Train models (e.g., Random Forest, SVM, Neural Networks) on labeled data to detect known attacks.
- **Anomaly Detector:** Use One-Class SVM, Isolation Forest, or Autoencoders trained on normal data to flag novel or zero-day attacks.
- **Vulnerability Identification:** Analyze correlated logs within attack timeframes to pinpoint affected functions, services, or modules.

### Detection Pipeline

1. **Network Traffic Analysis:** Classify incoming requests as normal or malicious using the supervised model.
2. **Anomaly Detection:** For uncertain cases, apply anomaly detection to flag unknown threats.
3. **Root Cause Analysis:** Retrieve and analyze application logs corresponding to detected attacks to identify vulnerable components.
4. **Feedback Loop:** Incorporate analyst feedback to improve model performance and adaptability.

### Evaluation

- **Metrics:** Detection accuracy, false positive/negative rates, computational efficiency, scalability, adaptability, and root cause identification accuracy.
- **Scenarios:** Evaluate on known attacks, unknown attacks, and unusual but benign traffic patterns using both real-world and synthetic datasets.

---

## Project Structure

```
.
├── data/                 # Datasets (raw and processed)
├── notebooks/             # Jupyter notebooks for experiments and analysis
├── src/                  # Source code for models, pipelines, and utilities
│   ├── preprocessing/
│   ├── models/
├── docs/                 # Documentation and reports
├── requirements.txt      # Python dependencies
├── README.md             # Project overview and instructions
```

---

## Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-org/compound-prediction-network-security.git
   cd compound-prediction-network-security
   ```

2. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

3. **Prepare datasets:**
   - Place raw and labeled datasets in the `data/` directory.
   - Use provided scripts in `src/preprocessing/` to clean and extract features.

4. **Train models:**
   - Run training scripts in `src/models/` for supervised and anomaly detection models.

5. **Run detection pipeline:**
   - Use the main pipeline script in `src/detection/` to process new traffic and logs.

6. **Analyze results:**
   - Use tools in `src/analysis/` and `notebooks/` for evaluation and visualization.

---

## Team

- Danujan S. (E/19/060)
- Harnan M. (E/19/134)
- Nithusikan T. (E/19/266)

Department of Computer Engineering, Faculty of Engineering, University of Peradeniya

---

## References

A detailed list of references and related work is available in the `docs/` directory and the project proposal.

---

> For more details on the methodology, dataset preparation, and evaluation, please refer to the full project proposal PDF included in the repository.