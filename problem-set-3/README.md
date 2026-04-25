# HW3 — COVID-19 Excess Mortality and Policy Stringency Across US States

## Overview

This case study investigates whether stricter COVID-19 policy measures were associated with lower excess mortality across US states in 2020 — while controlling for confounding factors including GDP per capita, population density, and political affiliation (Democratic vote share).

**Authors:** Paula Gillessen, Julian Sandalek and Julian Hofmaninger  
**Instructor:** Tomas Masak, Ph.D.  
**Term:** Winter Term 2025/2026  

## Dataset

`Excess.RData` — 51 US states (including District of Columbia), 2020. Variables: excess deaths per million, Oxford Stringency Index average, GDP per capita, Democratic vote share, population density.

## Analysis

### Exploratory Analysis
- Described the distribution of excess deaths numerically: median ~1,460 deaths per million, range 191 (Hawaii) to 2,332 (New Jersey)
- Visualised all numeric variables using histograms and boxplots; identified outliers by variable
- Calculated the full Pearson correlation matrix — highest absolute correlation was 0.948 between `pop_dens` and `GDPpc`
- Identified **District of Columbia** as a multivariate outlier (extreme values on GDPpc, dem_share, and pop_dens simultaneously) and excluded it from further analysis
- Reassessed correlations and distribution shapes after exclusion; recommended log-transformation of `pop_dens` due to persistent right skew

### Hypothesis Testing
- One-sample t-test confirmed excess deaths were significantly greater than zero (t = 21.05, p < 0.001)
- Pearson correlation between stringency and excess deaths: r = −0.20, 95% CI [−0.45, 0.08] — not statistically significant

### Regression Modelling
- **Simple OLS:** Stringency alone explained only 4% of variance in excess deaths (R² = 0.04, p = 0.16)
- **Multiple OLS:** Adding GDPpc, dem_share, and pop_dens raised R² to 0.30. GDP per capita (negative effect) and population density (positive effect) were the only statistically significant predictors. Stringency remained insignificant (p = 0.94) and was removed via partial F-test
- **Final model:** excess ~ GDPpc + dem_share + pop_dens (Adjusted R² = 0.26, p < 0.001)
- Coloured scatterplot revealed political alignment as a strong confounder — Democratic states applied stricter measures but also had different structural characteristics

## Key Finding

After controlling for GDP and population density, policy stringency had no statistically significant effect on excess mortality. Wealthier states and less densely populated states had significantly fewer excess deaths. The analysis demonstrates the importance of controlling for confounders in observational policy evaluation.

## Files

| File | Description |
|---|---|
| `HW3.R` | Collection of used R code |
| `HW3.Rmd` | R Markdown source |
| `HW3.pdf` | Compiled output with all plots, test results and interpretation |
