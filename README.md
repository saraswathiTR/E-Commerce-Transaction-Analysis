# 🛒 E-Commerce Transaction Analysis — SQL Project

A complete SQL data analysis project on an e-commerce transactions dataset. This project covers basic to advanced SQL concepts including aggregations, joins, subqueries, window functions, and date functions.

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

---

## 📊 Analysis Sections

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

## 🧠 SQL Concepts Used

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

---

## 🛠️ Tools Used

- **SQL Server / SSMS** — Query execution
- **Database:** SalesAnlys

---

## 🚀 How to Run

1. Clone this repository
2. Import the dataset into SQL Server
3. Create database `SalesAnlys`
4. Run queries from the `.sql` file

```sql
USE SalesAnlys;
```

---

## 👤 Author

**Saraswathi T R**  
Aspiring Data Analyst  
[https://github.com/saraswathiTR](#)
