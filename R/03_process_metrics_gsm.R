###############################################################################
# SECTION: SUBJECT-LEVEL STUDY DURATION DERIVATION
# Goal:
#   - Compute start date and end date for each subject
#   - Derive total number of days each subject spent in the study
###############################################################################

# Extract earliest visit date per subject (start of study involvement)
visit_data1 <- visit_data %>%
  arrange(subjectid, visit_dt) %>%        # Sort by subject and visit date
  group_by(subjectid) %>%                 # Group by subject
  slice(1) %>%                             # Take the FIRST record = earliest date
  select(subjectid, visit_dt) %>%         # Only keep necessary fields
  rename(start = visit_dt)                # Rename for clarity

# Extract latest visit date per subject (end of study involvement)
visit_data2 <- visit_data %>%
  arrange(subjectid, visit_dt) %>%        # Sort by subject and visit date
  group_by(subjectid) %>%                 # Group by subject
  slice(n()) %>%                           # Take the LAST record
  select(subjectid, visit_dt) %>%         # Only keep required fields
  rename(end = visit_dt)                  # Rename for clarity

# Merge start & end dates and compute study duration
visit_data_fin <- full_join(visit_data1, visit_data2, by = "subjectid") %>%
  mutate(
    days = as.numeric(as.Date(end) - as.Date(start) + 1)  # Study duration
  )

###############################################################################
# SECTION: GENERATE ADVERSE EVENT RATE KRI
# Goal:
#   - Compute AE event rate normalized by total subject-days on study
#   - Apply gsm KRI workflow: Input → Transform → Analyze → Flag → Summarize
#
# Packages required:
#   - gsm.kri for KRI engine
#   - gsm.core / gsm.mapping (depending on data preparation)
###############################################################################

### Step 1 — Create Input Data for Rate-Based KRI
# Input_Rate() prepares the numerator/denominator structure for rate KRIs.
# Numerator   = count of AEs per subject
# Denominator = total days on study
# Group       = site-level aggregation

kri001input <- Input_Rate(
  dfNumerator       = ae_data,          # Adverse event records
  dfDenominator     = visit_data_fin,   # Derived subject-days
  dfSubjects        = demographics_data, # Subject-level metadata
  strGroupCol       = "siteid",         # Grouping for output (site-level)
  strSubjectCol     = "subjectid",      # Key subject identifier
  strNumeratorCol   = "subjectid",      # Used to count AEs
  strDenominatorCol = "days",           # Total exposure days
  strNumeratorMethod   = "Count",       # Each AE counts as 1
  strDenominatorMethod = "Sum"          # Sum of days across subjects
)

### Step 2 — Transform data for standardized KRI analysis
# Transform_Rate() prepares normalized inputs and ensures structure matches
# gsm.kri expectations.

kri001trans <- Transform_Rate(kri001input)

### Step 3 — Analyze rate using Normal Approximation
# Analyze_NormalApprox() produces mean, variance, z-score-like statistics
# for rate-based KRIs.

kri001anal <- Analyze_NormalApprox(
  kri001trans,
  strType = "rate"   # Specifies rate-based KRI model
)

### Step 4 — Apply Thresholds & Flag Risks
# Flag_NormalApprox() assigns flags based on numeric thresholds.
# Threshold vector meaning:
#   c(-2, -1, 2, 3) = mild/moderate/high/critical thresholds

kri001Flg <- Flag_NormalApprox(
  kri001anal,
  vThreshold = c(-2, -1, 2, 3)
)

### Step 5 — Summarize KRI Output for Reporting
# Summarize() produces clean, site-level aggregated results.

kri001fin <- Summarize(kri001Flg) %>%
  mutate(MetricID = "Analysis_kri0001")   # Attach metric identifier

### Step 6 — Human-Readable Labels (for reporting or plots)
labels <- list(
  Metric     = "Adverse Event Rate",
  Numerator  = "Adverse Events",
  Denominator = "Days on Study"
)

###############################################################################
# End of KRI Computation Section
###############################################################################

