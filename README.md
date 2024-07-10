# SQL_PROJECT


**Project Title: Sales Data Analysis**

**Objective:**
Analyze a company's sales data to gain insights into sales performance, identify trends, and make data-driven decisions to improve business strategies.

**Description:**
This project involves working with a sales database containing information about products, customers, orders, and sales transactions. You will write SQL queries to extract meaningful insights and perform various types of analysis, such as identifying top-selling products, analyzing customer behavior, and evaluating sales trends over time.

**QUERIES_PERFORMED**

**a. Total Sales by Product:**
SELECT p.product_name, SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;

**b. Top 5 Customers by Total Spending:**
SELECT c.customer_name, SUM(o.total_amount) AS total_spending
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spending DESC
LIMIT 5;

**c. Monthly Sales Trend:**
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_sales
FROM Orders
GROUP BY month
ORDER BY month;

**d. Stock Level of Products:**
SELECT product_name, stock_quantity
FROM Products;


