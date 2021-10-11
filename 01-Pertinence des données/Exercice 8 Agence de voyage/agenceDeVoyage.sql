DROP DATABASE IF EXISTS AgenceVoyage;
CREATE DATABASE IF NOT EXISTS AgenceVoyage DEFAULT CHARACTER SET utf8;
USE AgenceVoyage;

-- 
-- Table Clients
--

CREATE TABLE Clients(
   idClient INT AUTO_INCREMENT PRIMARY KEY,
   numClient INT,
   nomClient VARCHAR(50) ,
   prenomClient VARCHAR(50)
)ENGINE=InnoDB;

-- 
-- Table Hotels
--

CREATE TABLE Hotels(
   idHotel INT AUTO_INCREMENT PRIMARY KEY,
   nomHotel VARCHAR(50)
)ENGINE=InnoDB;

-- 
-- Table Location
--

CREATE TABLE Location(
   idLocation INT AUTO_INCREMENT PRIMARY KEY,
   libelleLocation VARCHAR(50)
)ENGINE=InnoDB;

-- 
-- Table Gite
--

CREATE TABLE Gite(
   idGite INT AUTO_INCREMENT PRIMARY KEY,
   nomGite VARCHAR(50)
)ENGINE=InnoDB;

-- 
-- Table Prestations
--

CREATE TABLE Prestations(
   idPrestation INT AUTO_INCREMENT PRIMARY KEY,
   codePrestation INT,
   intitule VARCHAR(50) ,
   description VARCHAR(100) ,
   lieu VARCHAR(100) ,
   niveauPrestation INT,
   PrixPublic DECIMAL(15,2)  ,
   photo VARCHAR(50) ,
   idGite INT,
   idLocation INT NOT NULL,
   idHotel INT
)ENGINE=InnoDB;

-- 
-- Table Achete
--

CREATE TABLE Achete(
   idAchete INT AUTO_INCREMENT PRIMARY KEY, 	
   idPrestation INT,
   idClient INT,
   prix DECIMAL(15,2)
)ENGINE=InnoDB;


ALTER TABLE Prestations
ADD CONSTRAINT FK_Prestations_Gite FOREIGN KEY(idGite) REFERENCES Gite(idGite),
ADD CONSTRAINT FK_Prestations_Location FOREIGN KEY(idLocation) REFERENCES Location(idLocation),
ADD CONSTRAINT FK_Prestations_Hotels FOREIGN KEY(idHotel) REFERENCES Hotels(idHotel);
ALTER TABLE Achete 
ADD CONSTRAINT FK_Achete_Prestations FOREIGN KEY(idPrestation) REFERENCES Prestations(idPrestation),
ADD CONSTRAINT FK_Achete_Clients FOREIGN KEY(idClient) REFERENCES Clients(idClient);
   