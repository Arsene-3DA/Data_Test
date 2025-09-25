/*
L'utilisation de la fonctionLOWER()ne modifie que les lettres (majuscules en minuscules). 
Elle ignore complètement les chiffres et les caractères spéciaux, ce qui est exactement 
ce dont vous avez besoin pournormaliser les adresses email. Les chiffres présents dans les
 emails resteront intacts. 
*/

SELECT LOWER(email) AS email_en_minuscule
FROM employes;

/*
2. Gestion des chiffres romains
Si vous voulez uniformiser les noms avec des chiffres romains, vous pouvez également utiliser LOWER(). 
Cependant, si vous avez besoin de traiter les chiffres romains eux-mêmes (par exemple, 
pour les convertir en chiffres arabes ou pour trier),cela devient plus complexe et nécessite 
des fonctions ou des expressions supplémentaires. 
*/

-- Exemple avec une colonne 'nom_monarque' contenant 'Louis II', 'Louis I'
SELECT nom_monarque
FROM monarques
ORDER BY 
  SUBSTRING(nom_monarque FROM '^[a-zA-Z]+'),  -- Trie d'abord par le nom
  CASE                          -- Puis par le chiffre romain converti
    WHEN SUBSTRING(nom_monarque FROM '[IVXLCDM]+$') = 'I' THEN 1
    WHEN SUBSTRING(nom_monarque FROM '[IVXLCDM]+$') = 'II' THEN 2
    WHEN SUBSTRING(nom_monarque FROM '[IVXLCDM]+$') = 'III' THEN 3
    ELSE 999 -- Gère les autres cas
  END;
/*
3. Recherche avec des jokers
Si vous voulez trouver tous les noms qui se terminent par un chiffre (arabe ou romain), 
vous pouvez utiliser l'opérateur LIKE avec des jokers (%).SQL
*/

-- Trouve les noms qui se terminent par un chiffre arabe
SELECT nom_complet
FROM personnes
WHERE nom_complet LIKE '%[0-9]';

-- Trouve les noms qui se terminent par un chiffre romain (I, II, III)
SELECT nom_complet
FROM personnes
WHERE nom_complet LIKE '%I' OR nom_complet LIKE '%II' OR nom_complet LIKE '%III';


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

