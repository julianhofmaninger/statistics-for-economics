## Overview

This case study has two parts. The first covers core R programming operations. The second applies these skills to the `state.x77` dataset, a classic R built-in dataset containing socioeconomic indicators for all 50 US states circa 1970.

**Authors:** Paula Gillessen, Julian Sandalek and Julian Hofmaninger  
**Instructor:** Tomas Masak, Ph.D.  
**Term:** Winter Term 2025/2026  

## Part 1: R Programming Fundamentals

Covers essential R operations required for data analysis work:

- **Vector construction** using `seq()`, `rep()`, `c()` and arithmetic operators to generate structured numeric and character sequences
- **NA handling:** replacing missing values using positional logic with `which()` and index-based neighbor imputation
- **Random sampling:** generating normally distributed vectors with `rnorm()`, applying logical indexing and `sum()` for conditional counting
- **Matrix operations:** constructing a 5×5 matrix filled by row, extracting rows, columns and dimensions

## Part 2: US State Data Analysis

Dataset: `state.x77` — 8 numeric socioeconomic variables (Population, Income, Illiteracy, Life Expectancy, Murder rate, High School Graduation rate, Frost days, Area) for 50 US states.

**Tasks completed:**
- Explored dataset structure and confirmed absence of categorical variables
- Constructed three logical education-level groups (`LowEdu`, `MixedEdu`, `HighEdu`) based on high school graduation rate thresholds
- Created a numeric `EduStatus` variable and converted it to a labelled factor with `"Low Education"`, `"Mixed"`, and `"High Education"` levels
- Added the factor as a new column using `transform()`
- Produced a filtered subset of low-education states retaining only `Illiteracy` and `Life.Exp` columns

## Key Findings

13 states fell into the low education category, 29 into mixed, and 8 into high education. The subsetting and factor manipulation techniques used here form the foundation for the more advanced analyses in subsequent homeworks.

## Files

| File | Description |
|---|---|
| `HW1.R` | Collection of used R code |
| `HW1.Rmd` | R Markdown source |
| `HW1.pdf` | Compiled output with results and interpretation |

