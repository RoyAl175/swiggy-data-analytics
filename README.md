# swiggy-data-analytics
End-to-end SQL data analytics project using Star Schema
# Swiggy Order Data Analysis (SQL Project)

## 📌 Project Overview
This project demonstrates an end-to-end SQL-based data analytics workflow using Swiggy order data.
The raw transactional data was cleaned, transformed into a star schema, and analyzed to generate
meaningful business insights related to orders, revenue, customer behavior, and product performance.

---

## 🎯 Business Objectives
- Clean and validate raw Swiggy order data
- Design a scalable star schema for analytics
- Build fact and dimension tables
- Generate KPIs for business monitoring
- Perform deep-dive analysis to uncover trends and patterns

---

## 🛠️ Tools & Technologies
- SQL Server
- SQL (DDL, DML, Joins, CTEs, Window Functions)
- Data Warehousing (Star Schema)
- GitHub for version control

---

## 🧹 Data Cleaning & Validation
The raw dataset was validated and cleaned using SQL:
- Checked for NULL values across all key columns
- Identified and handled blank or empty string values
- Detected and removed duplicate records using ROW_NUMBER()
- Ensured data consistency before loading into the warehouse

---

## 🧱 Data Model (Star Schema)
The analytics layer was built using a star schema design:

**Fact Table**
- `fact_swiggy_orders`  
  Stores order-level metrics such as price, rating, and rating count

**Dimension Tables**
- `dim_date`
- `dim_location`
- `dim_restaurant`
- `dim_category`
- `dim_dish`

![Star Schema Diagram](diagrams/star_schema.png)

---

## 🔄 ETL Process
- Dimension tables were populated using DISTINCT values from raw data
- The fact table was loaded by joining raw data with all dimensions
- Descriptive attributes were replaced with surrogate keys
- This process ensures data integrity and analytical efficiency

---

## 📊 Key KPIs
- Total Orders
- Total Revenue
- Average Dish Price
- Average Rating

---

## 🔍 Deep-Dive Analysis
The following analyses were performed:
- Monthly, quarterly, and yearly order trends
- Orders by day of the week
- Top cities and states by order volume and revenue
- Top restaurants, categories, and dishes
- Price range distribution
- Rating distribution
- Cuisine performance (orders vs average rating)

---

## 💡 Key Insights
- Order demand is concentrated in major urban cities
- Most customers prefer mid-priced meals (₹200–₹299)
- Weekend order volume is significantly higher than weekdays
- Popular brands contribute a large share of total revenue
- Overall customer satisfaction is high based on rating distribution

---

## ▶️ How to Run This Project
1. Create a database named `SwiggyDB`
2. Execute SQL scripts in the following order:
   - `01_data_cleaning.sql`
   - `02_schema_design.sql`
   - `03_etl_load.sql`
   - `04_kpi_queries.sql`
   - `05_deep_dive_analysis.sql`
3. Review results and insights

---

## 📚 What I Learned
- Designing and implementing a star schema
- Writing efficient JOIN-based analytical queries
- Applying SQL for real-world business analysis
- Translating raw data into actionable insights

---

## 📎 Author
**Reivish Obed Alexander**  
