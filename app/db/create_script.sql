-- Step: 01
-- Goal: Create a new database rijschool-mvc
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad              New
-- **********************************************************************************/

-- Check if the database exists
DROP DATABASE IF EXISTS `rijschool-examen`;

-- Create a new Database
CREATE DATABASE IF NOT EXISTS `rijschool-examen`;

-- Use database rijschool-examen
Use `rijschool-examen`;

-- Step: 02
-- Goal: Create a new table LesPakket
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad               New
-- **********************************************************************************/

-- Drop table Examen
DROP TABLE IF EXISTS LesPakket;

CREATE TABLE IF NOT EXISTS LesPakket
(
    Id                          TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,PakketNaam                   VARCHAR(200)                         NOT NULL
   ,AantalLessen                   INT(50)                     NOT NULL
   ,Rijbewijscategorie          VARCHAR(10)                     NOT NULL
   ,Prijs                        INT(50)                     NOT NULL
   ,IsActief        BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen     VARCHAR(250)                        NULL    DEFAULT NULL
   ,DatumAangemaakt DateTime(6)                     NOT NULL
   ,DatumGewijzigd  DateTime(6)                     NOT NULL

   ,CONSTRAINT      PK_LesPakkte_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 03
-- Goal: Fill table LesPakket with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad               New
-- **********************************************************************************/

INSERT INTO LesPakket
(
    PakketNaam 
    ,AantalLessen
    ,Rijbewijscategorie 
    ,Prijs
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     ('Personenayto', 40, 'B',2700, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Vrachtwagen Subliem', 60, 'C',5400, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bus Extraordinaire', 80, 'D',7300, 1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Bromfiets Deluxe', 10, 'AM', 230, 1, NULL, SYSDATE(6), SYSDATE(6));

-- Step: 04
-- Goal: Create a new table LeerlingPerPakket
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad               New
-- **********************************************************************************/

-- Drop table LeerlingPerPakket
DROP TABLE IF EXISTS LeerlingPerPakket;

CREATE TABLE IF NOT EXISTS LeerlingPerPakket
(
    Id                      TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,LesPakkteId               int(50)                         NOT NULL
   ,LeerlingId                      int(50)                         NOT NULL
   ,StartDatumRijlessen             DATE                     NOT NULL
   ,DatumRijBijsBehaald                DATE                      NULL
   ,IsActief                BIT                             NOT NULL    DEFAULT 1
   ,Opmerkingen             VARCHAR(250)                    NULL        DEFAULT NULL
   ,DatumAangemaakt         DateTime(6)                     NOT NULL
   ,DatumGewijzigd          DateTime(6)                     NOT NULL


  ,CONSTRAINT      FK_LesPakkteId_LesPakkte_Id   FOREIGN KEY (LesPakkteId) REFERENCES LesPakkte(Id)
   ,CONSTRAINT      FK_LeerlingId_Leerling_Id   FOREIGN KEY (LeerlingId) REFERENCES Leerling(Id)
   ,CONSTRAINT              PK_LeerlingPerPakket_Id      PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 05
-- Goal: Fill table LeerlingPerPakket with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad               New
-- **********************************************************************************/

INSERT INTO LeerlingPerPakket
(
     LesPakkteId
    ,LeerlingId
    ,StartDatumRijlessen
    ,DatumRijBijsBehaald
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
)
VALUES
     (1,5,'2023-05-23',NULL,1, NULL, SYSDATE(6), SYSDATE(6))
    , (4,1,'2022-06-03','2022-08-05',1, NULL, SYSDATE(6), SYSDATE(6))
    , (1,1,'2023-06-02',NULL,1, NULL, SYSDATE(6), SYSDATE(6))
    , (3,4,'2023-01-01',NULL,1, NULL, SYSDATE(6), SYSDATE(6))
    , (1,2,'2022-11-30','2023-05-23',1, NULL, SYSDATE(6), SYSDATE(6))
    , (2,3,'2022-06-06','2023-06-06',1, NULL, SYSDATE(6), SYSDATE(6));


-- Step: 06
-- Goal: Create a new table Leerling
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad               New
-- **********************************************************************************/

-- Drop table Leerling
DROP TABLE IF EXISTS Leerling;

CREATE TABLE IF NOT EXISTS Leerling
(
    Id                      TINYINT         UNSIGNED        NOT NULL    AUTO_INCREMENT
   ,Voornaam                VARCHAR(30)                     NOT NULL
   ,TussenVoegsel           VARCHAR(5)                      
   ,Achternaam              VARCHAR(50)                     NOT NULL
   ,Mobiel                  VARCHAR(20)                     NOT NULL
    ,IsActief                BIT                            NOT NULL           DEFAULT 1
    ,Opmerkingen             VARCHAR(250)                       NULL           DEFAULT NULL
    ,DatumAangemaakt         DateTime(6)                    NOT NULL
    ,DatumGewijzigd          DateTime(6)                    NOT NULL

 
   ,CONSTRAINT      PK_Leerling_Id   PRIMARY KEY CLUSTERED(Id)
) ENGINE=InnoDB;


-- Step: 07
-- Goal: Fill table Leerling with data
-- **********************************************************************************
-- Version       Date:           Author:                     Description:
-- *******       **********      ****************            ******************
-- 01            06-02-2023      Osama Awad               New
-- **********************************************************************************/



INSERT INTO Leerling ( 
       Voornaam
    ,TussenVoegsel
    ,Achternaam
    ,Mobiel
    ,IsActief
    ,Opmerkingen
    ,DatumAangemaakt
    ,DatumGewijzigd
) VALUES 
     ('Bas', 'De',"Bakker" , "06-28493827",1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Terence', '',"Draaijer" , "06-28493827",1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Samuel', '',"Werchter" , "06-28493827",1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Sharida', '',"Tetehuka" , "06-28493827",1, NULL, SYSDATE(6), SYSDATE(6))
    ,('Fatma', '',"Yilmaz" , "06-28493827",1, NULL, SYSDATE(6), SYSDATE(6)) ;


