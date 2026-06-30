# SQL-project-Business-Problem-

SQL Data Analytics Retail
Retail Analytics Case Study
A data analytics project leveraging SQL to analyse sales performance, segment customers, and uncover behavioural patterns for a retail company experiencing stagnant growth and declining engagement.

---

## Overview

This case study examines a retail company's challenges in product performance variability, customer segmentation, and purchase behaviour analysis. By querying structured datasets, we derive actionable insights to guide inventory decisions, marketing campaigns, and retention strategies.

---

## Business Problems

- **Product Performance Variability** — Identify high and low-selling products to optimize inventory and marketing focus.
- **Customer Segmentation** — Build a clear picture of the customer base for targeted campaigns.
- **Behavior Analysis** — Uncover repeat purchase patterns and loyalty indicators to improve retention.

---

## Datasets

| Dataset | Key Fields |
|---|---|
| Sales Transactions | transaction_id, customer_id, product_id, quantity, transaction_date, price |
| Customer Profiles | customer_id, age, gender, location, join_date |
| Product Inventory | product_id, product_name, category, stock_level, price |

---

## Customer Segmentation Schema

| Total Orders | Segment |
|---|---|
| 0 | No Orders |
| 1–10 | Low |
| 10–30 | Mid |
| > 30 | High Value |

---

## Objectives

1. Use SQL for data cleaning and exploratory data analysis (EDA)
2. Identify high and low sales products
3. Segment customers by purchasing behavior
4. Analyze repeat purchase patterns and loyalty indicators

---

## Project Structure

```
retail-analytics/
├── data/
│   ├── sales_transactions.csv
│   ├── customer_profiles.csv
│   └── product_inventory.csv
├── sql/
│   ├── 01_data_cleaning.sql
│   ├── 02_product_performance.sql
│   ├── 03_customer_segmentation.sql
│   └── 04_behavior_analysis.sql
├── results/
│   └── insights_summary.md
└── README.md
```

## Project: 
## Retail Analytics Case Study
## Background
In the rapidly evolving retail sector, businesses continually seek innovative strategies to stay ahead of the competition, improve customer satisfaction, and optimize operational efficiency. Leveraging data analytics has become a cornerstone for achieving these objectives. This case study focuses on a retail company that has encountered challenges in understanding its sales performance, customer engagement, and inventory management. Through a comprehensive data analysis approach, the company aims to identify high or low-selling products, effectively segment its customer base, and analyze customer behavior to enhance marketing strategies, inventory decisions, and overall customer experience.
Business Problem
The retail company has observed stagnant growth and declining customer engagement metrics over the past quarters. Initial assessments indicate potential issues in product performance variability, ineffective customer segmentation, and lack of insights into customer purchasing behavior. The company seeks to leverage its sales transaction data, customer profiles, and product inventory information to address the following key business problems:
Product Performance Variability: Identifying which products are performing well in terms of sales and which are not. This insight is crucial for inventory management and marketing focus.
Customer Segmentation: The company lacks a clear understanding of its customer base segmentation. Effective segmentation is essential for targeted marketing and enhancing customer satisfaction.
Customer Behavior Analysis: Understanding patterns in customer behavior, including repeat purchases and loyalty indicators, is critical for tailoring customer engagement strategies and improving retention rates.
Objectives
To utilize SQL queries for data cleaning and exploratory data analysis to ensure data quality and gain initial insights.
To identify high and low sales products to optimize inventory and tailor marketing efforts.
To segment customers based on their purchasing behavior for targeted marketing campaigns. Create Customer segments - 
Total Number of Orders
Customer Segment
0
No Orders 
1-10
Low
10-30
Mid
>30
High Value


To analyze customer behavior for insights on repeat purchases and loyalty, informing customer retention strategies.



## Datasets
Sales Transactions Dataset: Records of sales transactions, including transaction ID, customer ID, product ID, quantity purchased, transaction date, and price.
Customer Profiles Dataset: Information on customers, including customer ID, age, gender, location, and join date.
Product Inventory Dataset: Data on product inventory, including product ID, product name, category, stock level, and price.



