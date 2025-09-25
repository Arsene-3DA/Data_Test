-- GROUP BY
-- Je retiens  ici que chaque utilisateur a un id different
-- Quand j'utilises COUNT():  c'est pour compter le nombre de ligne 
-- mais Quand je rajoute dans GROUP BY city et country
-- compte chaque clients de dans les ville et montrant leur pays 
SELECT country, City, COUNT(CustomerID) 
FROM Customers
GROUP BY country, City