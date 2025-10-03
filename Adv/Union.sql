--Cette requête te donne la liste unique des prénoms présents dans actor et dans customer.

--Veux-tu que je t’explique aussi la différence si tu avais écrit UNION ALL à la place ?

SELECT first_name  FROM actor 
UNION 
SELECT first_name  FROM customer


-- Avec des alias de columme pours savoir ques est la sortie 
SELECT first_name , 'actor' AS Liste_du_personnelles FROM actor 
UNION 
SELECT first_name , 'customer' AS Liste_du_personnelles  FROM customer



--- La comprehension d'un double select pour resoudre le probleme 

-- phase 1 
SELECT 
AVG(amount)
FROM payement 


-- Phase 2 

SELECT 
*
FROM payement 
WHERE amount > AVG(amount) -- AVG(amount) : represnte ici la sortie de la phase 1  La reponse ici de permet de cachee la valeur moyen
-- de ta BD


--Phase 3

SELECT 
*
FROM payement 
WHERE amount > (SELECT AVG(amount)  FRom payment)


-- MA reponse du challenge 1

SELECT 
title
FROM film 
WHERE rental_duration > (SELECT AVG(rental_duration) FROM film)

-- Ma reponse du challenge 2



