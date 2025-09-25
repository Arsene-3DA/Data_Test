/*
LeSUBSTRING()Une fonction est une commande SQL standard permettant d'extraire une portion de chaîne 
selon une position de départ et une longueur spécifiées. Le nom et 
la syntaxe exacte de la fonction peuvent varier légèrement selon les systèmes de base de données, commeSUBSTR() Oracle . 

SUBSTRING(string, start, length)

*/


/*
string: Le texte (ou la colonne) à partir duquel vous souhaitez extraire une sous-chaîne.
start: Position de départ de la sous-chaîne. Dans la plupart des langages SQL, les positions commencent à 1, et non à 0.
length: Le nombre de caractères à extraire.




*/

/*SELECT
    SUBSTRING(
        email, 
        POSITION('.' IN email) + 1, 
        POSITION('@' IN email) - POSITION('.' IN email) - 1
    ) AS last_name_from_email,
    email
FROM
    customer;
 

 /*LEFT(first_name , 1)||'***.'||LEFT(last_name , 1)||'***.'|| SUBSTRING(
        email, 
        POSITION('@' IN email) + 1, 
        POSITION('@' IN email) + POSITION('.' IN email) 
    ) AS last_name_from_email,
    email
*/
    --Correction 


    /*SELECT LEFT(first_name , 1)||'***.'||LEFT(last_name , 1)||'***.'|| SUBSTRING(
        email, 
        POSITION('@' IN email) + 1, 
        LENGTH(email) - POSITION('@' IN email) 
    ) AS last_name_from_email,
    email
	
first_name, last_name , email 
FROM
    customer;*/