CREATE TABLE staff (
staffID SERIAL PRIMARY KEY,
firstName VARCHAR(50),
lastName VARCHAR(50),
position VARCHAR(50),
contactNumber VARCHAR(20),
email VARCHAR(100)
);

CREATE TABLE products (
productID SERIAL PRIMARY KEY,
productName VARCHAR(50),
brand VARCHAR(50),
model VARCHAR(50),
type VARCHAR(50),
size INT,
price DECIMAL(10, 2),
description TEXT,
warrantyPeriod VARCHAR(50)
);

CREATE TABLE sales (
salesID SERIAL PRIMARY KEY,
productID INT,
customerID INT,
staffID INT,
quantity INT,
sellingPrice DECIMAL(10, 2),
discount DECIMAL(10, 2),
totalPrice DECIMAL(10, 2),
paymentMethod VARCHAR(50),
date date,
);

CREATE TABLE customers (
customerID SERIAL PRIMARY KEY,
firstName VARCHAR(50),
lastName VARCHAR(50),
emailAddress VARCHAR(100),
address VARCHAR(255),
phoneNumber	varchar(20));
	

--Question 3
-- Insert into the sales table

insert into sales (salesID, productID, customerID, staffID, quantity, sellingPrice, discount, totalPrice, paymentMethod, date) Values
(10923, 201, 42, 502, 2, 4500, 0, 3000, 'paypal', '07-07-2022'),
(10924, 213, 51, 504, 4, 1500, 0, 6000, 'bank Deposit','17-12-2022');

--select sales.salesID, productID from sales;
--select sales.salesID, productID 
--from sales
--group by sales
--having sales.salesID = 10011; 

--Question 4
-- Add a column to store customer location