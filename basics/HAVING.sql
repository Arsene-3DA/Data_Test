--ERROR:  column "payment.payment_date" must appear in the GROUP BY clause or be used in an aggregate function
--LINE 2: staff_id,payment_date, :  Toujours Pensee a Specifier DATE pour les colonne de date 
--Quand nous devons utiliser de l'agregation dans les colonnes 
--Pourquoi on met souvent DATE(payment_date) ?

--Parce que souvent payment_date est une date complète avec heure (timestamp).

--Si tu veux grouper par jour (et pas chaque seconde), tu dois transformer en DATE(payment_date).

--Ça permet de réduire toutes les valeurs d’un même jour en un seul groupe.     


SELECT staff_id,DATE(payment_date),SUM(amount),COUNT(*)
FROM payment 
WHERE amount != 0
GROUP BY staff_id, DATE(payment_date)
HAVING COUNT (*)>400
ORDER BY COUNT(*) DESC
-----------------------------------------------
SELECT City,AVG(Amount) AS AverageAmount
FROM Sales
GROUP BY City
HAVING COUNT(TransactionID) > 2AND AVG(Amount) > 150
ORDER BY AverageAmount DESC;