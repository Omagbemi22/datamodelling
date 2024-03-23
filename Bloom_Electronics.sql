--table Creation

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
alter table sales add column customerLocation varchar(255)default 'FCT'; 
--alter table sales drop column customerLocation;
select * from sales;

-- renaming payment method column to payment channel 
alter table sales rename column paymentMethod to paymentChannel;

--Question 5
select paymentChannel, sum(totalPrice) as totalsales
from sales 
group by paymentChannel
order by totalsales desc
limit 5;

--Question 6
select * from products;

select productID, brand, Min(price) as minPrice, Max(price) as maxPrice
from products
group by productID;

--Question 7
select * from staff;
select * from products;

select s.salesID, p.productName, p.price, st.firstName, st.lastName, st.position
from sales s
join products p on s.productID = p.productID
join staff st on s.staffID = st.staffID;

-- Question 8
select p.brand, sum(s.sellingPrice) as totalsale
from products p
join sales s on p.productID = s.productID
group by p.brand
order by totalsale desc
limit 5;

--Question 9
select s.salesID, p.productName, p.price, st.firstName, st.lastName, st.position, s.paymentChannel
from sales s
join products p on s.productID = p.productID
join staff st on s.staffID = st.staffID;









