###############################################################################
# 02_load_data.R
# Purpose:
# Load synthetic clinical datasets required for the gsm workflow.
# These datasets come from the 'clindata' package, which provides
# reproducible, source-like sample data for RBQM demonstrations.
###############################################################################

# Load required library (already installed in 01_load_packages.R)
library(clindata)

###############################################################################
# Load Synthetic Data
# NOTE:
# clindata provides clean, consistent example datasets that mimic
# real clinical trial structures. They are SAFE for public repos.
###############################################################################

# Example dataset: Subject-level data
subject_data <- clindata::subject

# Example dataset: Visit-level data
visit_data <- clindata::visit

# Example dataset: AE (Adverse Events)
ae_data <- clindata::ae

# Example dataset: Queries or data-entry related tables (if provided)
# query_data <- clindata::query    # Uncomment if your workflow uses it

###############################################################################
# Inspect datasets
###############################################################################
str(subject_data)
str(visit_data)
str(ae_data)

###############################################################################
# Combine or prepare data if needed
# (Your gsm workflow may expect certain structures)
###############################################################################

# Example: merge subject + visit (if gsm mapping requires alignment)
# merged_data <- merge(subject_data, visit_data, by = "subject_id")

###############################################################################
# Optional: Save a local copy into /data folder for reproducibility
# This ensures that anyone who runs your repo gets identical datasets.
###############################################################################

# readr::write_csv(subject_data, "data/subject_data.csv")
# readr::write_csv(visit_data, "data/visit_data.csv")
# readr::write_csv(ae_data, "data/ae_data.csv")

###############################################################################
# Data is now loaded and ready for gsm.mapping → gsm.core → gsm.kri workflows
###############################################################################

