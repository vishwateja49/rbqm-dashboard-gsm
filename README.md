# RBQM Analytics Workflow Using gsm Ecosystem  

A clean, professional demonstration of a **Risk‑Based Quality Management (RBQM)** analytics workflow built entirely in **R**, using the modular **gsm ecosystem** (`gsm.core`, `gsm.mapping`, `gsm.kri`, `gsm.reporting`) and **synthetic clinical datasets** from the **clindata** package. This project showcases metric computation, RBQM workflows, KRI generation, and reproducible visualizations **without any Shiny app**.

---

## **Overview**

This repository demonstrates an end‑to‑end RBQM workflow that:

* Loads synthetic clinical trial datasets from `clindata`
* Transforms and maps data using **gsm.mapping**
* Processes standardized data using **gsm.core**
* Computes Key Risk Indicators (KRIs) using **gsm.kri**
* Produces reporting summaries using **gsm.reporting**
* Generates RBQM plots for enrollment, site‑level risk, and data quality trends

All computations use the gsm ecosystem, and all data shown here is **fully synthetic**.

---

## **Features**

* Uses **gsm.core**, **gsm.mapping**, **gsm.kri**, **gsm.reporting**, and **clindata**
* Computes RBQM metrics end‑to‑end using only synthetic data
* Produces enrollment, risk, and data‑quality visualizations
* Clean, modular project structure suitable for recruiters and professionals
* 100% reproducible and open‑source 

---

## **Repository Structure**

```
rbqm-dashboard-gsm/
│
├── R/                      # Core analytic scripts
│   ├── 01_load_packages.R
│   ├── 02_load_data.R
│   ├── 03_process_metrics_gsm.R
│   └── 04_generate_plots.R

│
├── data/                   # Optional synthetic exports (if saved locally)
│   └── sample_input.csv
│
├── outputs/                # Generated plots and metric outputs
│   ├── enrollment_trend.png
│   ├── site_risk_distribution.png
│   └── final_metrics.csv
│
├── docs/                   # Optional documentation
│   └── workflow_overview.md
│
├── README.md               # Project overview
├── LICENSE                 # MIT License
└── .gitignore
```

---

## **Installation**

Install required libraries:

```r
# Install remotes if not available
install.packages("remotes")
library(remotes)

# Install gsm ecosystem packages from GitHub
install_github("Gilead-BioStats/clindata")
install_github("Gilead-BioStats/gsm.core")
install_github("Gilead-BioStats/gsm.mapping")
install_github("Gilead-BioStats/gsm.kri")
install_github("Gilead-BioStats/gsm.reporting")

# CRAN packages
install.packages(c("dplyr", "tidyr", "ggplot2", "readr"))
```

---

## **How to Run the Workflow**

Run each script sequentially:

```r
source("R/01_load_packages.R")     # Load gsm + tidyverse
source("R/02_load_data.R")         # Load clindata synthetic datasets
source("R/03_process_metrics_gsm.R")  # Run mapping → core → KRI → reporting
source("R/04_generate_plots.R")    # Generate RBQM visuals
source("R/05_export_results.R")    # Optional: export metrics to CSV
```

All output plots and metric files will appear in the **outputs/** folder.

---

## **Data Disclaimer**

All datasets used in this repository come from the **clindata** package and are **fully synthetic**. They contain **no PHI, PII, or proprietary study data**.

---

## **License**

This project is released under the **MIT License**, enabling open use while protecting the author's ownership of contributed materials.

---

## **Acknowledgment**

This project uses the gsm ecosystem created by the **Gilead BioStats** team:

* `gsm.core`
* `gsm.mapping`
* `gsm.kri`
* `gsm.reporting`
* `clindata`

Dashboard logic, workflow structure, plots, and scripting are independently designed for educational and portfolio demonstration purposes.

---

## **Purpose**

This repository demonstrates:

* Clinical programming and RBQM analytics skills
* Ability to work with the gsm modular ecosystem
* End‑to‑end KRI generation and reporting pipeline
* Clean R workflow design with reproducibility
* Real‑world trial oversight understanding using synthetic data

Use this repository as a portfolio piece to communicate competence in **RBQM analytics**, **clinical data transformation**, and **R‑based metric engineering**.
