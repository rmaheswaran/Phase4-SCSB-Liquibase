--liquibase formatted sql
--changeset Moses:3

use recap;

INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('RECAP', 'RECAP_LAS', '', 'Y', 'Script', NOW(), 'Script', NOW());
INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('HD', 'HARVARD_LAS', '', 'Y', 'Script', NOW(), 'Script', NOW());

UPDATE ITEM_T SET IMS_LOCATION_ID = 1;
