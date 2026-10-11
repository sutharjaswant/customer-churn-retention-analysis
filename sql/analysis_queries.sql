-- Customer Churn & Retention Analysis
-- SQL Business Analysis Queries

-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- 2. Churned Customers
SELECT COUNT(*) AS churned_customers
FROM customers
WHERE Churn = 'Yes';


-- 3. Overall Churn Rate
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers;


-- 4. Churn by Contract
SELECT
    Contract,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Contract
ORDER BY churn_rate DESC;


-- 5. Churn by Tenure Group
SELECT
    Tenure_Group,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY Tenure_Group
ORDER BY churn_rate DESC;


-- 6. Churn by Payment Method
SELECT
    PaymentMethod,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;


-- 7. Churn by Internet Service
SELECT
    InternetService,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY InternetService
ORDER BY churn_rate DESC;


-- 8. Average Customer Metrics by Churn
SELECT
    Churn,
    COUNT(*) AS customers,
    ROUND(AVG(tenure), 2) AS average_tenure,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS average_total_charges
FROM customers
GROUP BY Churn;


-- 9. Churn by Online Security
SELECT
    OnlineSecurity,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers
GROUP BY OnlineSecurity
ORDER BY churn_rate DESC;


-- 10. High-Risk Customer Analysis
SELECT
    High_Risk_Customer,
    COUNT(*) AS customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate,
    ROUND(AVG(tenure), 2) AS average_tenure,
    ROUND(AVG(MonthlyCharges), 2) AS average_monthly_charges
FROM customers
GROUP BY High_Risk_Customer
ORDER BY High_Risk_Customer DESC;