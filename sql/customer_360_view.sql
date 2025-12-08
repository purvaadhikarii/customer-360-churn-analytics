CREATE DATABASE customer360;
USE customer360;
USE customer360;
SELECT TOP 10 * FROM telco_churn;


IF OBJECT_ID('dbo.customer_360', 'V') IS NOT NULL
    DROP VIEW dbo.customer_360;
GO

CREATE VIEW dbo.customer_360 AS
SELECT
    customerID,
    gender,
    SeniorCitizen,
    Partner,
    Dependents,
    tenure,
    PhoneService,
    MultipleLines,
    InternetService,
    OnlineSecurity,
    OnlineBackup,
    DeviceProtection,
    TechSupport,
    StreamingTV,
    StreamingMovies,
    Contract,
    PaperlessBilling,
    PaymentMethod,
    MonthlyCharges,
    TotalCharges,
    Churn,
    CASE
        WHEN tenure BETWEEN 0 AND 12 THEN '0-1yr'
        WHEN tenure BETWEEN 13 AND 24 THEN '1-2yr'
        WHEN tenure BETWEEN 25 AND 48 THEN '2-4yr'
        ELSE '4+yr'
    END AS tenure_group
FROM dbo.telco_churn;   -- change if your table name is different

