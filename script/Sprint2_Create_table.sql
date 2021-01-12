--liquibase formatted sql
--changeset Moses:1

use recap;

CREATE TABLE IF NOT EXISTS ims_location_t (

ims_location_id INT NOT NULL AUTO_INCREMENT,

ims_location_code varchar(45) NOT NULL UNIQUE,

ims_location_name varchar(255) NOT NULL, 

description  varchar(255) ,

active char(1)  NOT NULL,

created_by varchar(255) NOT NULL,

created_date timestamp NOT NULL ,

updated_by  varchar(255) NOT NULL ,

updated_date timestamp NOT NULL,

PRIMARY KEY ( ims_location_id )

);

CREATE TABLE IF NOT EXISTS scsb_properties_t (

scsb_properties_id INT NOT NULL AUTO_INCREMENT,

p_key varchar (255) NOT NULL ,

p_value varchar(1500) NOT NULL  ,

description  varchar(255) ,

institution_code  varchar(50) ,

ims_location_code varchar(50) ,

active char(1)  NOT NULL,

created_date timestamp NOT NULL ,

updated_date timestamp ,

created_by  varchar(255) NOT NULL,

updated_by  varchar(255) ,

PRIMARY KEY ( scsb_properties_id )

);

CREATE TABLE IF NOT EXISTS Institution_ims_location_t (

Institution_ims_location_id   INT NOT NULL AUTO_INCREMENT,

institution_id  INT  NOT NULL UNIQUE,

ims_location_id INT NOT NULL, 

active char(1)  NOT NULL,

created_by varchar(255) NOT NULL,

created_date timestamp NOT NULL ,

updated_by  varchar(255) NOT NULL ,

updated_date timestamp NOT NULL,

PRIMARY KEY ( Institution_ims_location_id ),
FOREIGN KEY (institution_id) REFERENCES institution_t (institution_id),
FOREIGN KEY (ims_location_id) REFERENCES ims_location_t (ims_location_id)

);

CREATE TABLE IF NOT EXISTS generic_patron_t (

generic_patron_id   INT NOT NULL AUTO_INCREMENT,

requesting_inst_id  INT  NOT NULL UNIQUE,

item_own_inst_id INT NOT NULL, 

edd_generic_patron varchar(20) ,

retrieval_generic_partron varchar(20),

created_by varchar(255) NOT NULL,

created_date timestamp NOT NULL ,

updated_by  varchar(255) NOT NULL ,

updated_date timestamp NOT NULL,

PRIMARY KEY ( generic_patron_id ),
FOREIGN KEY (requesting_inst_id) REFERENCES institution_t (institution_id),
FOREIGN KEY (item_own_inst_id) REFERENCES institution_t (institution_id)

);


--changeset Suresh:2

RENAME TABLE BIBLIOGRAPHIC_HOLDINGS_T TO BIBLIOGRAPHIC_HOLDINGS_HISTORY_T;
RENAME TABLE BIBLIOGRAPHIC_ITEM_T TO BIBLIOGRAPHIC_ITEM_HISTORY_T;
RENAME TABLE ITEM_HOLDINGS_T TO ITEM_HOLDINGS_HISTORY_T;

ALTER TABLE `BIBLIOGRAPHIC_HOLDINGS_HISTORY_T`
DROP FOREIGN KEY `OWNING_INST_ID_OWNING_INST_BIB_ID_FK`,
DROP FOREIGN KEY `OWNING_INST_HOLDINGS_ID_FK`;
ALTER TABLE `BIBLIOGRAPHIC_HOLDINGS_HISTORY_T`
DROP INDEX `OWNING_INST_ID_OWNING_INST_BIB_ID_FK` ,
DROP INDEX `OWNING_INST_HOLDINGS_ID_FK` ;

ALTER TABLE `BIBLIOGRAPHIC_ITEM_HISTORY_T`
DROP FOREIGN KEY `ITEM_INST_ID_OWNING_INST_ITEM_ID_FK`,
DROP FOREIGN KEY `BIB_INST_ID_OWNING_INST_BIB_ID_FK`;
ALTER TABLE `BIBLIOGRAPHIC_ITEM_HISTORY_T`
DROP INDEX `ITEM_INST_ID_OWNING_INST_ITEM_ID_FK` ,
DROP INDEX `BIB_INST_ID_OWNING_INST_BIB_ID_FK` ;

ALTER TABLE `ITEM_HOLDINGS_HISTORY_T`
DROP FOREIGN KEY `OWNING_INST_ITEM_ID_ITEM_INST_ID_FK`,
DROP FOREIGN KEY `HOLDINGS_INST_ID_OWNING_INST_HOLDINGS_ID_FK`;
ALTER TABLE `ITEM_HOLDINGS_HISTORY_T`
DROP INDEX `OWNING_INST_ITEM_ID_ITEM_INST_ID_FK` ,
DROP INDEX `HOLDINGS_INST_ID_OWNING_INST_HOLDINGS_ID_FK` ;


CREATE TABLE IF NOT EXISTS `BIBLIOGRAPHIC_HOLDINGS_T` (
  `BIBLIOGRAPHIC_HOLDINGS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `BIBLIOGRAPHIC_ID` INT(11) NOT NULL,
  `HOLDINGS_ID` INT(11) NOT NULL,
  PRIMARY KEY (`BIBLIOGRAPHIC_HOLDINGS_ID`),
  UNIQUE KEY `BIBLIOGRAPHIC_HOLDINGS_UK` (`BIBLIOGRAPHIC_ID`,`HOLDINGS_ID`),
  KEY `BIBLIOGRAPHIC_HOLDINGS_ID` (`BIBLIOGRAPHIC_HOLDINGS_ID`),
  KEY `BIBLIOGRAPHIC_ID` (`BIBLIOGRAPHIC_ID`),
  KEY `HOLDINGS_ID` (`HOLDINGS_ID`),
  CONSTRAINT `BIBLIOGRAPHIC_ID_FK` FOREIGN KEY (`BIBLIOGRAPHIC_ID`) REFERENCES `BIBLIOGRAPHIC_t` (`BIBLIOGRAPHIC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `HOLDINGS_ID_FK` FOREIGN KEY (`HOLDINGS_ID`) REFERENCES `HOLDINGS_t` (`HOLDINGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `ITEM_HOLDINGS_T` (
  `ITEM_HOLDINGS_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `HOLDINGS_ID` INT(11) NOT NULL,
  `ITEM_ID` INT(11) NOT NULL,
  PRIMARY KEY (`ITEM_HOLDINGS_ID`),
  UNIQUE KEY `ITEM_HOLDINGS_UK` (`HOLDINGS_ID`, `ITEM_ID`),
  KEY `ITEM_HOLDINGS_ID` (`ITEM_HOLDINGS_ID`),
  KEY `ITEM_ID` (`ITEM_ID`),
  KEY `HOLDINGS_ID_1` (`HOLDINGS_ID`),
  CONSTRAINT `ITEM_ID_FK` FOREIGN KEY (`ITEM_ID`) REFERENCES `ITEM_T` (`ITEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `HOLDINGS_ID_FK1` FOREIGN KEY (`HOLDINGS_ID`) REFERENCES `HOLDINGS_T` (`HOLDINGS_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE IF NOT EXISTS `BIBLIOGRAPHIC_ITEM_T` (
  `BIBLIOGRAPHIC_ITEM_ID` INT(11) NOT NULL AUTO_INCREMENT,
  `BIBLIOGRAPHIC_ID` INT(11) NOT NULL,
  `ITEM_ID` INT(11) NOT NULL,
  PRIMARY KEY (`BIBLIOGRAPHIC_ITEM_ID`),
  UNIQUE KEY `BIBLIOGRAPHIC_ITEM_UK` (`BIBLIOGRAPHIC_ID`,`ITEM_ID`),
  KEY `BIBLIOGRAPHIC_ITEM_ID` (`BIBLIOGRAPHIC_ITEM_ID`),
  KEY `BIBLIOGRAPHIC_ID1` (`BIBLIOGRAPHIC_ID`),
  KEY `ITEM_ID1` (`ITEM_ID`),
  CONSTRAINT `BIBLIOGRAPHIC_ID_FK1` FOREIGN KEY (`BIBLIOGRAPHIC_ID`) REFERENCES `BIBLIOGRAPHIC_T` (`BIBLIOGRAPHIC_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ITEM_ID_FK1` FOREIGN KEY (`ITEM_ID`) REFERENCES `ITEM_T` (`ITEM_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
