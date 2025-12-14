## Dataset Information
This dataset contains food delivery transaction records from the Swiggy platform.
Each record represents an individual dish order placed by customers across multiple states, cities, restaurants, and cuisines in India.

The dataset is used to support data cleaning, dimensional modeling (star schema), KPI calculation, and deep-dive business analysis as defined in the business requirements. 

Business Requirements.docx

2. Business Objective

The primary goal of this dataset is to enable sales and performance analysis for a food delivery platform by:

Ensuring high data quality through cleaning and validation

Designing an analytics-friendly star schema

Computing key business KPIs

Performing trend and performance analysis across time, location, restaurants, and food categories

3. Source File Information
File Name	Description
Swiggy_Data.csv	Raw transactional order data used as the source table (swiggy_data)

Note: The raw dataset is used strictly for learning, analysis, and portfolio purposes.

4. Data Granularity

Grain of the data: One row represents one ordered dish within an order

Multiple rows may exist for the same order if multiple dishes were ordered

5. Key Columns Description
Column Name	Description
State	State where the order was delivered
City	City where the order was delivered
Order_Date	Date when the order was placed
Restaurant_Name	Name of the restaurant fulfilling the order
Location	Area or locality of the restaurant
Category	Cuisine or food category (e.g., Indian, Chinese)
Dish_Name	Name of the ordered dish
Price_INR	Price of the dish in Indian Rupees
Rating	Customer rating for the dish (1–5 scale)
Rating_Count	Number of ratings received
6. Data Quality Considerations

As per business requirements, the raw dataset may contain:

Missing (NULL) values

Blank or empty strings

Duplicate records across business-critical columns

Therefore, the dataset undergoes:

Null checks

Blank value validation

Duplicate detection

Duplicate removal using ROW_NUMBER() logic

before being used for analysis. 

Business Requirements.docx

7. Analytical Data Model

After cleaning, the data is transformed into a Star Schema consisting of:

Dimension Tables

dim_date → Year, Month, Quarter, Week

dim_location → State, City, Location

dim_restaurant → Restaurant_Name

dim_category → Cuisine / Category

dim_dish → Dish_Name

Fact Table

fact_swiggy_orders

Measures: Price_INR, Rating, Rating_Count

Foreign keys to all dimension tables

This model supports fast, reliable reporting and KPI analysis. 

Business Requirements.docx

8. Intended Analysis & KPIs

The dataset supports the calculation of:

Core KPIs

Total Orders

Total Revenue (INR)

Average Dish Price

Average Rating

Deep-Dive Analysis

Monthly, quarterly, and yearly order trends

Top cities and states by orders and revenue

Top restaurants, categories, and dishes

Customer spending distribution buckets

Rating distribution analysis
