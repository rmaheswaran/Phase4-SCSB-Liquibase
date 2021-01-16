--liquibase formatted sql

use recap;

--changeset Moses:1

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE item_t ADD  ims_location_id  INT Not Null , ADD COLUMN `LEGACY_OWNING_INST_ITEM_ID` VARCHAR(45) DEFAULT 1 COLLATE utf8mb4_unicode_ci,
ADD FOREIGN KEY (ims_location_id) REFERENCES ims_location_t(ims_location_id);

SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE Institution_t ADD  ils_protocol varchar(10) Not Null;


--changeset Moses:2

UPDATE ITEM_T SET IMS_LOCATION_ID = 1;

--changeset Rajesh:3
ALTER TABLE `generic_patron_t` DROP FOREIGN KEY `generic_patron_t_ibfk_1`;
ALTER TABLE `generic_patron_t` DROP INDEX `requesting_inst_id` ;
ALTER TABLE `generic_patron_t` ADD FOREIGN KEY (requesting_inst_id) REFERENCES institution_t (institution_id);

--changeset Suresh:4
ALTER TABLE BIBLIOGRAPHIC_T DROP  PRIMARY KEY;
ALTER TABLE BIBLIOGRAPHIC_T ADD COLUMN `LEGACY_OWNING_INST_BIB_ID` varchar(45) COLLATE utf8mb4_unicode_ci;
ALTER TABLE BIBLIOGRAPHIC_T ADD CONSTRAINT BIBLIOGRAPHIC_UK UNIQUE KEY (`OWNING_INST_ID`,`OWNING_INST_BIB_ID`);
ALTER TABLE BIBLIOGRAPHIC_T ADD CONSTRAINT BIBLIOGRAPHIC_PK PRIMARY KEY (`BIBLIOGRAPHIC_ID`);

ALTER TABLE HOLDINGS_T DROP  PRIMARY KEY;
ALTER TABLE HOLDINGS_T ADD COLUMN `LEGACY_OWNING_INST_HOLDINGS_ID` varchar(100) COLLATE utf8mb4_unicode_ci;
ALTER TABLE HOLDINGS_T ADD CONSTRAINT HOLDINGS_UK UNIQUE KEY (`OWNING_INST_ID`,`OWNING_INST_HOLDINGS_ID`);
ALTER TABLE HOLDINGS_T ADD CONSTRAINT HOLDINGS_PK PRIMARY KEY (`HOLDINGS_ID`);


ALTER TABLE ITEM_T DROP  PRIMARY KEY;
ALTER TABLE ITEM_T ADD CONSTRAINT ITEM_UK UNIQUE KEY (`OWNING_INST_ID`,`OWNING_INST_ITEM_ID`);
ALTER TABLE ITEM_T ADD CONSTRAINT ITEM_PK PRIMARY KEY (`ITEM_ID`);

UPDATE BIBLIOGRAPHIC_T  SET LEGACY_OWNING_INST_BIB_ID = OWNING_INST_BIB_ID;

UPDATE HOLDINGS_T  SET LEGACY_OWNING_INST_HOLDINGS_ID = OWNING_INST_HOLDINGS_ID;

UPDATE ITEM_T  SET LEGACY_OWNING_INST_ITEM_ID = OWNING_INST_ITEM_ID;

