# Fraud Transaction Analysis using Python

import pandas as pd

# Load the transaction dataset
df = pd.read_csv("sample_transactions.csv")

# Display first few rows
print("Sample Transaction Data:")
print(df.head())

# Total number of transactions
total_transactions = len(df)
print("\nTotal Transactions:", total_transactions)

# Fraud vs Non-Fraud count
fraud_counts = df["is_fraud"].value_counts()
print("\nFraud vs Non-Fraud Transactions:")
print(fraud_counts)

# Average transaction amount by fraud status
avg_amount = df.groupby("is_fraud")["transaction_amount"].mean()
print("\nAverage Transaction Amount by Fraud Status:")
print(avg_amount)

# High-risk transactions
high_risk = df[df["risk_score"] >= 70]
print("\nHigh-Risk Transactions:")
print(high_risk)

# Fraud transactions by payment method
fraud_by_payment = df[df["is_fraud"] == "Yes"]["payment_method"].value_counts()
print("\nFraud Transactions by Payment Method:")
print(fraud_by_payment)

# Fraud transactions by location
fraud_by_location = df[df["is_fraud"] == "Yes"]["location"].value_counts()
print("\nFraud Transactions by Location:")
print(fraud_by_location)

# Business summary
print("\nBusiness Summary:")
print("High-risk transactions should be reviewed closely.")
print("Transactions with risk scores above 70 may indicate suspicious activity.")
print("Payment method, location, and transaction amount can help identify fraud patterns.")
