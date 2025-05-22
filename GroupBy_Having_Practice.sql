
------- Group by and Having

CREATE DATABASE ProductOrdering;


USE ProductOrdering;


CREATE TABLE Orders(
	OrderID INT,
	CustomerName VARCHAR(20),
	ProductID INT,
	Amount DECIMAL(10,2),
	OrderDate DATE
);


INSERT INTO Orders VALUES
(1, 'Sabari', 101, 500, '2024-01-15'),
(2, 'Subha', 102, 200, '2024-01-17'),
(3, 'Sabari', 101, 700, '2024-02-10'),
(4, 'Arun', 103, 150, '2024-03-05'),
(5, 'Subha', 101, 400, '2024-03-10'),
(6, 'Sabari', 102, 300, '2024-04-12'),
(7, 'Priya', 104, 250, '2024-04-18'),
(8, 'Arun', 101, 350, '2024-05-01'),
(9, 'Subha', 102, 150, '2024-05-03'),
(10, 'Priya', 104, 500, '2024-05-10');



--Basic Level
---Total orders placed for each product
SELECT ProductID , COUNT(*) FROM Orders
GROUP BY ProductID;

--Find the total sales amount for each customer.
SELECT CustomerName, SUM(Amount) FROM Orders
GROUP BY CustomerName;

--Group orders by customer and show how many orders each customer has placed.
SELECT CustomerName, COUNT(*)AS OrderPlaced
FROM Orders
GROUP BY CustomerName
ORDER BY OrderPlaced DESC;

--Show the average order amount for each product ID.
SELECT ProductID, AVG(Amount) AS Average 
FROM Orders
GROUP BY ProductID;

--List each customer along with the total amount they have spent on orders.
SELECT CustomerName, SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY CustomerName;



--Intermediate Level
--Find products that have been ordered more than 2 times.
SELECT ProductID, COUNT(*) AS OderedCount FROM Orders
GROUP BY ProductID
HAVING COUNT(*) > 2 ;

--Display customer names whose total order amount exceeds ₹400.
SELECT CustomerName , SUM(Amount) FROM Orders
GROUP BY CustomerName
HAVING SUM(Amount) > 400;

--Group orders by product and show the total sales for each product.
SELECT ProductID , SUM(Amount) FROM Orders
GROUP BY ProductID;

--List the product IDs that have been ordered more than 2 times and show their total sales.
SELECT ProductID , COUNT(*), SUM(Amount) FROM Orders
GROUP BY ProductID
HAVING COUNT(*) > 2;

-- Find the top 3 customers who spent the most.
SELECT TOP 3 CustomerName, SUM(Amount) FROM Orders
GROUP BY CustomerName
ORDER BY SUM(Amount) DESC;

--Show each product ID with its total sales amount, but only if it has been ordered by more than 2
SELECT ProductID, SUM(Amount),COUNT(DISTINCT CustomerName) FROM Orders
GROUP BY ProductID
HAVING COUNT(*) > 2;

--Show the total sales per month
SELECT FORMAT(OrderDate, 'yyyy-MM') AS SalesMonth, SUM(Amount) AS TotalAmount
FROM Orders
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY SalesMonth;

--List all customers who placed at least one order in the last 30 days
SELECT CustomerName FROM Orders
WHERE OrderDate >= DATEADD(DAY, -30, GETDATE());

