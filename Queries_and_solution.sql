use SalesAnlys

---Find total number of transactions
select COUNT(transaction_id) as total_transaction 
from ecommerce_transactions;


---Find total purchase amount
select Round(SUM(Purchase_amount),2) as total_purchase_amount
from ecommerce_transactions;


---Find all unique countries
select distinct Country as unique_countries
from ecommerce_transactions;


---Find all unique product categories
select distinct Product_Category as unique_product_categories
from ecommerce_transactions;


---Find total number of unique users
SELECT COUNT(DISTINCT User_Name) as total_unique_user
FROM ecommerce_transactions;


---Find total sales by country
SELECT Country, 
round(SUM(Purchase_Amount),2) as total_sales
FROM ecommerce_transactions
GROUP BY Country;


--Find most used payment method
select top 1 Payment_Method,count(Payment_Method)
from ecommerce_transactions
group by Payment_Method
order by count(Payment_Method) desc;


---Find top 5 users by purchase amount
select top 5 User_Name , round(sum(Purchase_amount),2) as purchased_amount
from ecommerce_transactions
group by User_Name
order by purchased_amount desc;


---Find average purchase amount by country
select Country, round(avg(Purchase_amount),2)
from ecommerce_transactions
group by Country;


---Find total transactions by payment method
select Payment_Method, count(Transaction_ID) as total_transaction
from ecommerce_transactions
group by Payment_Method;


---Find highest purchase amount in each category
select Product_Category,round(max(Purchase_amount),2) as highest_purchase_amount
from ecommerce_transactions
group by Product_Category;


---Find monthly sales trend
select MONTH(Transaction_Date) as months ,
round(sum(Purchase_amount),2) as monthly_sales_trend
from ecommerce_transactions
group by MONTH(Transaction_Date) 
order by MONTH(Transaction_Date) ;


---Find age group wise sales (Young 18-25, Middle 26-40, Senior 40+)
SELECT 
case 
    when age between 18 and 25 then 'Young'
    when age between 26 and 40 then 'Middle'
    when age > 40 then 'Senior'
end as age_group,
round(SUM(Purchase_Amount),2) as total_sales
FROM ecommerce_transactions
GROUP BY 
case 
    when age between 18 and 25 then 'Young'
    when age between 26 and 40 then 'Middle'
    when age > 40 then 'Senior'
end


---Find top 3 countries by number of transactions
select top 3 Country , count(Transaction_ID) as  number_of_transactions
from ecommerce_transactions
group by Country
order by number_of_transactions desc;


---Find which product category is most popular in each country
select Country , Product_Category, COUNT(*) as total 
from ecommerce_transactions
group by Country, Product_Category
HAVING COUNT(*) = (
    SELECT MAX(counted)
    FROM (
        SELECT COUNT(*) as counted
        FROM ecommerce_transactions as inner_table
        WHERE inner_table.Country = ecommerce_transactions.Country
        GROUP BY Product_Category
    ) as sub
)


---Find users who spent more than average purchase amount
SELECT User_Name, 
round(SUM(Purchase_Amount),2) as total_spent
FROM ecommerce_transactions
GROUP BY User_Name
HAVING SUM(Purchase_Amount) > (
    SELECT AVG(Purchase_Amount) 
    FROM ecommerce_transactions
)


---Find best performing month
select top 1 MONTH(Transaction_Date),round(sum(Purchase_Amount),2) as total
from ecommerce_transactions
group by MONTH(Transaction_Date)
order by total desc ;


---Find total sales by year
select YEAR(Transaction_Date), round(sum(Purchase_Amount),2) as total_sale
from ecommerce_transactions
group by YEAR(Transaction_Date)


---Find payment method wise average purchase amount 
select Payment_Method, round(avg(Purchase_Amount),2)
from ecommerce_transactions
group by Payment_Method