/*
Le SQLEXTRACT()Cette fonction permet de récupérer des éléments de date et d'heure spécifiques 
(comme l'année, le mois, le jour ou l'heure) à partir d'une valeur de date ou d'horodatage.
 Bien que la syntaxe de base soit standard sur de nombreux systèmes de bases de données, 
les champs spécifiques disponibles et le format de sortie peuvent varier selon la plateforme. 
*/

SELECT customer_id,
EXTRACT(month FROM payment_date) as week,
SUM(amount) as Total_payment
FROM payment 
GROUP BY week , customer_id
ORDER BY Total_payment DESC
 
 