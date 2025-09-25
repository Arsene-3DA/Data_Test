CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    [ELSE else_result]
END

/*
Exemple 1 : Catégorisation des données dans une SELECT instruction
Cet exemple utilise une CASEinstruction pour catégoriser les produits en fonction de leur gamme de prix, 
créant ainsi une nouvelle colonne PriceCategory. 

SELECT 
    ProductName,
    Price,
    CASE
        WHEN Price < 50 THEN 'Bas prix'
        WHEN Price BETWEEN 50 AND 150 THEN 'Moyen prix'
        ELSE 'Haut de gamme'
    END AS PriceCategory
FROM 
    Products;

*/


--WHERE

/*

SELECT 
    ProductName,
    Price
FROM 
    Products
WHERE 
    CASE
        WHEN Price < 50 THEN 'Bas prix'
        WHEN Price BETWEEN 50 AND 150 THEN 'Moyen prix'
        ELSE 'Haut de gamme'
    END = 'Haut de gamme';


*/





SELECT
    (colonne_prix * 1.10) AS prix_avec_augmentation,
    (colonne_prix * 1.10) + colonne_autre_prix AS total_additionne
FROM
    votre_table;


        SELECT
        colonne_nom,
        CASE
            WHEN [votre_condition_specifique] THEN (colonne_prix * 1.10) + frais_supplementaires
            ELSE frais_supplementaires
        END AS prix_total_modifie
    FROM
        votre_table;

--Correction  

SELECT 
    order_id,
    product_id,
    quantity,
    unit_price,
    CASE 
        WHEN quantity > 1 
            THEN (quantity * unit_price * 0.9) + shipping_fee
        ELSE (quantity * unit_price) + shipping_fee
    END AS total_price
FROM 
    sales_orders;


---Correction du challenge  sur 

SELECT order_id, product_id,quantity,unit_price,
case
    WHEN quantity > 1 THEN (unit_price * quantity * 0.9) + shipping_fee
    else (quantity*unit_price) + shipping_fee
end AS total_price 
    

    SELECT
title,
CASE
	WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
	WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END as tier_list
FROM film
	WHERE 
CASE
	WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
	WHEN description LIKE '%Drama%' AND length>90 THEN 'Long drama (tier 2)'
	WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
	WHEN rental_rate<1 THEN 'Very cheap (tier 4)'
END is not null

-- Vision plus simplifier 

WITH film_tiers AS (
    SELECT
        title,
        CASE
            WHEN rating IN ('PG','PG-13') OR length > 210 THEN 'Great rating or long (tier 1)'
            WHEN description LIKE '%Drama%' AND length > 90 THEN 'Long drama (tier 2)'
            WHEN description LIKE '%Drama%' THEN 'Short drama (tier 3)'
            WHEN rental_rate < 1 THEN 'Very cheap (tier 4)'
        END AS tier_list
    FROM film
)
SELECT *
FROM film_tiers
WHERE tier_list IS NOT NULL;
