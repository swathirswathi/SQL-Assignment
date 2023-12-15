---the schema for the Customers, Products, Orders, OrderDetails and Inventory tables based on the provided schema
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

select * from Customers;

INSERT INTO Customers (CustomerID, FName, LastName, Email, Phone, Address)
VALUES
  (1,'swat','Batool','swatuu@gmail.com','76327524355','market'),
  (2,'Afra','Batool','afuuu@gmail.com','76536373355','dubainagar'),
  (3,'Kabutar','Ruhaib','kabbu@gmail.com','7386753355','uppallinagar'),
(4,'zaid','Amir','zaid@gmail.com','86767373355','upalliii'), 
(5,'Prajju','SK','prajjusk@gmail.com','78673853355','savasihalli'),
(6,'sona','Batool','sona@gmail.com','7653353355','dubai'), 
(7,'Kabbu','Ruhaib','kabbukabbu@gmail.com','9886753355','jayanagar'),
(8,'babu','Amir','babu@gmail.com','86767344345','ckm'), 
(9,'Prajwal','SK','prajwalk@gmail.com','87973853355','ramanahalli'),
(10,'Hari','Batool','hariuuu@gmail.com','76582323355','vijaynagar');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

INSERT INTO Products (ProductID, ProductName, Description, Price)
VALUES
    (1, 'Widget A', 'High-quality widget', 19.99),
    (2, 'Gadget B', 'Feature-rich gadget', 29.99),
    (3, 'Tool X', 'Versatile tool for various tasks', 39.99),
    (4, 'Appliance Y', 'Efficient home appliance', 49.99),
    (5, 'Accessory Z', 'Useful accessory for everyday use', 9.99),
    (6, 'Tech Gizmo', 'Cutting-edge technology gizmo', 79.99),
    (7, 'Outdoor Gear', 'Durable outdoor gear for adventures', 59.99),
    (8, 'Home Decor', 'Stylish home decor item', 14.99),
    (9, 'Kitchen Utensil', 'Essential kitchen utensil', 8.99),
    (10, 'Fitness Equipment', 'Effective fitness equipment', 99.99);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (1, 1, '2023-01-01', 39.98),
    (2, 2, '2023-02-01', 59.98),
    (3, 3, '2023-03-01', 79.97),
    (4, 4, '2023-04-01', 99.96),
    (5, 5, '2023-05-01', 119.95),
    (6, 6, '2023-06-01', 139.94),
    (7, 7, '2023-07-01', 159.93),
    (8, 8, '2023-08-01', 179.92),
    (9, 9, '2023-09-01', 199.91),
    (10, 10, '2023-10-01', 219.90);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
    (1, 1, 1, 2),
    (2, 1, 2, 1),
    (3, 2, 3, 3),
    (4, 2, 4, 1),
    (5, 3, 5, 2),
    (6, 3, 6, 1),
    (7, 4, 7, 3),
    (8, 4, 8, 1),
    (9, 5, 9, 2),
    (10, 5, 10, 1);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
    (1, 1, 100, '2023-01-01 12:00:00'),
    (2, 2, 50, '2023-02-01 10:30:00'),
    (3, 3, 75, '2023-03-01 15:45:00'),
    (4, 4, 30, '2023-04-01 08:20:00'),
    (5, 5, 60, '2023-05-01 14:10:00'),
    (6, 6, 25, '2023-06-01 11:55:00'),
    (7, 7, 40, '2023-07-01 09:30:00'),
    (8, 8, 90, '2023-08-01 13:25:00'),
    (9, 9, 55, '2023-09-01 16:05:00'),
    (10, 10, 20, '2023-10-01 07:40:00');

--Create an ERD (Entity Relationship Diagram) for the database

--1)Write an SQL query to retrieve the names and emails of all customers. 
SELECT FName, LastName, Email
FROM Customers;

--2) Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT Orders.OrderID, Orders.OrderDate, Customers.FName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--3)Write an SQL query to insert a new customer record into the "Customers" table.
--Include customer information such as name, email, and address.
INSERT INTO Customers (CustomerID, FName, LastName, Email, Address)
VALUES (11, 'NewFirstName', 'NewLastName', 'new.email@example.com', 'NewAddress');

-- 4)Write an SQL query to update the prices of all electronic gadgets in the "Products" table by 
--increasing them by 10%
ALTER TABLE Products
ADD Category VARCHAR(50);

UPDATE Products
SET Category = CAST(Description AS VARCHAR(50));

ALTER TABLE Products
DROP COLUMN Description;

UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Effective fitness equipment';

--5)Write an SQL query to delete a specific order and its associated order details 
--from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
DECLARE @OrderIDToDelete INT = 1;

DELETE FROM OrderDetails WHERE OrderID = @OrderIDToDelete;
DELETE FROM Orders WHERE OrderID = @OrderIDToDelete;

--6)Write an SQL query to insert a new order into the "Orders" table. Include the 
--customer ID, order date, and any other necessary information.

DECLARE @CustomerID INT = 5; 
DECLARE @OrderID INT = 14;  
DECLARE @OrderDate DATE = '2023-11-28';  
INSERT INTO Orders(OrderID,CustomerID,OrderDate) VALUES (@OrderID,@CustomerID,@OrderDate);

--7.Write an SQL query to update the contact information (e.g., email and address)of a specific customer in the "Customers" table. 
--Allow users to input the customer ID and new contact information.
DECLARE @CustomerIDToUpdate INT = 4;

UPDATE Customers
SET Email = 'new.email@example.com', Address = 'New Address'
WHERE CustomerID = @CustomerIDToUpdate;

--8. Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based 
--on the prices and quantities in the "OrderDetails" table.

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OrderDetails.Quantity * Products.Price)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
);

--9. Write an SQL query to delete all orders and their associated order details for a specific 
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.

DECLARE @CustomerIDToDelete INT = 5;

DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerIDToDelete);
DELETE FROM Orders WHERE CustomerID = @CustomerIDToDelete;
--10. Write an SQL query to insert a new electronic gadget product into the "Products" table, 
--including product name, category, price, and any other relevant details.

INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES (11, 'NewGadget', 'Cutting-edge electronic gadget', 49.99);


--11. Write an SQL query to update the status of a specific order in the "Orders" table
--(e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status.
ALTER TABLE Orders
ADD Status VARCHAR(50) DEFAULT 'Pending'; 
UPDATE Orders
SET Status = 'Pending'
WHERE Status IS NULL;
DECLARE @OrderIDToUpdate INT = 3; 
DECLARE @NewStatus NVARCHAR(50) = 'Shipped'; 
UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderIDToUpdate;

select * from Orders;


--12. Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers"
--table based on the data in the "Orders" table.Add a new column 'NumOrders' to the "Customers" table.
ALTER TABLE Customers
ADD NumOrders INT;
UPDATE Customers
SET NumOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);




--from here , these are all the aggregate queries. 
-----------------------------------------------------
--1.Write an SQL query to find out which customers have not placed any orders.
SELECT Customers.CustomerID, Customers.FName, Customers.LastName
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

--2. Write an SQL query to find the total number of products available for sale.
SELECT COUNT(*) AS TotalProducts
FROM Products;

--3. Write an SQL query to calculate the total revenue generated by TechShop. 
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

--4. Write an SQL query to calculate the average quantity ordered for products in a specific category.
--Allow users to input the category name as a parameter.
DECLARE @CategoryName NVARCHAR(50) = 'High-quality widget';  

SELECT AVG(Quantity) AS AverageQuantity
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = @CategoryName;

Select * from Products;

--5. Write an SQL query to calculate the total revenue generated by a specific customer. 
--Allow users to input the customer ID as a parameter.
DECLARE @CustomerID INT = 2; 

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE CustomerID = @CustomerID;

--6. Write an SQL query to find the customers who have placed the most orders.
--List their names and the number of orders they've placed.
SELECT c.CustomerID, c.FName,c.LastName,
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.FName, c.LastName
ORDER BY
    NumberOfOrders DESC;

--7. Write an SQL query to find the most popular product category, which
--is the one with the highest total quantity ordered across all orders.
SELECT TOP 1 WITH TIES Products.Category, SUM(Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY TotalQuantityOrdered DESC;

--8. Write an SQL query to find the customer who has spent the most money (highest total revenue) 
--on electronic gadgets. List their name and total spending.
SELECT TOP 1 WITH TIES Customers.CustomerID, Customers.FName, Customers.LastName, SUM(TotalAmount) AS TotalSpending
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electronics'
GROUP BY Customers.CustomerID, Customers.FName, Customers.LastName
ORDER BY TotalSpending DESC;

--9. Write an SQL query to calculate the average order value (total revenue divided by the number of orders)
--for all customers.
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

--10)Write an SQL query to find the total number of orders placed by each customer and 
--list their names along with the order count

SELECT Customers.CustomerID, Customers.FName, Customers.LastName, COUNT(Orders.OrderID) AS OrderCount
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FName, Customers.LastName;
-------------------------------------------------------------------

---joins
--1. Write an SQL query to retrieve a list of all orders along with customer information (e.g., customer name)
--for each order.
SELECT Orders.OrderID, Customers.FName, Customers.LastName, Customers.Email, Orders.OrderDate, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

---2. Write an SQL query to find the total revenue generated by each electronic gadget product. 
--Include the product name and the total revenue.

Select * from Products;

SELECT Products.ProductName, Products.Category, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'High-quality widget'
GROUP BY Products.ProductName, Products.Category;

--3. Write an SQL query to list all customers who have made at least one purchase. 
--Include their names and contact information.

SELECT DISTINCT Customers.CustomerID, Customers.FName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE SUM(Orders.OrderID)>1;


--4. Write an SQL query to find the most popular electronic gadget, which is the one with theest total 
--quantity ordered. Include the product name and the total quantity ordered.

SELECT TOP 1 WITH TIES Products.ProductName, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'High-quality widget'
GROUP BY Products.ProductName
ORDER BY TotalQuantityOrdered DESC;


---5)Write an SQL query to retrieve a list of electronic gadgets along with their corresponding categories.

SELECT ProductName, Category
FROM Products
WHERE Category = 'High-quality widget';

---6. Write an SQL query to calculate the average order value for each customer. Include the 
--customer's name and their average order value.

SELECT Customers.CustomerID, Customers.FName, Customers.LastName, AVG(Orders.TotalAmount) AS AverageOrderValue
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.FName, Customers.LastName;

---7. Write an SQL query to find the order with the highest total revenue. Include the order ID, 
--customer information, and the total revenue.

SELECT TOP 1  Orders.OrderID, Customers.FName, Customers.LastName, Orders.TotalAmount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
ORDER BY TotalAmount DESC;


--8. Write an SQL query to list electronic gadgets and the number of times each product has been ordered.

SELECT Products.ProductName, COUNT(OrderDetails.OrderID) AS NumberOfOrders
FROM OrderDetails
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'High-quality widget'
GROUP BY Products.ProductName;

--9. Write an SQL query to find customers who have purchased a specific electronic gadget product. 
--Allow users to input the product name as a parameter.

Select * from Products;


DECLARE @ProductName NVARCHAR(100) = 'Tool X';  -- Replace with the actual product name

SELECT DISTINCT Customers.CustomerID, Customers.FName, Customers.LastName, Customers.Email, Customers.Phone, Customers.Address
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
WHERE Products.ProductName = @ProductName;

--10. Write an SQL query to calculate the total revenue generated by all orders placed within a 
--specific time period. Allow users to input the start and end dates as parameters

DECLARE @StartDate DATE = '2023-01-01'; 
DECLARE @EndDate DATE = '2023-12-31';  

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders
WHERE OrderDate BETWEEN @StartDate AND @EndDate;


--------------------------------------------------------------------------------