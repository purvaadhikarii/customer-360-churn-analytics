SELECT 
    Contract,
    COUNT(*) AS customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churners,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate_pct
FROM dbo.customer_360
GROUP BY Contract
ORDER BY churn_rate_pct DESC;
