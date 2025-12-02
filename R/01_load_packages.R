###############################################################################
# 01_load_packages.R
# Purpose:
# Install (if needed) and load all required packages for the RBQM workflow
# built using the gsm suite from Gilead-BioStats.
###############################################################################

# Ensure remotes is available for GitHub package installation
if (!requireNamespace("remotes", quietly = TRUE)) {
  install.packages("remotes")
}
library(remotes)

###############################################################################
# Install & Load GSM Ecosystem Packages from GitHub
# The gsm suite is modular: core analytics, data mapping, KRI generation, reporting.
###############################################################################

# 1) clindata: Provides sample/utility datasets for testing and workflow development.
remotes::install_github("Gilead-BioStats/clindata", quiet = TRUE)
library(clindata)

# 2) gsm.core: The core analytics engine — contains utility functions and core data-pipeline logic.
remotes::install_github("Gilead-BioStats/gsm.core", quiet = TRUE)
library(gsm.core)

# 3) gsm.mapping: Responsible for data transformation — mapping raw/source datasets into structures usable by gsm.
remotes::install_github("Gilead-BioStats/gsm.mapping", quiet = TRUE)
library(gsm.mapping)

# 4) gsm.kri: Builds on gsm.core + mapping to compute Key Risk Indicators (KRIs), metrics, and provide visualization/reporting functionality.
remotes::install_github("Gilead-BioStats/gsm.kri", quiet = TRUE)
library(gsm.kri)

# 5) gsm.reporting: Provides workflows to generate reporting data models (tables, summaries) needed for final reports or dashboards.
remotes::install_github("Gilead-BioStats/gsm.reporting", quiet = TRUE)
library(gsm.reporting)

###############################################################################
# Additional Utility Libraries for Data Handling & Visualization
###############################################################################
library(dplyr)     # Data wrangling
library(tidyr)     # Data reshaping
library(ggplot2)   # Plotting and visualization
library(readr)     # CSV reading/parsing for synthetic input data

###############################################################################
# End of package load script
###############################################################################

