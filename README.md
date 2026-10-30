# Medicare Healthcare Utilization Analysis — 2024
--- 
![](HealthcareUtilizationInfographic.png)
--- 
## PROJECT OVERVIEW
---
This project examines Medicare healthcare utilization patterns across provider types and geographic locations using the **2024 CMS Medicare Physician & Other Practitioners dataset**.

Using **MySQL** for data validation and analysis and **Power BI** for data visualisation, the project explores reported service volume, provider supply, reported beneficiary counts, and Medicare payments.

The goal is to understand how reported healthcare activity is distributed across provider types and US states, and how service volume varies relative to provider supply.
 
## PROBLEM STATEMENT
--- 
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
  
- Dataset: Medicare Physician & Other Practitioners, 2024
  
- Records analysed: 669,587 rows in the imported MySQL table
  
- Tools: MySQL and Microsoft Power BI

 ## KEY SKILLS DEMONSTRATED
--- 
 - Data cleaning (Mysql)

 - DAX measures (payment per service, reported beneficiary volume, service per provider, total medicare payment)

 - Interactive slicers (state, provider types)

 - Data visualization (Power Bi)

## ANALYSIS
--- 
### 1. Data Quality Assessment

Initial SQL checks assessed missing values in the provider, geographic, service, beneficiary, and payment fields.

The initial assessment identified nine NULL values in Rndrng_Prvdr_Last_Org_Name and no NULL values in the core analytical fields checked.

The nine missing organisation-name values were not automatically replaced or deleted because the field was not required for the main dashboard measures.
   
 


