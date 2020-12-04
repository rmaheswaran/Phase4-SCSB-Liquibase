--liquibase formatted sql
--changeset Moses:3

use recap;

INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('RECAP_TEST', 'RECAP_LAS_TEST', '', 'Y', 'Script', NOW(), 'Script', NOW());

--changeset Moses:4

INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('HD_TEST', 'HARVARD_LAS_TEST', '', 'Y', 'Script', NOW(), 'Script', NOW());
