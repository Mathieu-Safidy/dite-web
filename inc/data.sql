CREATE TABLE admin(
   idAdmin INT auto_increment,
   mail VARCHAR(50)  NOT NULL,
   mdp VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idAdmin),
   UNIQUE(mail)
);

CREATE TABLE users(
   idUser INT auto_increment,
   mail VARCHAR(50)  NOT NULL,
   mdp VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idUser),
   UNIQUE(mail)
);

CREATE TABLE infoUsers(
   idInfo INT auto_increment,
   idUser INT NOT NULL,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   adresse VARCHAR(50)  NOT NULL,
   dateNaissance DATE NOT NULL,
   dateEmbauche DATE NOT NULL,
   PRIMARY KEY(idInfo),
   FOREIGN KEY(idUser) REFERENCES users(idUser)
);

CREATE TABLE variete(
   idVar INT auto_increment,
   nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idVar)
);
CREATE TABLE removeVariete(
   idRemove Int PRIMARY KEY auto_increment,
   idVar INT NOT NULL,
   dateRemove Date not null,
   FOREIGN KEY(idVar) REFERENCES variete(idVar)
);
CREATE TABLE moveVariete(
   idMove Int auto_increment,
   idVar INT,
   nom VARCHAR(50)  NOT NULL,
   dateMove Date not null,
   FOREIGN KEY(idVar) REFERENCES variete(idVar),
   PRIMARY KEY(idMove)
);
CREATE or replace view v_var 
   as (select * from variete where idVar 
      not in (select idVar from removeVariete) and 
      idVar not in (select idVar from moveVariete)
);

CREATE OR REPLACE VIEW v_moveVar AS
SELECT idVar, nom
FROM moveVariete
WHERE (idVar, dateMove) IN (
    SELECT idVar, MAX(dateMove) AS max_date
    FROM moveVariete
    GROUP BY idVar
);

CREATE OR REPLACE VIEW v_variete AS
SELECT * FROM v_var 
UNION 
SELECT * FROM v_moveVar;

CREATE TABLE parcelle(
   idParcelle INT auto_increment,
   surface DECIMAL(10,2)   NOT NULL,
   idVar INT NOT NULL,
   PRIMARY KEY(idParcelle),
   FOREIGN KEY(idVar) REFERENCES variete(idVar)
);

CREATE TABLE removeParcelle(
   idMove Int PRIMARY KEY auto_increment,
   idParcelle INT NOT NULL,
   dateRemove date not null,
   FOREIGN KEY(idParcelle) REFERENCES parcelle(idParcelle)
);

CREATE TABLE moveParcelle(
   idMove Int auto_increment,
   idParcelle INT,
   surface DECIMAL(10,2)   NOT NULL,
   idVar INT NOT NULL,
   dateMove date not null,
   PRIMARY KEY(idMove),
   FOREIGN KEY(idParcelle) REFERENCES parcelle(idParcelle),
   FOREIGN KEY(idVar) REFERENCES variete(idVar)
);
CREATE or replace view v_par 
   as (select * from parcelle where idParcelle 
      not in (select idParcelle from removeParcelle) and 
      idParcelle not in (select idParcelle from moveParcelle)
);

CREATE OR REPLACE VIEW v_movePar AS
SELECT idParcelle, surface, idVar
FROM moveParcelle
WHERE (idParcelle, dateMove) IN (
    SELECT idParcelle, MAX(dateMove) AS max_date
    FROM moveParcelle
    GROUP BY idParcelle
);

CREATE OR REPLACE VIEW v_parcelle AS
SELECT * FROM v_par
UNION 
SELECT * FROM v_movePar;

CREATE TABLE cueilleurs(
   idCueilleur INT auto_increment,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   sexe CHAR(1)  NOT NULL,
   adresse VARCHAR(50)  NOT NULL,
   dateNaissance DATE NOT NULL,
   dateEmbauche DATE NOT NULL,
   PRIMARY KEY(idCueilleur)
);

CREATE TABLE removeCueilleurs(
   idRemove int PRIMARY KEY auto_increment,
   idCueilleur int not null,
   dateRemove date not null,
   FOREIGN KEY(idCueilleur) REFERENCES cueilleurs(idCueilleur)

);

CREATE TABLE moveCueilleurs(
   idMove int auto_increment,
   idCueilleur INT,
   nom VARCHAR(50)  NOT NULL,
   prenom VARCHAR(50)  NOT NULL,
   sexe CHAR(1)  NOT NULL,
   adresse VARCHAR(50)  NOT NULL,
   dateNaissance DATE NOT NULL,
   dateEmbauche DATE NOT NULL,
   dateMove date not null,
   FOREIGN KEY(idCueilleur) REFERENCES cueilleurs(idCueilleur),
   PRIMARY KEY(idMove)
);
CREATE or replace view v_cueil
   as (select * from cueilleurs where idCueilleur 
      not in (select idCueilleur from removeCueilleurs) and 
      idCueilleur not in (select idCueilleur from moveCueilleurs)
);

CREATE OR REPLACE VIEW v_moveCueil AS
SELECT idCueilleur, nom,prenom,sexe,adresse,dateNaissance,dateEmbauche
FROM moveCueilleurs
WHERE (idCueilleur, dateMove) IN (
    SELECT idCueilleur, MAX(dateMove) AS max_date
    FROM moveCueilleurs
    GROUP BY idCueilleur
);

CREATE OR REPLACE VIEW v_Cueilleur AS
SELECT * FROM v_cueil
UNION 
SELECT * FROM v_moveCueil;

CREATE TABLE categorie(
   idCate INT auto_increment,
   nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idCate)
);
CREATE TABLE removeCate(
   idRemove Int PRIMARY KEY auto_increment,
   idCate INT NOT NULL,
   dateRemove Date not null,
   FOREIGN KEY(idCate) REFERENCES categorie(idCate)
);
CREATE TABLE moveCate(
   idMove Int PRIMARY KEY auto_increment,
   idCate INT,
   nom VARCHAR(50)  NOT NULL,
   dateMove Date not null,
   FOREIGN KEY(idCate) REFERENCES categorie(idCate)
);
CREATE or replace view v_cate 
   as (select * from categorie where idCate 
      not in (select idCate from removeCate) and 
      idCate not in (select idCate from moveCate)
);

CREATE OR REPLACE VIEW v_moveCate AS
SELECT idCate, nom
FROM moveCate
WHERE (idCate, dateMove) IN (
    SELECT idCate, MAX(dateMove) AS max_date
    FROM moveCate
    GROUP BY idCate
);

CREATE OR REPLACE VIEW v_categorie AS
SELECT * FROM v_cate 
UNION 
SELECT * FROM v_moveCate;


CREATE TABLE cueillette(
   idCueillette INT auto_increment,
   idCueilleur INT NOT NULL,
   idParcelle INT NOT NULL,
   quantite DECIMAL(15,2)   NOT NULL,
   dateCueillette DATETIME NOT NULL,
   PRIMARY KEY(idCueillette),
   FOREIGN KEY(idCueilleur) REFERENCES cueilleurs(idCueilleur),
   FOREIGN KEY(idParcelle) REFERENCES parcelle(idParcelle)
);
 CREATE TABLE removeCueillette(
   idRemove int PRIMARY KEY auto_increment,
   idCueillette int not null,
   dateRemove date not null,
   FOREIGN KEY(idCueillette) REFERENCES cueillette(idCueillette)
);
CREATE TABLE moveCueillette(
   idMove Int auto_increment,
   idCueillette INT ,
   idCueilleur INT NOT NULL,
   idParcelle INT NOT NULL,
   quantite DECIMAL(15,2)   NOT NULL,
   dateCueillette DATETIME NOT NULL,
   dateMove date not null,
   PRIMARY KEY(idMove),
   FOREIGN KEY(idCueillette) REFERENCES cueillette(idCueillette),
   FOREIGN KEY(idCueilleur) REFERENCES cueilleurs(idCueilleur),
   FOREIGN KEY(idParcelle) REFERENCES parcelle(idParcelle)
);
CREATE or replace view v_cueillette
   as (select * from cueillette where idCueillette 
      not in (select idCueillette from removeCueillette) and 
      idCueillette not in (select idCueillette from moveCueillette)
);

CREATE OR REPLACE VIEW v_moveCueillette AS
SELECT idCueillette,idCueilleur,idParcelle,quantite,dateCueillette
FROM moveCueillette
WHERE (idCueillette, dateMove) IN (
    SELECT idCueillette, MAX(dateMove) AS max_date
    FROM moveCueillette
    GROUP BY idCueillette
);

CREATE OR REPLACE VIEW v_cueillettes AS
SELECT * FROM v_cueillette
UNION 
SELECT * FROM v_moveCueillette;


CREATE TABLE cours(
   idcours INT auto_increment,
   quantite DECIMAL(10,2)   NOT NULL,
   prix DECIMAL(15,2)   NOT NULL,
   dateCours DATE NOT NULL,
   PRIMARY KEY(idcours)
);
CREATE TABLE removeCours(
   idRemove Int PRIMARY KEY auto_increment,
   idcours INT not null,
   dateRemove date not null,
   FOREIGN KEY(idcours) REFERENCES cours(idcours)
);
CREATE TABLE moveCours(
   idMove Int auto_increment,
   idcours INT not null,
   quantite DECIMAL(10,2)   NOT NULL,
   prix DECIMAL(15,2)   NOT NULL,
   dateCours DATE NOT NULL,
   dateMove date not null,
   PRIMARY KEY(idMove),
   FOREIGN KEY(idcours) REFERENCES cours(idcours)

);
CREATE or replace view v_cour
   as (select * from cours where idcours 
      not in (select idcours from removeCours) and 
      idcours not in (select idcours from moveCours)
);

CREATE OR REPLACE VIEW v_moveCours AS
SELECT idcours,quantite,prix,datecours
FROM moveCours
WHERE (idcours, dateMove) IN (
    SELECT idcours, MAX(dateMove) AS max_date
    FROM moveCours
    GROUP BY idcours
);

CREATE OR REPLACE VIEW v_cours AS
SELECT * FROM v_cour
UNION 
SELECT * FROM v_moveCours;

CREATE TABLE the(
   idThe INT auto_increment,
   nom VARCHAR(50)  NOT NULL,
   idVar INT NOT NULL,
   occupation DECIMAL(10,2)   NOT NULL,
   rendement DECIMAL(10,2)   NOT NULL,
   PRIMARY KEY(idThe),
   FOREIGN KEY(idVar) REFERENCES variete(idVar)
);
CREATE TABLE removeThe(
   idRemove int PRIMARY KEY auto_increment,
   idThe INT not null,
   dateRemove date not null,
   FOREIGN KEY(idThe) REFERENCES the(idThe)
);
CREATE TABLE moveThe(
   idMove Int auto_increment,
   idThe INT,
   nom VARCHAR(50)  NOT NULL,
   idVar INT NOT NULL,
   occupation DECIMAL(10,2) NOT NULL,
   rendement DECIMAL(10,2)  NOT NULL,
   dateMove date not null,
   PRIMARY KEY(idMove),
   FOREIGN KEY(idThe) REFERENCES the(idThe),
   FOREIGN KEY(idVar) REFERENCES variete(idVar)
);
CREATE or replace view v_T
   as (select * from the where idThe 
      not in (select idThe from removeThe) and 
      idThe not in (select idThe from moveThe)
);

CREATE OR REPLACE VIEW v_moveThe AS
SELECT idThe,nom,idVar,occupation,rendement
FROM moveThe
WHERE (idThe, dateMove) IN (
    SELECT idThe, MAX(dateMove) AS max_date
    FROM moveThe
    GROUP BY idThe
);

CREATE OR REPLACE VIEW v_The AS
SELECT * FROM v_T
UNION 
SELECT * FROM v_moveThe;

CREATE TABLE depense(
   idDep INT auto_increment,
   montant DECIMAL(15,2)   NOT NULL,
   dateDep DATE NOT NULL,
   idCate INT NOT NULL,
   PRIMARY KEY(idDep),
   FOREIGN KEY(idCate) REFERENCES categorie(idCate)
);
CREATE TABLE removeDepense(
   idRemove Int PRIMARY KEY auto_increment,
   idDep INT not null,
   dateRemove date not null,
   FOREIGN KEY(idDep) REFERENCES depense(idDep)

);
CREATE TABLE moveDepense(
   idMove Int auto_increment,
   idDep INT ,
   montant DECIMAL(15,2)   NOT NULL,
   dateDep DATE NOT NULL,
   idCate INT NOT NULL,
   dateMove date not null,
   PRIMARY KEY(idMove),
   FOREIGN KEY(idDep) REFERENCES depense(idDep),
   FOREIGN KEY(idCate) REFERENCES categorie(idCate)
);
CREATE or replace view v_dep
   as (select * from depense where idDep 
      not in (select idDep from removeDepense) and 
      idDep not in (select idDep from moveDepense)
);

CREATE OR REPLACE VIEW v_moveDep AS
SELECT idDep,montant,dateDep,idCate
FROM moveDepense
WHERE (idDep, dateMove) IN (
    SELECT idDep, MAX(dateMove) AS max_date
    FROM moveDepense
    GROUP BY idDep
);

CREATE OR REPLACE VIEW v_depense AS
SELECT * FROM v_dep
UNION 
SELECT * FROM v_moveDep;

DELIMITER $$

CREATE FUNCTION prix(quantity INT, dateCueillette DATETIME)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    DECLARE prix DECIMAL(10, 2);
    DECLARE q INT;
    SELECT prix, quantite INTO prix, q FROM v_cours WHERE dateCours < dateCueillette ORDER BY dateCours DESC LIMIT 1;
    SET total = (prix * quantity) / q;

    RETURN total;
END$$

DELIMITER ;



CREATE or replace view v_salaire 
   as (select idCueilleur,idParcelle,quantite,prix(quantite,dateCueillette) as prix ,dateCueillette
      from v_cueillette);

DELIMITER $$
CREATE FUNCTION total( dateDebut DATE, dateFin DATE)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT sum(quantite) INTO total FROM v_cueillette where dateCueillette BETWEEN dateDebut AND dateFin;
    RETURN total;
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION depenseTotal( dateDebut DATE, dateFin DATE)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT sum(montant) INTO total FROM v_cueillette where dateCueillette BETWEEN dateDebut AND dateFin;
    RETURN total;
END$$

DELIMITER ;


CREATE or replace view v_rendParcelle
   as (select idParcelle,((surface*10000*rendement)/(occupation*1.8)) as rendement 
      from v_parcelle join v_the on v_parcelle.idVar=v_the.idVar);

DELIMITER $$
CREATE FUNCTION reste(id INT,dateDebut DATE, dateFin DATE)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total DECIMAL(10, 2);
    DECLARE reste DECIMAL(10, 2);
    DECLARE monthdiff INT;
    DECLARE rend DECIMAL(10,2);
    SELECT TIMESTAMPDIFF(MONTH, dateDebut, dateFin) AS month_difference INTO monthdiff from v_cueillette;
    SELECT rendement INTO rend FROM v_rendParcelle where idParcelle=id;
    SELECT sum(quantite) INTO total FROM v_cueillette where idParcelle=id and dateCueillette BETWEEN dateDebut AND dateFin ;
    return reste=(rend*monthdiff)-total;
END$$

DELIMITER ;
