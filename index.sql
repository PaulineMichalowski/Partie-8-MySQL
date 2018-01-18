-- Exercice 1
-- Une jointure crée une table virtuelle et temporaire qui reprend les colonnes des tables liées
-- SELECT languages.name : sélectionne la colonne name de la table languages.
SELECT 
    `languages`.`name`, `frameworks`.`name` 
-- FROM languages: je travaille sur la table languages.
FROM 
    `languages` 
-- LEFT JOIN : cela signifie que l'on veut toutes les lignes de la table de gauche même si certaines n'ont pas de correspondance avec une ligne de la table de droite.
LEFT JOIN 
    `frameworks` 
ON 
    `frameworks`.`languagesId` = `languages`.`id`;

-- Exercice 2
SELECT 
    `languages`.`name`, `frameworks`.`name` 
FROM 
    `languages` 
-- INNER JOIN : je la joins (avec une jointure interne) à la table frameworks.
INNER JOIN  
    `frameworks` 
ON 
    `frameworks`.`languagesId` = `languages`.`id`;

-- Exercice 3
-- SELECT COUNT() permet de compter le nombre d'enregistrement (de lignes) dans une table
SELECT COUNT(`frameworks`.`name`)
FROM 
    `languages` 
INNER JOIN 
    `frameworks` 
ON 
    `frameworks`.`languagesId` = `languages`.`id` 
WHERE 
    `languages`.`name` = 'CSS';

SELECT 
    `languages`.`name`,
COUNT(`frameworks`.`name`) 
AS 
    `number_of_frameworks`
FROM 
    `languages`
INNER JOIN 
    `frameworks` 
ON 
    `frameworks`.`languagesId` = `languages`.`id`
-- GROUP BY est utilisée pour grouper plusieurs résultats et utiliser une fonction de totaux sur un groupe de résultat
GROUP BY 
    `languages`.`name` 
ORDER BY 
    `number_of_frameworks` 
DESC;

-- Exercice 4
SELECT 
    `languages`.`name`,
COUNT(`frameworks`.`name`) 
AS 
    `number_of_frameworks`
FROM 
    `languages`
INNER JOIN 
    `frameworks` 
ON 
    `frameworks`.`languagesId` = `languages.id`
GROUP BY 
    `languages`.`name`
-- HAVING permet de filtrer en utilisant des fonctions telles que SUM(), COUNT(), AVG(), MIN() ou MAX().
HAVING 
    `number_of_frameworks` > 3;