# HW2 — Labour Market Outcomes & Housing Satisfaction in Vienna

## Overview

Two independent case studies using real survey datasets. Both focus on testing whether observed differences between groups are statistically significant, requiring careful selection of appropriate hypothesis tests.

**Authors:** Paula Gillessen, Julian Sandalek and Julian Hofmaninger  
**Instructor:** Tomas Masak, Ph.D.  
**Term:** Winter Term 2025/2026  

## Case Study 1: Layoff and Re-employment (1974 Labour Market Data)

**Dataset:** 1,314 employees laid off in 1974, tracked until January 1975. Variables: employment status (new job vs. still unemployed) and length of prior employment (six categories from under 1 month to over 5 years).

**Analysis:**
- Recoded integer-coded variables as labelled factors
- Described employment outcomes by employment length group using absolute and relative frequency tables and grouped bar charts
- Applied a **Pearson chi-squared test** to assess whether employment status distribution is homogeneous across employment length groups

**Finding:** The chi-squared test returned p = 0.27, providing no statistically significant evidence that prior employment length affects re-employment outcomes. The re-employment rate remained relatively stable (around 63–68%) across most groups.

## Case Study 2: Living Conditions and Satisfaction in Vienna

**Dataset:** Survey of Vienna residents covering housing type, neighbour contact frequency, and residential satisfaction.

**Analysis:**
- Collapsed the three-level satisfaction variable into a binary (`low-medium` vs. `high`)
- Visualised the relationship between contact frequency and satisfaction using mosaic plots
- Applied both a **chi-squared test** and an **odds ratio test** (via `vcd` package) to assess statistical dependence
- Repeated the analysis for the apartment-dweller subgroup

**Finding:** For the full dataset, chi-squared returned p = 0.30 (non-significant), while the odds ratio of 1.11 was highly significant (p < 0.001), illustrating how the two tests can diverge. For apartment dwellers specifically, the chi-squared test became significant (p = 0.034) with an odds ratio of 1.38, suggesting that the contact-satisfaction relationship is stronger within this housing subgroup.

## Files

| File | Description |
|---|---|
| `HW2.R` | Collection of used R code |
| `HW2.Rmd` | R Markdown source |
| `HW2.pdf` | Compiled output with results and interpretation |
