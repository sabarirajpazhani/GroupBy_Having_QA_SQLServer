
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


SELECT * FROM Orders;
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