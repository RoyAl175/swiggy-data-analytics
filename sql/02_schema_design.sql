-- Star schema table creation
-- ============================
-- STAR SCHEMA DESIGN
-- ============================

-- Date Dimension
CREATE TABLE dim_date (
    date_id INT IDENTITY(1,1) PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    month_name VARCHAR(20),
    quarter INT,
    day INT,
    week INT
);

-- Location Dimension
CREATE TABLE dim_location (
    location_id INT IDENTITY(1,1) PRIMARY KEY,
    state VARCHAR(100),
    city VARCHAR(100),
    location VARCHAR(200)
);

-- Restaurant Dimension
CREATE TABLE dim_restaurant (
    restaurant_id INT IDENTITY(1,1) PRIMARY KEY,
    restaurant_name VARCHAR(200)
);

-- Category Dimension
CREATE TABLE dim_category (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category VARCHAR(200)
);

-- Dish Dimension
CREATE TABLE dim_dish (
    dish_id INT IDENTITY(1,1) PRIMARY KEY,
    dish_name VARCHAR(200)
);

-- Fact Table
CREATE TABLE fact_swiggy_orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    date_id INT,
    price_INR DECIMAL(10,2),
    rating DECIMAL(4,2),
    rating_count INT,
    location_id INT,
    restaurant_id INT,
    category_id INT,
    dish_id INT,
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (restaurant_id) REFERENCES dim_restaurant(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES dim_category(category_id),
    FOREIGN KEY (dish_id) REFERENCES dim_dish(dish_id)
);
