# Cours de Mysql

## Sommaire
1. [Installation et Configuration sous Debian](#installation-et-configuration-sous-debian)
2. [Syntaxe Commande](#syntaxe-commande)
3. [Types](#types)
4. [Creer une base de donnee](#creer-une-base-de-donnee)
5. [Creer des tables](#creer-des-tables)
6. [Modifier des tables](#modifier-des-tables)
7. [Inserer des donnees](#inserer-des-donnees)
8. [Selections des donnees](#selections-des-donnees)
9. [Supression et Modifications des lignes](#supression-et-modifications-des-lignes)
10. [Index](#index)
11. [EXO](#exo)

## Installation et Configuration sous Debian : 
```
sudo apt-get install mysql-server mysql-client
```

### Creations Utilisateurs : 
```
CREATE USER 'student'@'localhost' IDENTIFIED BY 'mot_de_passe';
GRANT ALL PRIVILEGES ON elevage.* TO 'student'@'localhost';
```
* CREATE USER 'student'  : cette commande crée l'utilisateur student.

* @'localhost'  : définit à partir d'où l'utilisateur peut se connecter. Dans notre cas, 'localhost', donc il devra être connecté à partir de cet ordinateur.

* IDENTIFIED BY 'mot_de_passe'  : définit le mot de passe de l'utilisateur.

* GRANT ALL PRIVILEGES  : cette commande permet d'attribuer tous les droits (c'est-à-dire insertions de données, sélections, modifications, suppressions…).

* ON elevage.*  : définit les bases de données et les tables sur lesquelles ces droits sont acquis.

* TO 'student'@'localhost'  : définit l'utilisateur (et son hôte) auquel on accorde ces droits. 

## Syntaxe Commande

```
mysql -h localhost -u root -pmotdepassetopsecret
ou
mysql --host=localhost --user=root --password=motdepassetopsecret
ou un mélange des paramètres courts et longs si ça vous amuse
mysql -h localhost --user=root -pmotdepassetopsecret
mysql -u sdz -p elevage

Sauvegarde d'une base de donnees
mysqldump -u user -p --opt nom_de_la_base > sauvegarde.sql 

Restaurer base de donnees
mysql elevage < elevage_sauvegarde.sql
```

### Encodage : 
```
SET NAMES 'utf8';
mysql -u student -p --default-character-set=utf8
```


## Types
* https://openclassrooms.com/fr/courses/1959476-administrez-vos-bases-de-donnees-avec-mysql/1960456-distinguez-les-differents-types-de-donnees
* Attribut **UNSIGNED**
* Attribut ZEROFILL (Taille d'affichage ) :
```
INT(4) ZEROFILL
```
### Nombres Entiers

* TINYINT  1     -128           127
* SMALLINT 2     -32768         32767
* MEDIUMINT  3   -8388608       8388607
* INT   4        -2147483648    2147483647
* BIGINT 8      -9223372036854775808   9223372036854775807

### Nombres decimaux : 
* DECIMAL, 
```
DECIMAL(5, 3) 5 Chiffre dont, 3 apres la virgule
```
* NUMERIC, 
* FLOAT, 
```
FLOAT sur 4 octets, avec parametre ou pas
```
* DOUBLE.
```
DOUBLE sur 8 octets sans parametre
```

### Chaînes de type texte
* CHAR et VARCHAR
```
CHAR(x) :  Longueur Fixe (code postal). 
VARCHAR(x) : Longueur Variable.
```

* TINYTEXT    28 octets   Longueur de la chaîne + 1 octet
* TEXT    216 octets   Longueur de la chaîne + 2 octets
* MEDIUMTEXT    224 octets   Longueur de la chaîne + 3 octets
* LONGTEXT    232 octets   Longueur de la chaîne + 4 octets

### Binaires : 
```
VARBINARY(x)  et BINARY(x)  permettent de stocker des chaînes binaires de x caractères au maximum (avec une gestion de la mémoire identique à VARCHAR(x)  et CHAR(x)). 

Pour les chaînes plus longues, il existe les types TINYBLOB, BLOB, MEDIUMBLOB  et LONGBLOB, avec les mêmes limites de stockage que les types TEXT.
```

### Types temporels
* DATE Stocke unde date
* TIME Stocke une heure
* DATETIME Stocke une date et une heure
* YEAR
* TIMESTAMP

## Creer une base de donnee
* CREATE DATABASE elevage CHARACTER SET 'utf8';
* DROP DATABASE elevage;
* USE elevage
* SHOW WARNINGS;

## Creer des tables
### Les Moteurs de Tables : 
* Preciser Moteurs de table : 
```
ENGINE = INNODB;
```
#### * MyISAM
```
Moteur par défaut. Rapides sur les tables utilisant ce moteur. Cependant, il ne gère pas certaines fonctionnalités importantes comme les clés étrangères, qui permettent de vérifier l'intégrité d'une référence d'une table à une autre table (voir la deuxième partie du cours) ou les transactions, qui permettent de réaliser des séries de modifications "en bloc", ou au contraire d'annuler ces modifications (voir la cinquième partie du cours).
```

#### * InnoDB
```
Plus lent et plus gourmand en ressources que MyISAM, ce moteur gère les clés étrangères et les transactions. Étant donné que nous nous servirons des clés étrangères dès la deuxième partie, c'est celui-là que nous allons utiliser.
De plus, en cas de crash du serveur, il possède un système de récupération automatique des données.
```

### Creations : 
```
CREATE TABLE IF NOT EXISTS Animal (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    espece VARCHAR(40) NOT NULL DEFAULT 'chien',
    sexe CHAR(1),
    date_naissance DATETIME NOT NULL,
    nom VARCHAR(30),
    commentaires TEXT,
    PRIMARY KEY (id)
)
ENGINE=INNODB;


SHOW TABLES;      -- liste les tables de la base de données
DESCRIBE Animal;  -- liste les colonnes de la table avec leurs caractéristiques
DROP TABLE Animal; 
```

## Modifier des tables

* ALTER TABLE nom_table ADD ... -- permet d'ajouter quelque chose (une colonne par exemple)
```
ALTER TABLE Test_tuto 
ADD COLUMN date_insertion DATE NOT NULL;
```

* ALTER TABLE nom_table DROP ... -- permet de retirer quelque chose 
```
ALTER TABLE Test_tuto 
DROP COLUMN date_insertion; -- Suppression de la colonne date_insertion
```
* ALTER TABLE nom_table CHANGE ...
```
ALTER TABLE Test_tuto 
CHANGE nom prenom VARCHAR(10) NOT NULL; change le nom de nom-> prenom
```
* ALTER TABLE nom_table MODIFY ... -- permettent de modifier une colonne
```
ALTER TABLE Test_tuto 
CHANGE prenom nom VARCHAR(30) NOT NULL; -- Changement du type + changement du nom

ALTER TABLE Test_tuto 
CHANGE id id BIGINT NOT NULL; -- Changement du type sans renommer

ALTER TABLE Test_tuto
MODIFY id BIGINT NOT NULL AUTO_INCREMENT; -- Ajout de l'auto-incrémentation

ALTER TABLE Test_tuto 
MODIFY nom VARCHAR(30) NOT NULL DEFAULT 'Blabla'; -- Changement de la description (même type mais ajout d'une valeur par défaut)
```

## Inserer des donnees

```
INSERT INTO Animal 
VALUES (1, 'chien', 'M', '2010-04-05 13:43:00', 'Rox', 'Mordille beaucoup');


INSERT INTO Animal (espece, sexe, date_naissance) 
VALUES ('tortue', 'F', '2009-08-03 05:12:00');


INSERT INTO Animal (espece, sexe, date_naissance, nom) 
VALUES ('chien', 'F', '2008-12-06 05:18:00', 'Caroline'),
        ('chat', 'M', '2008-09-11 15:38:00', 'Bagherra'),
        ('tortue', NULL, '2010-08-23 05:18:00', NULL);


INSERT INTO Animal 
SET nom='Bobo', espece='chien', sexe='M', date_naissance='2010-07-21 15:41:00';
```

### Charger fichiers : 
```
nom;prenom;date_naissance
Charles;Myeur;1994-12-30
Bruno;Debor;1978-05-12
Mireille;Franelli;1990-08-23

LOAD DATA LOCAL INFILE 'personne.csv'
INTO TABLE Personne
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n' -- ou '\r\n' selon l'ordinateur et le programme utilisés pour créer le fichier
IGNORE 1 LINES
(nom,prenom,date_naissance);
```

## Selections des donnees
```
SELECT * 
FROM Animal 
ORDER BY id 
LIMIT 10 OFFSET 0;

LIKE

SELECT count(entity.id), entity.jurisdiction 
FROM entity
GROUP BY entity.jurisdiction 
ORDER BY count desc 
LIMIT 100;

SELECT * FROM Animal WHERE espece IN (‘chat’, ‘chien’) AND sexe IN (‘M’, ‘F’)

=  égal
<  inférieur
<=  inférieur ou égal
>  supérieur
>=  supérieur ou égal
<> ou !=  différent
<=>  égal (valable pour NULL  aussi)
```

## Supression et Modifications des lignes
```
DELETE FROM Animal 
WHERE nom = 'Zoulou';

DELETE FROM Animal;

UPDATE Animal 
SET sexe='F', nom='Pataude' 
WHERE id=21;
```

## Index
* Unique
* FullText

```
CREATE TABLE Animal (
    id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    espece VARCHAR(40) NOT NULL,
    sexe CHAR(1),
    date_naissance DATETIME NOT NULL,
    nom VARCHAR(30),
    commentaires TEXT,
    PRIMARY KEY (id),
    INDEX ind_date_naissance (date_naissance),  
    INDEX ind_nom (nom(10)),                    
    UNIQUE INDEX ind_uni_nom_espece (nom, espece)  -- Index sur le nom et l'espece
)
ENGINE=INNODB;


ALTER TABLE nom_table
ADD INDEX [nom_index] (colonne_index [, colonne2_index ...]); --Ajout d'un index simple

ALTER TABLE nom_table
ADD UNIQUE [nom_index] (colonne_index [, colonne2_index ...]); --Ajout d'un index UNIQUE

ALTER TABLE nom_table
ADD FULLTEXT [nom_index] (colonne_index [, colonne2_index ...]); --Ajout d'un index FULLTEXT

CREATE INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]);  -- Crée un index simple

CREATE UNIQUE INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]);  -- Crée un index UNIQUE


CREATE FULLTEXT INDEX nom_index
ON nom_table (colonne_index [, colonne2_index ...]);  -- Crée un index FULLTEXT
```

### Cle etrangere : 
```
CREATE TABLE Commande (
    numero INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    client INT UNSIGNED NOT NULL,
    produit VARCHAR(40),
    quantite SMALLINT DEFAULT 1,
    CONSTRAINT fk_client_numero          -- On donne un nom à notre clé
        FOREIGN KEY (client)             -- Colonne sur laquelle on crée la clé
        REFERENCES Client(numero)        -- Colonne de référence
)
ENGINE=InnoDB;                          -- MyISAM interdit, je le rappelle encore une fois !


ALTER TABLE Commande
ADD CONSTRAINT fk_client_numero FOREIGN KEY (client) REFERENCES Client(numero);
```

## EXO

*  1. Moi, j'aime bien les chiens de berger
Vous devez obtenir la liste des races de chiens qui sont des chiens de berger.
```
SELECT * FROM Animal
JOIN Espece E on Animal.espece_id = E.id
JOIN Race R on Animal.race_id = R.id
WHERE E.nom_courant = 'Chien' && R.nom LIKE '%Berger%'
```

*  2. Mais de quelle couleur peut bien être son pelage ?
Vous devez obtenir la liste des animaux (leur nom, date de naissance et race) pour lesquels nous n'avons aucune information sur leur pelage.
```
SELECT * FROM Animal
LEFT JOIN Race R on Animal.race_id = R.id
WHERE (R.description NOT LIKE '%poil%')
                        AND (R.description NOT LIKE '%pelage%')
                        AND (R.description NOT LIKE '%robe%')
OR R.id IS NULL;
```

* 3. Race et espece
Vous devez obtenir la liste des chats et des perroquets amazones, avec leur sexe, leur espèce (nom latin) et leur race s'ils en ont une. Regroupez les chats ensemble, les perroquets ensemble et, au sein de l'espèce, regroupez les races.
```
SELECT E.nom_courant, E.nom_latin, R.nom, A.sexe FROM Animal AS A
JOIN Espece E on A.espece_id = E.id
LEFT JOIN Race R on A.race_id = R.id
WHERE E.nom_courant IN ('Perroquet amazone', 'Chat')
ORDER BY E.nom_courant, A.sexe
```

* 4. Futures génitrices
Vous devez obtenir la liste des chiennes dont on connaît la race, et qui sont en âge de procréer (c'est-à-dire nées avant juillet 2010). Affichez leurs nom, date de naissance et race.
```
SELECT A.nom, R.nom, A.date_naissance FROM Animal AS A
JOIN Espece E on A.espece_id = E.id
JOIN Race R on A.race_id = R.id
WHERE (E.nom_courant = 'Chien') AND (A.sexe = 'F') AND (A.date_naissance <= '2010-07-01')
```

* 5. Mon père, ma mère, mes frères et mes sœurs (Wohooooo)
Vous devez obtenir la liste des chats dont on connaît les parents, ainsi que le nom de ces parents.
```
SELECT A.nom, pere.nom AS pere, mere.nom AS mere FROM Animal AS A
JOIN Animal AS pere on pere.id = A.pere_id
JOIN Animal AS mere on mere.id = A.mere_id
JOIN Espece E on A.espece_id = E.id
WHERE E.nom_courant = 'Chat'
```