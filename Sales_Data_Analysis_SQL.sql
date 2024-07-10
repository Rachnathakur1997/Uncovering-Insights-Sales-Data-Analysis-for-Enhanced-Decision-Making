CREATE TABLE `sales_data_analysis`.`products` (
  `prodcut_id` INT NOT NULL,
  `product_name` VARCHAR(30) NULL,
  `category` VARCHAR(35) NULL,
  `price` INT NULL,
  `stock_quantity` INT NULL,
  PRIMARY KEY (`prodcut_id`));
  
  
  CREATE TABLE `sales_data_analysis`.`customers` (
  `customer_id` INT NOT NULL,
  `customer_name` VARCHAR(35) NULL,
  `contact` INT(15) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(50) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(35) NULL,
  `zip_code` INT(10) NULL,
  PRIMARY KEY (`customer_id`));





CREATE TABLE `sales_data_analysis`.`orders` (
  `order_id` INT NOT NULL,
  `order_date` DATE NULL,
  `total_amount` INT(25) NULL,
  `customer_id` INT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `customer_id_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `sales_data_analysis`.`customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);




CREATE TABLE `sales_data_analysis`.`order_details` (
  `orderdetail_id` INT NOT NULL,
  `order_id` INT NULL,
  `product_id` INT NULL,
  `quantity` INT NULL,
  `price` INT NULL,
  PRIMARY KEY (`orderdetail_id`),
  INDEX `order_id_idx` (`order_id` ASC) VISIBLE,
  INDEX `product_id_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `sales_data_analysis`.`orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `sales_data_analysis`.`products` (`prodcut_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

use sales_data_analysis;

-- Insert sample data into Products table 
INSERT INTO products (prodcut_id, product_name, category, price, stock_quantity)
values
(11, 'lipstics', 'category-1', 22, 100),
(12, 'foundation', 'category-2', 30, 120),
(13, 'concealer', 'category-3', 35, 135),
(14, 'soap', 'category-4', 40, 140),
(15, 'body-wash', 'category-5', 45, 200);


-- Insert sample data into customers table
INSERT INTO customers (customer_id, customer_name, contact, email, address, city, state, zip_code)
values
(17, 'rachana', 234, 'rach7658@gmail.com', '123street', 'city1', 'state1', 345634),
(18, 'ashutosh', 456, 'asg12457@gmail.com', '456street', 'city2', 'state2', 456346),
(19, 'ashu', 451, 'ash45457@gmail.com', '457street', 'city3', 'state3', 456246),   
(20, 'nir', 452, 'nir34557@gmail.com', '458street', 'city4', 'state4', 456343),  
(21, 'nirmit', 453, 'nirmit3457@gmail.com', '459street', 'city5', 'state5', 452343);

-- Insert sample data into order_details table
INSERT INTO order_details (orderdetail_id, order_id, product_id, quantity, price)
values
(27, 45, 11, 34, 45),
(28, 46, 12, 45, 67),
(29, 47, 13, 38, 72),
(30, 66, 14, 48, 40),
(31, 58, 15, 58, 55);

-- Insert sample data into orders table
INSERT INTO orders (order_id, order_date, total_amount, customer_id)
values
(45, '2023-01-15', 57, 17),
(46, '2023-03-16', 78, 18),
(47, '2023-02-17', 76, 19),
(66, '2023-04-18', 86, 20),
(58, '2023-07-19', 99, 21);

-- Data Analysis:
-- Write SQL queries to perform various analyses.
-- a. Total Sales by Product:

SELECT p.product_name, SUM(od.quantity * od.price) AS total_sales
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY p.product_name;

-- b. Top 5 Customers by Total Spending:
SELECT c.customer_name, SUM(o.total_amount) AS total_spending
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY total_spending DESC
LIMIT 5;

-- c. Monthly Sales Trend:
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_amount) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- d. Stock Level of Products:
SELECT product_name, stock_quantity
FROM products;





