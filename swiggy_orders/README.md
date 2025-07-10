
# Swiggy Orders – SQL Assignment

This assignment practices SQL queries on a dataset of Swiggy food orders. It applies core MySQL concepts to extract useful information from real‑world‑style data.

---

## Dataset Description

The file `swiggy_orders_full.csv` contains order details:

- Order ID, Customer ID, Date  
- Location, Item, Item Type (Veg / Non‑Veg)  
- Quantity, Unit Cost, Total Cost  
- Payment Type, Rating, Restaurant Name  

---

## SQL Queries Covered

1. Retrieve unique vegetable items offered in Kokapet.  
2. Find total items ordered in 2020 using Phone Pay.  
3. Count non‑vegetarian orders received by Adhya Grand at each location.  
4. List restaurants with at least one non‑vegetarian order in 2024.  
5. Get Order ID and Item for Madhapur orders with rating below 2.  
6. Identify customers who used more than two different payment methods.  
7. List customers who placed an order with quantity greater than 5 in 2023.  
8. Calculate average rating of non‑vegetarian items by location.  
9. Find total amount collected by each payment method in 2022.  
10. Extract customers in Narsingi who ordered at least three different items.  

---

## Concepts Practised

- Filtering with `WHERE`, pattern matching with `LIKE`  
- Aggregation functions: `SUM`, `AVG`, `COUNT`  
- Grouping and conditional filtering using `GROUP BY` and `HAVING`  
- `DISTINCT` keyword for unique values  
- Combining multiple conditions in queries  

---

## Files Included

- `swiggy_orders_full.csv` Dataset  
- `swiggy_orders_full.sql` SQL queries  
- `README.md` Assignment documentation  

---

## Instructions

1. Import the CSV file into a MySQL database of your choice.  
2. Execute the queries in `swiggy_orders_full.sql`.  
3. Review each result set to understand how the query answers its specific question.  

---


