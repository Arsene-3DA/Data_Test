SELECT  *

FROM payment 

WHERE customer_id IN(320, 346 ,354) AND (amount < 2 )

ORDER BY amount DESC
 
 SELECT * FROM Customers
WHERE Country = "mexico" OR Country = "Germany"