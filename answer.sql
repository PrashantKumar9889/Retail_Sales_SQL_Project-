 -- SQL Retail Sales Analysis - P1 

DROP TABLE IF EXISTS retail_sales;
CREATE TABLE retail_sales(
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT,
	category VARCHAR(15),
	quantiy INT,
	price_per_unit FLOAT,
	cogs FLOAT,
	total_sale FLOAT
);

SELECT * FROM RETAIL_SALES;


-- # Data Cleaning
-- Finding NULL values in transactions_id columns
SELECT * FROM retail_sales
WHERE transactions_id IS NULL;

-- Finding all Null values in retail_sales table
SELECT * FROM retail_sales
WHERE transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

-- Deleting all the Null values in retail_sales table
DELETE FROM retail_sales
WHERE transactions_id IS NULL
	OR
	sale_date IS NULL
	OR
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantiy IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR
	total_sale IS NULL;

	
-- # Data Exploration
-- How many sales we have?
SELECT COUNT(*) as total_sale FROM retail_sales

-- How many unique customers we have ?
SELECT COUNT(DISTINCT customer_id) As No_of_customer FROM retail_sales



-- ## Data Analysis & Business Key Problems & Answers

-- Q1. Write a SQL query to retrieve all columns for sales made on '2022-11-05'?
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05'

-- Q2. Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022 ?
SELECT * FROM retail_sales
WHERE category = 'Clothing' 
	AND 
	TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
	AND
	quantiy >=4

-- Q3. Write a SQL query to calculate the total sales (total_sale) for each category ?
SELECT category, count(*) as No_of_orders, SUM(total_sale) as Total_Sum
FROM retail_sales
GROUP BY category

-- Q4. Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT ROUND(AVG(age),2) as Average_age
FROM retail_sales
WHERE category = 'Beauty'

-- Q5. Write a SQL query to find all transactions where the total_sale is greater thant 1000.
SELECT * FROM retail_sales
WHERE total_sale > 1000

-- Q6. Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category ?
SELECT category, gender,COUNT(transactions_id)
FROM retail_sales
GROUP BY category, gender
ORDER BY category

-- Q7. Write a SQL query to Calculate the average sale for each month. Find out best selling month in each year ?
SELECT year, month, avg_sale
FROM(
	SELECT 
		EXTRACT(YEAR FROM sale_date) as year,
		EXTRACT(MONTH FROM sale_date) as month,
		ROUND(AVG(total_sale)) as avg_sale,
		RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) as rank
	FROM retail_sales
	GROUP BY year, month
) as t1
WHERE rank = 1

-- Q8. Write a SQL query to find the top 5 customers based on the highest total sales
SELECT customer_id, SUM(total_sale ) total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q9. Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT category, COUNT(DISTINCT customer_id) as No_of_uni_custo 
FROM retail_sales
GROUP BY category

-- Q10. Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
AS
(
SELECT *,
	CASE 
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
		WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END as shift
FROM retail_sales
)

SELECT shift, COUNT(*) 
FROM hourly_sale
GROUP BY shift

-- End of Project