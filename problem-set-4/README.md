# HW4 — Credit Card Default Risk & Healthcare Utilisation

## Overview

Two independent case studies applying advanced regression techniques: logistic regression for binary outcome modelling (credit default) and linear regression with interaction terms and model diagnostics (health status).

**Authors:** Paula Gillessen, Julian Sandalek and Julian Hofmaninger  
**Instructor:** Tomas Masak, Ph.D.  
**Term:** Winter Term 2025/2026  

## Case Study 1: Credit Card Default Risk

**Dataset:** 10,000 credit card customers. Variables: default status (yes/no), student status (yes/no), outstanding balance, annual income.

**Analysis:**
- Numerically and graphically described default rates by student status and income level
- Estimated a **logistic regression model** (binomial GLM) with all three predictors

**Key Results:**
- Credit card balance was the strongest predictor of default (p < 0.001): higher outstanding balance strongly increases default probability
- Income was not significantly associated with default (p = 0.71) after controlling for balance and student status
- Students had 91% higher odds of default compared to non-students (OR = 1.91, 99% CI: [1.04, 3.50])
- The 99% confidence interval for the student odds ratio lies entirely above 1, confirming the result is significant even at the 1% level

**Relevance:** The modelling approach — binary outcome, log-odds interpretation, odds ratio confidence intervals — is directly applicable to credit risk assessment frameworks used in banking and financial analysis.

## Case Study 2: Healthcare Utilisation and Health Status

**Dataset:** 485 US individuals in 1986. Variables: number of doctor visits, household children, healthcare access category (A–D), health status score.

**Analysis:**
- Assessed distributional assumptions for one-way ANOVA on doctor visits by access group; heavy right-skew and outliers violated normality, so **Kruskal-Wallis test** was applied instead (p = 0.013 — significant)
- Estimated three nested linear models for health status:
  - Model A: doctor + children
  - Model B: doctor + access + children (additive)
  - Model C: doctor × access + children (with interaction)
- Used **partial F-tests** to compare models: interaction model C was significantly better than additive model B (p = 0.006), indicating that the effect of doctor visits on health differs by access level
- Diagnosed **heteroscedasticity** and non-normality of residuals from residuals vs. fitted and Q-Q plots
- Applied **log-transformation** of the dependent variable to stabilise variance; re-estimated and interpreted coefficients as approximate percentage changes

**Key Finding:** The benefit of doctor visits for health status depends on the level of healthcare access — a meaningful interaction effect that would be missed by a purely additive model.

## Files

| File | Description |
|---|---|
| `HW4.R` | Collection of used R code |
| `HW4.Rmd` | R Markdown source |
| `HW4.pdf` | Compiled output with all models, diagnostics and interpretation |
