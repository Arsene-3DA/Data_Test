/*
Fonctions de longueur courantes :

LENGTH()ou LEN(): Ces fonctions sont largement utilisées pour renvoyer le nombre de caractères d'une expression de chaîne. Certaines implémentations,
 comme celle de SQL Server LEN(), excluent les espaces de fin du calcul de la longueur, tandis que d'autres, comme celle de MySQL LENGTH(), comptent 
 tous les caractères, y compris les espaces de fin.

OCTET_LENGTH(): Cette fonction renvoie le nombre d'octets d'une expression de chaîne, y compris les espaces de fin. Ceci est utile pour comprendre la 
taille du stockage physique, notamment avec les encodages de caractères multi-octets.

CHAR_LENGTH()ou CHARACTER_LENGTH(): Ces fonctions renvoient le nombre de caractères dans une expression de chaîne, une colonne ou une variable, 
fournissant un décompte basé sur les caractères quelle que soit la représentation en octets.

DATALENGTH()(Serveur SQL) : Cette fonction renvoie le nombre d'octets utilisés pour représenter une expression, y compris les espaces de fin pour 
les types de données caractères et la longueur totale pour les types de données binaires.

*/

SELECT
    column_name,
    LENGTH(column_name) AS character_length,
    OCTET_LENGTH(column_name) AS byte_length
FROM
    your_table;


SELECT LENGTH('Db2 database'); -- Renvoie 12

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
