/*
2. Conversion d'une colonne
Cet exemple sélectionne le first_namedans une table et affiche tous les noms en majuscules. 
*/
SELECT UPPER(first_name) AS upper_name
FROM employees;
/*
3. Effectuer une recherche insensible à la casse
Cette requête trouve tous les employés dont le nom last_nameest « smith », quel que soit le nom. 
*/
SELECT *
FROM employees
WHERE UPPER(last_name) = 'SMITH';
/*
4. Conversion et concaténation de chaînes
Cet exemple de SQL Server montre comment convertir un nom de famille en majuscules
 et le combiner avec un prénom pour créer un nom complet standardisé. 
*/
SELECT UPPER(RTRIM(LastName)) + ', ' + FirstName AS FullName
FROM dbo.DimEmployee;


SELECT review_id , review_text ,LENGTH(review_text) AS review_length

FROM customer_reviews

WHERE product_id = 101 AND LOWER(review_text) LIKE '%great%'

ORDER BY LENGTH(review_text) ASC 

--Challenge 

SELECT 
LOWER(first_name) , LENGTH(first_name) AS nbre_first, 
LOWER(Last_name) , LENGTH(Last_name) AS nbre_Last
FROM customer 
WHERE LENGTH(first_name)>10 OR LENGTH(Last_name)>10
ORDER BY LENGTH(first_name) DESC 