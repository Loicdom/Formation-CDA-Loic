DROP DATABASE IF EXISTS CuisineItalienne;
CREATE DATABASE IF NOT EXISTS CuisineItalienne DEFAULT CHARACTER SET utf8;
USE CuisineItalienne;

-- 
-- Table Tickets
--

CREATE TABLE Tickets(
   idTicket INT AUTO_INCREMENT PRIMARY KEY,
   numTicket INT,
   nombreCouvert INT,
   montantAddition DOUBLE,
   dateTicket DATE
)ENGINE=InnoDB;

-- 
-- Table Met
--

CREATE TABLE Met(
   idmet INT AUTO_INCREMENT PRIMARY KEY,
   nomMet VARCHAR(50) ,
   prix DOUBLE
)ENGINE=InnoDB;

-- 
-- Table Tables
--

CREATE TABLE Tables(
   idTable INT AUTO_INCREMENT PRIMARY KEY,
   numTable INT,
   capaciteMax INT,
   type VARCHAR(50) ,
   supplement DOUBLE,
   idTicket INT NOT NULL
)ENGINE=InnoDB;

-- 
-- Table Clients
--

CREATE TABLE Clients(
   Idclient INT AUTO_INCREMENT PRIMARY KEY,
   nomClient VARCHAR(50) ,
   prenomCLient VARCHAR(50) ,
   dateNaissance DATE,
   adresseMail VARCHAR(100) ,
   NumTel VARCHAR(50) ,
   idTicket INT NOT NULL
)ENGINE=InnoDB;

-- 
-- Table compose
--

CREATE TABLE Compose(
   idCompose INT AUTO_INCREMENT PRIMARY KEY,	
   idTicket INT NOT NULL,
   idmet INT NOT NULL
)ENGINE=InnoDB;

ALTER TABLE Tables ADD CONSTRAINT FK_Tables_Tickets FOREIGN KEY(idTicket) REFERENCES Tickets(idTicket);
ALTER TABLE Clients ADD CONSTRAINT FK_Clients_Tickets FOREIGN KEY(idTicket) REFERENCES Tickets(idTicket);
ALTER TABLE Compose
ADD CONSTRAINT FK_Compose_Tickets FOREIGN KEY(idTicket) REFERENCES Tickets(idTicket),
ADD CONSTRAINT FK_Compose_Met FOREIGN KEY(idmet) REFERENCES Met(idmet);