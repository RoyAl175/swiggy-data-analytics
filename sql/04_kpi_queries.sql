-- KPI queries
-- KPI: Total number of orders
SELECT COUNT(*) AS Total_Orders
FROM fact_swiggy_orders;


-- KPI: Total Revenue (INR Million)
SELECT 
    FORMAT(SUM(CONVERT(FLOAT, price_INR)) / 1000000, 'N2') + ' INR Million' 
        AS Total_Revenue
FROM fact_swiggy_orders;


-- KPI: Average Dish Price (INR)
SELECT
    FORMAT(AVG(CONVERT(FLOAT, price_INR)), 'N2') + ' INR'
        AS Average_Dish_Price
FROM fact_swiggy_orders;



-- KPI: Average Rating
SELECT
    AVG(rating) AS Avg_Rating
FROM fact_swiggy_orders;
