# RBQM Dashboard Using gsm Package

A clean, professional demonstration of a **Risk-Based Quality Management (RBQM)** dashboard built in **R**, using the **gsm** package to compute clinical metrics, and synthetic (dummy) data to mimic real-world study behavior. This project showcases practical clinical programming, metrics computation, and dashboard engineering.

---

## **Overview**

This repository contains an R-based RBQM dashboard that visualizes key clinical trial oversight metrics such as:

* Enrollment patterns
* Site performance indicators
* Data quality and signal detection
* Risk evaluation metrics generated via the gsm package

All computations use **gsm**, while the visualizations are displayed through a structured R workflow. No confidential study data or organizational code is included.

---

## **Features**

* Uses the **gsm** package for clinical metrics generation
* Presents trial quality, enrollment, and risk indicators
* Demonstrates end-to-end metric processing with synthetic data
* Clean project structure suitable for recruiters and professionals
* Reproducible and fully open-source

---

## **Repository Structure**

```
rbqm-dashboard-gsm/
│
├── R/                 # Scripts for metric processing and visualization
│   ├── ui.R
│   ├── server.R
│   └── helper_functions.R
│
├── data/              # Synthetic (dummy) datasets
│   └── sample_input.csv
│
├── outputs/           # Dashboard screenshots (optional)
│
├── docs/              # Additional documentation (optional)
│
├── README.md          # Project overview
│
└── LICENSE            # MIT License
```

---

## **Installation**

Install required libraries:

```r
install.packages(c("gsm", "tidyverse", "ggplot2", "shinydashboard", "shiny"))
```

---

## **How to Run the Dashboard**

1. Clone the repository:

```bash
git clone https://github.com/yourusername/rbqm-dashboard-gsm.git
```

2. Open the project in RStudio.
3. Load required packages.
4. Run the application:

```r
shiny::runApp()
```

---

## **Data Disclaimer**

All datasets included in this repository are **fully synthetic** and do not contain any PHI, PII, or confidential study information. They are generated solely for demonstration and training purposes.

---

## **License**

This project is released under the **MIT License**, enabling open use while protecting ownership of the contributed material.

---

## **Acknowledgment**

This project uses the **gsm** package from the Gilead BioStats team to compute clinical metrics. The dashboard implementation, structure, and dummy datasets are independently created.

---

## **Purpose**

This repository is designed to demonstrate:

* Clinical programming capability
* Real-world RBQM understanding
* R workflow and dashboard design
* Industry-ready coding practices

Use it as a portfolio piece to communicate competence in analytics-driven clinical oversight.
