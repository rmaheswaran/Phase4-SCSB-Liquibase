--liquibase formatted sql

use recap;

--changeset Moses:1

SET FOREIGN_KEY_CHECKS=0;

ALTER TABLE item_t ADD  ims_location_id  INT Not Null ,
ADD FOREIGN KEY (ims_location_id) REFERENCES ims_location_t(ims_location_id);

SET FOREIGN_KEY_CHECKS=1;

ALTER TABLE Institution_t ADD  ils_protocol varchar(10) Not Null;


--changeset Moses:2

UPDATE ITEM_T SET IMS_LOCATION_ID = 1;

--changeset Rajesh:3
ALTER TABLE `generic_patron_t` DROP FOREIGN KEY `generic_patron_t_ibfk_1`;
ALTER TABLE `generic_patron_t` DROP INDEX `requesting_inst_id` ;
ALTER TABLE `generic_patron_t` ADD FOREIGN KEY (requesting_inst_id) REFERENCES institution_t (institution_id);

