-- Deep-dive analysis queries
SELECT
    d.year,
    d.month,
    d.month_name,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY
    d.year,
    d.month,
    d.month_name
ORDER BY
     d.year, d.month;



    -- Deep-Dive Analysis: Quarterly Order Trend
SELECT
    d.year,
    d.quarter,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY
    d.year,
    d.quarter
ORDER BY
    COUNT(*)DESC;


-- Deep-Dive Analysis: Yearly Order Trend
SELECT
    d.year,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY
    d.year
ORDER BY
    d.year;



-- Deep-Dive Analysis: Orders by Day of Week
SELECT
    DATENAME(WEEKDAY, d.full_date) AS Day_Name,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_date d
    ON f.date_id = d.date_id
GROUP BY
    DATENAME(WEEKDAY, d.full_date),
    DATEPART(WEEKDAY, d.full_date)
ORDER BY
    DATEPART(WEEKDAY, d.full_date);


-- Deep-Dive Analysis: Top 10 Cities by Order Volume
SELECT TOP 10
    l.city,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_location l
    ON f.location_id = l.location_id
GROUP BY
    l.city
ORDER BY
    Total_Orders DESC;


-- Deep-Dive Analysis: Revenue Contribution by State
SELECT TOP 10
    l.state,
    SUM(f.price_INR) AS Total_Revenue
FROM fact_swiggy_orders f
JOIN dim_location l
    ON l.location_id = f.location_id
GROUP BY
    l.state
ORDER BY
    Total_Revenue DESC;


-- Top 10 restaurants by revenue
SELECT TOP 10
    r.restaurant_name,
    SUM(f.price_INR) AS Total_Revenue
FROM fact_swiggy_orders f
JOIN dim_restaurant r
    ON r.restaurant_id = f.restaurant_id
GROUP BY
    r.restaurant_name
ORDER BY
    Total_Revenue DESC;


-- Deep-Dive Analysis: Top Categories by Order Volume
SELECT
    c.category,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders f
JOIN dim_category c
    ON f.category_id = c.category_id
GROUP BY
    c.category
ORDER BY
    Total_Orders DESC;


-- Deep-Dive Analysis: Most Ordered Dishes
SELECT TOP 10
    d.dish_name,
    COUNT(*) AS Order_Count
FROM fact_swiggy_orders f
JOIN dim_dish d
    ON f.dish_id = d.dish_id
GROUP BY
    d.dish_name
ORDER BY
    Order_Count DESC;


-- Deep-Dive Analysis: Cuisine Performance (Orders + Avg Rating)
SELECT
    c.category AS Cuisine,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(f.rating), 2) AS Avg_Rating
FROM fact_swiggy_orders f
JOIN dim_category c
    ON f.category_id = c.category_id
GROUP BY
    c.category
ORDER BY
    Total_Orders DESC;


-- Deep-Dive Analysis: Total Orders by Price Range
SELECT
    CASE
        WHEN price_INR < 100 THEN 'Under 100'
        WHEN price_INR BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN price_INR BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN price_INR BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END AS Price_Range,
    COUNT(*) AS Total_Orders
FROM fact_swiggy_orders
GROUP BY
    CASE
        WHEN price_INR < 100 THEN 'Under 100'
        WHEN price_INR BETWEEN 100 AND 199 THEN '100 - 199'
        WHEN price_INR BETWEEN 200 AND 299 THEN '200 - 299'
        WHEN price_INR BETWEEN 300 AND 499 THEN '300 - 499'
        ELSE '500+'
    END
ORDER BY
    Total_Orders DESC;

-- Deep-Dive Analysis: Rating Distribution (1–5)
SELECT
    rating,
    COUNT(*) AS Rating_Count
FROM fact_swiggy_orders
GROUP BY
    rating
ORDER BY
    Rating_Count DESC;




