###############################################################################
# 04_generate_plots.R
# Purpose:
#   - Visualize the computed KRI outputs from 03_process_metrics_gsm.R
#   - Produce scatter plots, bar charts, and full metric visualizations
#     using tools from gsm.kri and gsm.reporting.
#
# Inputs required:
#   - kri001fin      (Final KRI results)
#   - labels         (Metric labeling list)
#
# Optional inputs:
#   - kri001Bounds   (Computed prediction / threshold bounds)
###############################################################################

library(gsm.kri)
library(gsm.reporting)

###############################################################################
# STEP 1 — Compute Prediction Bounds for Visualization
# Analyze_NormalApprox_PredictBounds():
#   - Generates expected ranges ("bounds") for each KRI value
#   - These provide shading or limits in visual widgets
#   - Thresholds match the same vector used during KRI flagging
###############################################################################

kri001Bounds <- Analyze_NormalApprox_PredictBounds(
  kri001fin,
  vThreshold = c(-2, -1, 2, 3)  # Same threshold logic used in Flag_NormalApprox()
)

###############################################################################
# STEP 2 — Scatter Plot Visualization
# Widget_ScatterPlot():
#   - Displays subject or site-level metric values
#   - Shows the position of each site relative to expected risk thresholds
#   - Useful for spotting outliers (high-risk sites)
###############################################################################

Widget_ScatterPlot(
  kri001fin,
  lMetric = labels,       # Human-readable label list from KRI script
  dfBounds = kri001Bounds # Prediction bounds to draw context regions
)

###############################################################################
# STEP 3 — Bar Chart Visualization
# Widget_BarChart():
#   - Produces a bar chart of metric scores per group (e.g., per site)
#   - "Score" typically represents standardized metric score (e.g., z-score)
#   - bAddGroupSelect = TRUE enables group selection widgets in Shiny,
#     but works fine standalone as a static visualization.
###############################################################################

Widget_BarChart(
  kri001fin,
  lMetric = labels,
  dfGroups = NULL,              # Can supply custom groups (optional)
  vThreshold = NULL,            # Can include threshold lines if desired
  strOutcome = "Score",         # "Score" = standardized metric outcome
  bAddGroupSelect = TRUE,       # Allows filtering by group in interactive use
  strShinyGroupSelectID = "SiteNumber",
  bDebug = FALSE
)

###############################################################################
# STEP 4 — Full Metric Visualization Wrapper
# Visualize_Metric():
#   - Combines scatter, bounds, metadata, and summary into a unified view
#   - Typically used for reporting or publication-quality outputs
#   - Reads the MetricID assigned in 03_process_metrics_gsm.R
###############################################################################

Visualize_Metric(
  dfResults = kri001fin,        # Final computed metrics
  dfBounds = kri001Bounds,      # Prediction bounds
  dfGroups = NULL,              # Optional grouping dataset
  dfMetrics = NULL,             # Custom metric metadata (optional)
  strMetricID = "Analysis_kri0001",  # Matches ID in KRI summary script
  strSnapshotDate = NULL,       # If you want snapshot labeling (e.g., "2025-01-01")
  bDebug = FALSE
)

###############################################################################
# NOTE:
# Some Widget_* functions show output directly in the RStudio Viewer pane.
# To save outputs as PNG files, wrap calls in functions like:
#   png("outputs/myplot.png"); Widget_ScatterPlot(...); dev.off()
#
# Example provided in 05_export_results.R.
###############################################################################

###############################################################################
# END OF VISUALIZATION SCRIPT
###############################################################################


