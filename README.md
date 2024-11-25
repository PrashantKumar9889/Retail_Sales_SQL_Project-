# Retail_Sales_SQL_Project
# Retail Sales Analysis Project - SQL

This project is a SQL-based analysis of retail sales data. It involves creating and cleaning a dataset, exploring the data, and answering key business questions through structured queries. The project is divided into several phases, including data cleaning, exploration, and analysis.

---

## Dataset Schema

The `retail_sales` table contains the following columns:

| Column Name        | Data Type  | Description                                  |
|--------------------|------------|----------------------------------------------|
| `transactions_id`  | INT        | Unique identifier for each transaction       |
| `sale_date`        | DATE       | Date of the transaction                      |
| `sale_time`        | TIME       | Time of the transaction                      |
| `customer_id`      | INT        | Unique identifier for each customer          |
| `gender`           | VARCHAR(15)| Gender of the customer                       |
| `age`              | INT        | Age of the customer                          |
| `category`         | VARCHAR(15)| Category of the purchased item               |
| `quantiy`          | INT        | Quantity of items purchased                  |
| `price_per_unit`   | FLOAT      | Price per unit of the item                   |
| `cogs`             | FLOAT      | Cost of goods sold                           |
| `total_sale`       | FLOAT      | Total sales amount for the transaction       |

---

## Project Steps

### 1. **Data Cleaning**
- Identified NULL values in the dataset.
- Deleted records containing NULL values to ensure data integrity.

### 2. **Data Exploration**
- Counted total sales.
- Counted the number of unique customers.

### 3. **Key Business Problems & Answers**

#### Q1: Sales on a Specific Date
Retrieve all columns for sales made on `'2022-11-05'`.

#### Q2: Category-Based Query
Find transactions where the category is `'Clothing'` and the quantity sold is more than 4 in November 2022.

#### Q3: Total Sales by Category
Calculate the total sales (`total_sale`) for each category.

#### Q4: Average Age in 'Beauty' Category
Find the average age of customers who purchased items from the `'Beauty'` category.

#### Q5: High-Value Transactions
Find transactions where the `total_sale` is greater than 1000.

#### Q6: Transactions by Gender and Category
Calculate the total number of transactions by each gender in each category.

#### Q7: Best Selling Month
Determine the month with the highest average sales for each year.

#### Q8: Top 5 Customers
Identify the top 5 customers based on total sales.

#### Q9: Unique Customers by Category
Find the number of unique customers who purchased items from each category.

#### Q10: Orders by Shift
Classify transactions into shifts (`Morning`, `Afternoon`, `Evening`) and count the number of orders for each shift.

---

## Example Queries

### Create Table
```sql
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
```

### Data Cleaning
```sql
DELETE FROM retail_sales
WHERE transactions_id IS NULL
    OR sale_date IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantiy IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;
```

### Sample Analysis Query
```sql
SELECT category, COUNT(DISTINCT customer_id) AS No_of_uni_custo
FROM retail_sales
GROUP BY category;
```

---

## Tools & Techniques
- SQL for data manipulation and analysis.
- Aggregate functions like `SUM`, `AVG`, `COUNT`.
- Conditional filtering using `WHERE` and `CASE`.
- Window functions like `RANK` for ranking.

---

## Insights
- The project provides detailed insights into customer behavior, sales patterns, and key performance metrics.
- The analysis supports business decision-making by identifying top customers, high-value transactions, and optimal sales periods.

---

## How to Use
1. Run the provided SQL scripts in a database management system like PostgreSQL, MySQL, or any compatible platform.
2. Modify the queries as needed for custom insights.

---

## License
This project is open-source and free to use for educational and professional purposes. 

Enjoy exploring your retail data! 🎉
