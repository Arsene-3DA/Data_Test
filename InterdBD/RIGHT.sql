/*
La RIGHT()fonction SQL extrait un nombre spécifié de caractères de la fin (côté droit) d'une chaîne. 

RIGHT(string_expression, integer_expression)

*/
SELECT FirstName, RIGHT(FirstName, 3) AS LastThreeChars
FROM Employees;