# 🛒 E-Commerce Transaction Analysis — SQL + Power BI Project

A complete end to end data analysis project on an e-commerce transactions dataset. This project covers SQL analysis from basic to advanced level and a Power BI dashboard with interactive visuals.

---

## 📁 Dataset

**File:** `ecommerce_transactions.csv`  
**Database:** `SalesAnlys`  
**Table:** `ecommerce_transactions`

| Column | Description |
|---|---|
| Transaction_ID | Unique ID for each transaction |
| User_Name | Name of the customer |
| Age | Age of the customer |
| Country | Country of the customer |
| Product_Category | Category of product purchased |
| Purchase_Amount | Amount spent in the transaction |
| Payment_Method | Payment method used |
| Transaction_Date | Date of the transaction |

---

## 🎯 Project Goals

- Analyze sales trends over time
- Understand customer behavior by age group and country
- Identify top performing products and customers
- Analyze payment method preferences
- Build an interactive Power BI dashboard

---

## 📊 Dashboard Preview

![Dashboard] <img width="1115" height="623" alt="image" src="https://github.com/user-attachments/assets/b4a67fdc-2d95-4fa6-877c-27dbd005734b" />



**Dashboard contains:**
- Total Transactions, Total Revenue, Average Purchase, Total Users (KPI Cards)
- Sales by Product Category (Bar Chart)
- Sales by Payment Method (Donut Chart)
- Total Purchase by Country (Map)
- Monthly Sales Trend (Line Chart)
- Country and Product Category Slicers

---

## 🧠 SQL Analysis

### ✅ Basic Analysis
- Total number of transactions
- Total purchase amount
- Unique countries and product categories
- Total number of unique users

### ✅ Customer Analysis
- Total sales by country
- Top 5 users by purchase amount
- Average purchase amount by country
- Users who spent more than average

### ✅ Product Analysis
- Total sales by product category
- Highest purchase amount in each category
- Most popular category in each country

### ✅ Payment Analysis
- Most used payment method
- Total transactions by payment method
- Average purchase amount by payment method

### ✅ Time Analysis
- Monthly sales trend
- Best performing month
- Total sales by year

### ✅ Customer Segmentation
- Age group wise sales (Young 18-25, Middle 26-40, Senior 40+)
- Top 3 countries by number of transactions

---

## 💻 Sample Queries

**Monthly Sales Trend:**
```sql
SELECT MONTH(Transaction_Date) as months,
ROUND(SUM(Purchase_Amount), 2) as monthly_sales
FROM ecommerce_transactions
GROUP BY MONTH(Transaction_Date)
ORDER BY MONTH(Transaction_Date);
```

**Age Group Wise Sales:**
```sql
SELECT 
CASE 
    WHEN Age BETWEEN 18 AND 25 THEN 'Young'
    WHEN Age BETWEEN 26 AND 40 THEN 'Middle'
    WHEN Age > 40 THEN 'Senior'
END AS age_group,
ROUND(SUM(Purchase_Amount), 2) as total_sales
FROM ecommerce_transactions
GROUP BY 
CASE 
    WHEN Age BETWEEN 18 AND 25 THEN 'Young'
    WHEN Age BETWEEN 26 AND 40 THEN 'Middle'
    WHEN Age > 40 THEN 'Senior'
END;
```

**Most Popular Category in Each Country:**
```sql
SELECT Country, Product_Category, COUNT(*) as total 
FROM ecommerce_transactions
GROUP BY Country, Product_Category
HAVING COUNT(*) = (
    SELECT MAX(counted)
    FROM (
        SELECT COUNT(*) as counted
        FROM ecommerce_transactions as inner_table
        WHERE inner_table.Country = ecommerce_transactions.Country
        GROUP BY Product_Category
    ) as sub
);
```

**Users Who Spent More Than Average:**
```sql
SELECT User_Name, 
ROUND(SUM(Purchase_Amount), 2) as total_spent
FROM ecommerce_transactions
GROUP BY User_Name
HAVING SUM(Purchase_Amount) > (
    SELECT AVG(Purchase_Amount) 
    FROM ecommerce_transactions
);
```

---

## 🧰 SQL Concepts Used

| Concept | Where Used |
|---|---|
| SELECT, WHERE | Basic filtering |
| GROUP BY | Sales by country, category |
| ORDER BY | Rankings and trends |
| SUM, AVG, COUNT, MAX | Aggregations |
| ROUND | Formatting amounts |
| TOP N | Top users, countries |
| DISTINCT | Unique values |
| CASE WHEN | Age group segmentation |
| Subqueries | Average comparison, most popular category |
| MONTH(), YEAR() | Date analysis |
| HAVING | Filter after aggregation |

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| SQL Server | Data storage and querying |
| SSMS | Writing and running SQL queries |
| Power BI | Dashboard and visualization |

---

## 🚀 How to Run

1. Clone this repository
2. Import the dataset into SQL Server
3. Create database `SalesAnlys`
4. Run queries from the `.sql` file
5. Open `.pbix` file in Power BI Desktop

```sql
USE SalesAnlys;
```

---

## 📂 Project Structure

```
📁 E-Commerce-Transaction-Analysis
│
├── 📄 ecommerce_transactions.csv    -- Raw dataset
├── 📄 analysis_queries.sql          -- All SQL queries
├── 📄 E-commerce_Transaction_Analysis.pbix  -- Power BI dashboard
└── 📄 README.md                     -- Project documentation
```

---

## 👤 Author

**Saraswathi T R**  
Aspiring Data Analyst  
https://github.com/saraswathiTR
