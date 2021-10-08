DROP DATABASE IF EXISTS ZeroFaute;
CREATE DATABASE ZeroFaute DEFAULT CHARACTER SET utf8;
USE ZeroFaute;

-- 
-- Table Modeles
--

CREATE TABLE Modeles(
   idModele INT AUTO_INCREMENT PRIMARY KEY,
   codeModele INT,
   nomModele VARCHAR(50) ,
   dateMiseMarche DATE
)ENGINE=InnoDB;

-- 
-- Table Categories
--

CREATE TABLE Categories(
   idCategorie INT AUTO_INCREMENT PRIMARY KEY,
   nomCategorie VARCHAR(50) ,
   descriptionCategorie VARCHAR(100)
)ENGINE=InnoDB;

-- 
-- Table SousCategories
--

CREATE TABLE SousCategories(
   idSousCategorie INT AUTO_INCREMENT PRIMARY KEY,
   nomSousCategorie VARCHAR(50) ,
   descriptionSousCategorie VARCHAR(100) ,
   idCategorie INT NOT NULL
)ENGINE=InnoDB;

-- 
-- Table Produits
--

CREATE TABLE Produits(
   idProduit INT AUTO_INCREMENT PRIMARY KEY,
   numSerie INT,
   numProduit INT,
   anneeProduction INT,
   idCategorie INT NOT NULL,
   idModele INT NOT NULL
)ENGINE=InnoDB;

-- 
-- Table Fautes
--

CREATE TABLE Fautes(
   idFaute INT AUTO_INCREMENT PRIMARY KEY,
   codeFaute INT,
   dateReparation DATE,
   titreFaute VARCHAR(50) ,
   dateDetection DATE,
   commentaire VARCHAR(100) ,
   idSousCategorie INT NOT NULL
)ENGINE=InnoDB;

ALTER TABLE SousCategories ADD CONSTRAINT FK_SousCategories_Categories FOREIGN KEY(idCategorie) REFERENCES Categories(idCategorie);
ALTER TABLE Produits
ADD CONSTRAINT FK_Produits_Categories FOREIGN KEY(idCategorie) REFERENCES Categories(idCategorie),
ADD CONSTRAINT FK_Produits_Modeles FOREIGN KEY(idModele) REFERENCES Modeles(idModele);
ALTER TABLE Fautes ADD CONSTRAINT FK_Fautes_SousCategories FOREIGN KEY(idSousCategorie) REFERENCES SousCategories(idSousCategorie);