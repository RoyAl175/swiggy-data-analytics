-- ETL: Load dimension and fact tables
-- ============================
-- ETL: LOAD DIMENSIONS & FACT
-- ============================

-- Load dim_date
INSERT INTO dim_date (
    full_date, year, month, month_name, quarter, day, week
)
SELECT DISTINCT
    order_date,
    YEAR(order_date),
    MONTH(order_date),
    DATENAME(MONTH, order_date),
    DATEPART(QUARTER, order_date),
    DAY(order_date),
    DATEPART(WEEK, order_date)
FROM swiggy_data
WHERE order_date IS NOT NULL;

-- Load dim_location
INSERT INTO dim_location (state, city, location)
SELECT DISTINCT state, city, location
FROM swiggy_data;

-- Load dim_restaurant
INSERT INTO dim_restaurant (restaurant_name)
SELECT DISTINCT restaurant_name
FROM swiggy_data;

-- Load dim_category
INSERT INTO dim_category (category)
SELECT DISTINCT category
FROM swiggy_data;

-- Load dim_dish
INSERT INTO dim_dish (dish_name)
SELECT DISTINCT dish_name
FROM swiggy_data;

-- Load fact table
INSERT INTO fact_swiggy_orders (
    date_id, price_INR, rating, rating_count,
    location_id, restaurant_id, category_id, dish_id
)
SELECT
    dd.date_id,
    s.price_INR,
    s.rating,
    s.rating_count,
    dl.location_id,
    dr.restaurant_id,
    dc.category_id,
    dsh.dish_id
FROM swiggy_data s
JOIN dim_date dd ON dd.full_date = s.order_date
JOIN dim_location dl
    ON dl.state = s.state
   AND dl.city = s.city
   AND dl.location = s.location
JOIN dim_restaurant dr ON dr.restaurant_name = s.restaurant_name
JOIN dim_category dc ON dc.category = s.category
JOIN dim_dish dsh ON dsh.dish_name = s.dish_name;
