CREATE DATABASE  healthdata;
USE healthdata;

SELECT * FROM medicare_physician_other_practitioners_by_provider_2024
LIMIT 5;

DESCRIBE medicare_physician_other_practitioners_by_provider_2024;

USE healthdata;
-- Checking for Blanks 
SELECT
    COUNT(*) AS total_rows,
    SUM(Rndrng_NPI IS NULL) AS missing_npi,
    SUM(Rndrng_Prvdr_City IS NULL) AS missing_city,
    SUM(Rndrng_Prvdr_State_Abrvtn IS NULL) AS missing_state,
    SUM(Rndrng_Prvdr_RUCA_Desc IS NULL) AS missing_ruca_desc,
    SUM(Rndrng_Prvdr_Cntry IS NULL) AS missing_country,
    SUM(Rndrng_Prvdr_Last_Org_Name IS NULL) AS missing_last_org_name,
    SUM(Rndrng_Prvdr_First_Name IS NULL) AS missing_first_name,
    SUM(Rndrng_Prvdr_Crdntls IS NULL) AS missing_credentials,
    SUM(Rndrng_Prvdr_RUCA IS NULL) AS missing_ruca,
    SUM(Rndrng_Prvdr_Type IS NULL) AS missing_provider_type,
    SUM(Tot_HCPCS_Cds IS NULL) AS missing_hcpcs_codes,
    SUM(Tot_Benes IS NULL) AS missing_beneficiaries,
    SUM(Tot_Srvcs IS NULL) AS missing_services,
    SUM(Tot_Sbmtd_Chrg IS NULL) AS missing_submitted_charges,
    SUM(Tot_Mdcr_Alowd_Amt IS NULL) AS missing_allowed_amount,
    SUM(Tot_Mdcr_Pymt_Amt IS NULL) AS missing_medicare_payment,
    SUM(Bene_Avg_Age IS NULL) AS missing_avg_age,
    SUM(Bene_Avg_Risk_Scre IS NULL) AS missing_risk_score
FROM medicare_physician_other_practitioners_by_provider_2024;

-- Creating a state  table
CREATE TABLE state_lookup (
    State_Abbreviation CHAR(2) PRIMARY KEY,
    State_Name VARCHAR(50)
);

INSERT INTO state_lookup (State_Abbreviation, State_Name)
VALUES
('AL', 'Alabama'),
('AK', 'Alaska'),
('AZ', 'Arizona'),
('AR', 'Arkansas'),
('CA', 'California'),
('CO', 'Colorado'),
('CT', 'Connecticut'),
('DE', 'Delaware'),
('FL', 'Florida'),
('GA', 'Georgia'),
('HI', 'Hawaii'),
('ID', 'Idaho'),
('IL', 'Illinois'),
('IN', 'Indiana'),
('IA', 'Iowa'),
('KS', 'Kansas'),
('KY', 'Kentucky'),
('LA', 'Louisiana'),
('ME', 'Maine'),
('MD', 'Maryland'),
('MA', 'Massachusetts'),
('MI', 'Michigan'),
('MN', 'Minnesota'),
('MS', 'Mississippi'),
('MO', 'Missouri'),
('MT', 'Montana'),
('NE', 'Nebraska'),
('NV', 'Nevada'),
('NH', 'New Hampshire'),
('NJ', 'New Jersey'),
('NM', 'New Mexico'),
('NY', 'New York'),
('NC', 'North Carolina'),
('ND', 'North Dakota'),
('OH', 'Ohio'),
('OK', 'Oklahoma'),
('OR', 'Oregon'),
('PA', 'Pennsylvania'),
('RI', 'Rhode Island'),
('SC', 'South Carolina'),
('SD', 'South Dakota'),
('TN', 'Tennessee'),
('TX', 'Texas'),
('UT', 'Utah'),
('VT', 'Vermont'),
('VA', 'Virginia'),
('WA', 'Washington'),
('WV', 'West Virginia'),
('WI', 'Wisconsin'),
('WY', 'Wyoming');

SELECT *
FROM state_lookup;

-- QUERIES

-- How many providers are there?
SELECT COUNT(DISTINCT Rndrng_NPI) AS No_of_providers
FROM medicare_physician_other_practitioners_by_provider_2024;

-- number of providers for each provider type
SELECT Rndrng_Prvdr_Type AS Provider_type, 
       COUNT(DISTINCT Rndrng_NPI ) AS No_of_providers
FROM medicare_physician_other_practitioners_by_provider_2024
GROUP BY Rndrng_Prvdr_Type
ORDER BY  No_of_providers DESC;

-- GEOGRAPHIC UTILIZATION
 
--  states with the highest number of providers
SELECT st.state_name AS State,
      COUNT(DISTINCT md.Rndrng_NPI) AS no_of_providers
FROM medicare_physician_other_practitioners_by_provider_2024 md
JOIN state_lookup st 
ON st.State_Abbreviation = md.Rndrng_Prvdr_State_Abrvtn
GROUP BY st.state_name
ORDER BY no_of_providers DESC;

-- State with the highest services provided
SELECT st.state_name AS State,
SUM(md.Tot_Srvcs) AS total_services
FROM medicare_physician_other_practitioners_by_provider_2024 md
JOIN state_lookup st
ON st.state_abbreviation = md.Rndrng_Prvdr_State_Abrvtn
GROUP BY st.state_name
ORDER BY total_services Desc;

-- states with the highest medicare beneficiaries
SELECT st.state_name AS State,
SUM(md.Tot_Benes) AS total_beneficiaries
FROM medicare_physician_other_practitioners_by_provider_2024 md
JOIN state_lookup st
ON st.state_abbreviation = md.Rndrng_Prvdr_State_Abrvtn
GROUP BY st.state_name
ORDER BY total_beneficiaries Desc;

-- Which states have the highest services per provider?

SELECT st.State_Name AS state,
SUM(md.Tot_Srvcs) AS Total_services,
COUNT( DISTINCT md.Rndrng_NPI) AS No_of_providers,
ROUND(SUM(md.Tot_Srvcs)/NULLIF(COUNT( DISTINCT md.Rndrng_NPI),0),2) AS No_of_services_per_provider
FROM medicare_physician_other_practitioners_by_provider_2024 md
JOIN state_lookup st 
ON st.State_Abbreviation = md.Rndrng_Prvdr_State_Abrvtn
GROUP BY State
ORDER BY No_of_services_per_provider DESC;

-- PROVIDER-TYPE UTILIZATION

-- Providers that provide the highest services
SELECT Rndrng_Prvdr_Type AS provider_type,
	   SUM(Tot_Srvcs)  AS total_services
FROM medicare_physician_other_practitioners_by_provider_2024
GROUP BY Rndrng_Prvdr_Type
ORDER BY total_services  DESC;

-- Provider type with the most reported number of beneficiaries
SELECT  Rndrng_Prvdr_Type,
	SUM(Tot_Benes) AS total_benefiaries
FROM medicare_physician_other_practitioners_by_provider_2024
GROUP BY  Rndrng_Prvdr_Type
ORDER BY total_benefiaries DESC;

-- how many provider types are there in each state
SELECT  
    st.state_name,
    md. Rndrng_Prvdr_Type AS Provider_type, 
    COUNT(DISTINCT Rndrng_NPI) AS no_of_providers
FROM medicare_physician_other_practitioners_by_provider_2024 md
JOIN state_lookup st
ON st.state_abbreviation = md.Rndrng_Prvdr_State_Abrvtn
GROUP BY   st.State_Name, md.Rndrng_Prvdr_Type
ORDER BY  no_of_providers DESC;

-- how many provider types are there in each city
SELECT  
	Rndrng_Prvdr_City,
    Rndrng_Prvdr_Type, 
    COUNT(DISTINCT Rndrng_NPI) AS no_of_providers
FROM medicare_physician_other_practitioners_by_provider_2024
GROUP BY  Rndrng_Prvdr_Type,
	Rndrng_Prvdr_City
ORDER BY  no_of_providers DESC;

-- Which provider types have the highest services per provider?
SELECT Rndrng_Prvdr_Type AS provider_type,
COUNT(DISTINCT Rndrng_NPI) AS No_of_providers,
SUM(Tot_Srvcs) AS Total_services,
ROUND(SUM(Tot_Srvcs)/NULLIF(COUNT(DISTINCT Rndrng_NPI),0),2) AS No_of_Service_per_provider
FROM medicare_physician_other_practitioners_by_provider_2024
GROUP BY  Rndrng_Prvdr_Type
ORDER BY No_of_Service_per_provider DESC;










-- how much did medicare spend 
SELECT ROUND(SUM(Tot_Mdcr_Pymt_Amt),0) AS amount_spent
FROM medicare_physician_other_practitioners_by_provider_2024;
-- How many states offer medicare services
SELECT COUNT(DISTINCT Rndrng_Prvdr_State_Abrvtn) AS no_of_states_offering_services
FROM medicare_physician_other_practitioners_by_provider_2024;

-- Which provider types received the most Medicare payments?
SELECT Rndrng_Prvdr_Type AS provider_type,
		ROUND(SUM(Tot_Mdcr_Pymt_Amt),2) AS medicare_payment_recieved
FROM medicare_physician_other_practitioners_by_provider_2024
GROUP BY Rndrng_Prvdr_Type
ORDER BY  medicare_payment_recieved ASC;


-- Which states account for the largest Medicare expenditure?
SELECT st.State_Name AS states,
       ROUND(SUM( md.Tot_Mdcr_Pymt_Amt),2) AS amount_received
FROM medicare_physician_other_practitioners_by_provider_2024 md
JOIN state_lookup st
ON st.State_Abbreviation = md.Rndrng_Prvdr_State_Abrvtn
GROUP BY st.State_Name
ORDER BY amount_received DESC;
