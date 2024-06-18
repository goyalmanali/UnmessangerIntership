create database org;

use org;

create table Customers(
CustomerID int primary key,
Name VARCHAR(255),
Email VARCHAR(255),
JoinDate DATE
);

create table Products(
	ProductID int primary key,
	Name VARCHAR(255),
    Category VARCHAR(255),
    Price Decimal(10,2)
);

create table Orders(
	OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount Decimal(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

create table OrderDetails(
	OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID int,
    Quantity int,
    PricePerUnit Decimal(10, 2),
    Foreign key (OrderID) REFERENCES Orders(OrderID),
    Foreign key (ProductID) REFERENCES Products(ProductID)
);

insert into Customers (CustomerID, Name, Email, JoinDate) values
(1, "John Doe", "johndoe@example.com", "2020-01-19"),(2, "Jane Smith", "janesmith@example.com", "2020-01-15"),
(3, "Alice john", "alicejohn@example.com", "2020-02-25"),(4, "Rohan Sharma", "rohnsharma@example.com", "2020-01-01"),
(5, "Krishna jay", "krishnajay@example.com", "2020-01-12"), (6, "Abhay jain", "abhayjain@example.com", "2020-01-13"),
(7, "vaibhav garg", "vaibhavgarg@example.com", "2020-01-25"), (8, "Ravi jain", "ravijain@example.com", "2020-03-17"),
(9, "Rishi Garg", "rishigarg@example.com", "2021-04-23"), (10, "Parveen Dutt", "parveendutt@example.com", "2022-01-19"),
(11, "Harshit Garg", "harshitgarg@example.com", "2020-04-19"), (12, "Rohit kumar", "rohitkumar@example.com", "2022-04-20"), 
(13, "Vman Garg", "vmangarg@example.com", "2022-03-29"), (14, "Vinay Sharma", "vinaysharma@example.com", "2023-04-20");

select * from Customers;

insert into Products (ProductID, Name, Category, Price) values
(1, "Laptop", "Electronic", 999.99), (2, "Smartphone", "Electronic", 499.99),(3, "Desk lemp", "Home decor", 29.99),
(4, "top", "Clothes", 115.99),(5, "Bedsheet", "home decor", 120.99),(6, "Airdopes", "Electronic", 300.99),
(7, "Bicyle", "usage", 1000.99),(8, "Lipstick", "Fashion", 15.99),(9, "Nailpaint", "Fashion", 5.99),
(10, "Chcolate", "Grocery", 50.99),(11, "TV", "Electronic", 111.99),(12, "Spoon", "Utensils", 12.99);

select * from Products;

insert into Orders (OrderID, CustomerID, OrderDate, TotalAmount) values
(1, 10, '2020-10-15', 1448.99), (2, 11, '2020-11-20', 1500.99), (3,1, '2021-11-15', 900.99), (4, 5, '2022-12-01', 100.99),
(5, 4, '2022-01-13', 112.99), (6, 3, '2021-02-15', 1100.99), (7, 11, '2022-06-20', 500.99), (8, 10, '2021-10-15', 519.99),
(9, 2, '2020-11-2', 478.99), (10, 7, '2022-11-15', 2000.99), (11, 6, '2021-09-17', 799.99), (12, 5, '2020-10-15', 619.99);

select * from Orders;

insert into OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, PricePerUnit) values
(1, 1, 1, 3, 999.99), (2, 10, 12, 2, 1000.99), (3, 5, 7, 1, 500.99), (4, 7, 3, 4, 1000.99), (5, 6, 3, 1, 99.99), (6, 3, 10, 2, 700.99),
(7, 9, 2, 1, 9.99),(8, 10, 12, 1, 1000.99),(9, 9, 1, 3, 1999.99),(10, 11, 4, 1, 59.99),(11, 12, 11, 4, 1999.99),(12, 1, 3, 1, 12.99);

select * from Products;
select * from OrderDetails;

-- 1. BASIC QUERIES
select * from Customers;
select * from products where Category = "Electronic";
select count(OrderID) as Total_number_of_Order from Orders;
select * from Orders order by OrderDate desc;

-- 2.JOINS AND RELATIONSHIPS 
-- 2.1 
select pd.productid, pd.Name, pd.Category, pd.price, c.name as CustomerName from products as pd
inner join
OrderDetails as od on pd.ProductID = od.ProductID
inner join
orders as o on od.OrderID = o.OrderID
inner join
Customers as c on o.CustomerID = c.CustomerID;

-- 2.2
select * from Orders  as o
right join
OrderDetails as od on od.OrderID = O.OrderID
inner join
products as pd on od.productid = pd.productid;

-- 2.3
select name, totalamount from customers as c
right join
orders as o on c.customerid = o.customerid;

-- 3. Aggregation and grouping
-- 3.1
select * from products;
select category, sum(price) as TotalRevenue from products group by category;

-- 3.2
select avg(totalamount) as AverageOrderValue from orders;

-- 3.3
select orderdate, count(orderdate) from orders group by orderdate;

-- 4. Subqueries and nested queries
-- 4.1
select * from customers where customerid not in (select Customerid from orders);

-- 4.2
select * from products where productid not in (select productid from orderdetails);

-- 4.3 
select productid, count(productid) from orderdetails group by productid;

-- 5. Date and time functions
-- 5.1
select orderdate from orders where c ;

-- 5.2
select min(joindate), max(joindate) from customers;

-- 6. Advance Queries
-- 6.1
select customerid , dense_rank() over (order by totalamount) from orders;

-- 6.2


 

