/*
RTRIM : c'est quoi
La fonctionRTRIM()en SQL est une fonction de chaîne qui supprime les espaces de fin (à droite) 
d'une chaîne de caractères . C'est l'opposé de la fonction LTRIM(), qui supprime les espaces de début (à gauche). 
RTRIMest très utile pour nettoyer les données en supprimant les espaces inutiles qui pourraient s'être glissés 
lors de la saisie ou de l'importation de données. Ces espaces peuvent causer des problèmes lors des comparaisons 
ou des jointures de chaînes de caractères. Syntaxe

RTRIM(chaîne_de_caractères)

*/
SELECT RTRIM('Ceci est un test    ');
-- Résultat : 'Ceci est un test'

