-- Fraud Transaction Analysis SQL Queries

-- 1. View all transactions
SELECT *
FROM transactions;

-- 2. Count total transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

-- 3. Count fraud vs non-fraud transactions
SELECT 
    is_fraud,
    COUNT(*) AS transaction_count
FROM transactions
GROUP BY is_fraud;

-- 4. Find high-risk transactions
SELECT 
    transaction_id,
    customer_id,
    transaction_amount,
    payment_method,
    location,
    risk_score,
    is_fraud
FROM transactions
WHERE risk_score >= 70
ORDER BY risk_score DESC;

-- 5. Average transaction amount by fraud status
SELECT 
    is_fraud,
    AVG(transaction_amount) AS avg_transaction_amount
FROM transactions
GROUP BY is_fraud;

-- 6. Fraud transactions by payment method
SELECT 
    payment_method,
    COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 'Yes'
GROUP BY payment_method
ORDER BY fraud_count DESC;

-- 7. Transactions requiring review
SELECT 
    transaction_id,
    customer_id,
    transaction_amount,
    transaction_status,
    risk_score
FROM transactions
WHERE transaction_status = 'Review'
   OR risk_score >= 70;

-- 8. Fraud transactions by location
SELECT 
    location,
    COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 'Yes'
GROUP BY location
ORDER BY fraud_count DESC;
