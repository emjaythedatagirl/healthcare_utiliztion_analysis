# Medicare Healthcare Utilization Analysis — 2024
--- 
![](HealthcareUtilizationInfographic.png)
--- 
## PROJECT OVERVIEW
---
This project explores healthcare utilization and Medicare expenditure patterns using the 2024 Medicare Physician & Other Practitioners dataset published by the Centers for Medicare & Medicaid Services (CMS).

The analysis examines how Medicare providers, reported beneficiary volume, healthcare services and Medicare payments are distributed across provider specialties and geographic locations in the United States.

I used MySQL for data exploration, cleaning, validation and analysis, and Power BI to develop an interactive dashboard that presents the findings.

The project focuses on understanding the relationship between provider availability, service utilization and Medicare expenditure, while identifying differences across provider types and states.

## PROBLEM STATEMENT
--- 

Healthcare utilization and provider availability can vary considerably across geographic locations and medical specialties. Understanding these variations can provide useful insights into healthcare resource distribution and how Medicare spending is allocated.
The analysis seeked to answer the following questions:

- How does the *Total Services reported* and the *Unique Provider count* vary per state?

- What are the *Top 10* Provider types with the highest Reported Beneficiary Volume?

- What are the *Top 10* Provider types with the highest Total Services reported?

- Which Provider Types has the highest Service per Provider?

- How does the Total Medicare Payment vary across provider types?

 ## OBJECTIVES
--- 
- Assess the quality and completeness of the dataset.

- Compare provider counts and reported service volume across provider types.

- Examine geographic differences in reported service volume across states.

- Calculate average reported services per provider.

- Explore how reported beneficiary counts and Medicare payments vary across provider categories.

- Communicate findings and data limitations through an interactive Power BI dashboard.

## DATASET
---
- Source: Centers for Medicare & Medicaid Services (CMS)

- Dataset: Medicare Physician & Other Practitioners – 2024

- Records: Approximately 669,587 provider records

- Geographic coverage: U.S. states represented in the dataset

- Data structure: Provider-level aggregated Medicare utilization and payment information.

The dataset contains information about healthcare providers, their locations, provider specialties, reported beneficiaries, services rendered, submitted charges, Medicare-approved amounts and Medicare payments.

A separate state lookup table was created to map state abbreviations to their corresponding full state names for geographic analysis.

 ## KEY SKILLS DEMONSTRATED
--- 
### MySQL

- Database creation and management.

- Data exploration using SELECT and DESCRIBE.

- Data quality assessment and validation.

- Aggregations using SUM(), COUNT() and COUNT(DISTINCT).

- Grouping and ranking using GROUP BY and ORDER BY.

- Table relationships using JOIN.

- Calculating services per provider.

- Creating a state lookup table for geographic analysis.

### Power BI

- Data visualization and dashboard development.

- KPI cards for high-level performance indicators.

- Geographic comparisons across states.

- Provider specialty and service utilization comparisons.

- Medicare expenditure analysis.

- Interactive exploration of provider and geographic patterns.

### Analytical techniques

- Descriptive analysis.

- Geographic analysis.

- Provider distribution analysis.

- Specialty-level utilization analysis.

- Financial aggregation and comparison.

- Average services per provider calculations.

## ANALYSIS
--- 
### 1. Data Quality Assessment

Initial SQL checks assessed missing values in the provider, geographic, service, beneficiary, and payment fields.

The initial assessment identified nine NULL values in Rndrng_Prvdr_Last_Org_Name and no NULL values in the core analytical fields checked.

The nine missing organisation-name values were not automatically replaced or deleted because the field was not required for the main dashboard measures.

###  2. Key Performance Index (KPI)
--- 
| KPI | Value |
|---|---:|
| Reported Beneficiary Volume | 186 Million |
| Unique Providers | 670,000 |
| Total Medicare Payments | $61.70 Billion |
| Total Services | 2 Billion |

### 3. Key Questions Answered
---
#### - 
   
 


