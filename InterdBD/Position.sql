/*
Décomposition de la requête
SELECT LEFT(last_name, ...), email FROM customer:
La requête sélectionne la colonne emailpour l'afficher telle quelle.
Elle utilise la fonction LEFT()sur la colonne last_name, ce qui signifie qu'elle va extraire 
un nombre de caractères à partir de la gauche de la valeur dans last_name.
Le nombre de caractères à extraire est déterminé par la valeur renvoyée par POSITION(...).

POSITION(last_name IN email):
Cette fonction recherche la position de la chaîne last_nameà l'intérieur de la chaîne email.

La fonction renvoie la position de départ (un nombre) si elle trouve la sous-chaîne, et 0 si elle ne la trouve pas. 




SELECT
    SUBSTRING(
        email, 
        POSITION('.' IN email) + 1, 
        POSITION('@' IN email) - POSITION('.' IN email) - 1
    ) AS last_name_from_email,
    email
FROM
    customer;
*/

