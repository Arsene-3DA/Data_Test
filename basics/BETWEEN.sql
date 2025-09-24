 SELECT OrderID, OrderDate
    FROM Orders
    WHERE OrderDate BETWEEN '2023-01-01' AND '2023-01-31';

    
SELECT ProductName
    FROM Products
    WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
    ORDER BY ProductName;