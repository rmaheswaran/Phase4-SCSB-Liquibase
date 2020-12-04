--liquibase formatted sql


use recap;

--changeset Moses:1

INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('RECAP', 'RECAP_LAS', '', 'Y', 'Script', NOW(), 'Script', NOW());
INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('HD', 'HARVARD_LAS', '', 'Y', 'Script', NOW(), 'Script', NOW());
