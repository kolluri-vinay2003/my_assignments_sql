CREATE DATABASE swiggy_db;
SHOW DATABASES;
USE swiggy_db;
SHOW TABLES;
-- number of rows
SELECT COUNT(*) AS NO_OF_RECORDS FROM swiggy_orders_full;

-- number of columns
SELECT COUNT(*) AS COLUMN_COUNT FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='swiggy_db'
AND TABLE_NAME='swiggy_orders_full';

-- 1.Display the unique vegetable items offered by Swiggy in Kokapet
SELECT DISTINCT Item  FROM swiggy_orders_full WHERE Location='Kokapet' 
AND `Item Type` ='Veg';

-- 2.How many items were ordered in the year 2020 using PhonePay?
SELECT SUM(Quantity) AS total_orders FROM swiggy_orders_full 
WHERE `Payment Type`='Phone Pay' AND `Date` LIKE '%2020%' ;

-- 3.Extract the total number of non-vegetarian orders received by Adhya Grand at each location
SELECT Location,SUM(Quantity) AS Total_orders FROM swiggy_orders_full
WHERE `Item Type`='Non Veg'
AND Restaurant='Adhya Grand' GROUP BY Location;

-- 4.Display the Restaurants which received atleast one Non Veg Order in 2024
SELECT Restaurant FROM swiggy_orders_full
WHERE `Date` LIKE '%2024%' AND `Item Type`='Non Veg' ;

-- 5.Display the OrderID and the Item for all the orders from Madhapur with rating less than 2
SELECT OID,Item FROM swiggy_orders_full Where Location='Madhapur' AND Rating<2;
 
-- 6.Extract the customers who have used more than two payment methods
SELECT CustomerID FROM swiggy_orders_full
GROUP BY CustomerID
HAVING COUNT(DISTINCT `Payment Type`)>2;

-- 7 Fetch the customers who placed at least one order of quantity greater than 5 in 2023
SELECT DISTINCT CustomerID FROM swiggy_orders_full
WHERE `Date` LIKE '%2023%' AND Quantity>5;



-- 8 Extract average rating for non-vegetarian items for each location
SELECT Location,AVG(Rating) AS avg_rating FROM swiggy_orders_full 
WHERE `Item Type`='Non Veg' 
GROUP BY Location;

-- 9 Display the total amount generated in each payment Method in 2022
SELECT `Payment Type`,SUM(`Total Cost`) AS total_amount FROM swiggy_orders_full
WHERE  `Date` LIKE '%2022%' GROUP BY `Payment Type`;

-- 10.Extract customers who placed orders for at least three different items in Narsingi
SELECT CustomerID FROM swiggy_orders_full 
WHERE Location='Narsingi'
GROUP BY CustomerID 
HAVING COUNT(DISTINCT Item)>=3;




