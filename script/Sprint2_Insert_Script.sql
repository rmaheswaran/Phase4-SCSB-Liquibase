--liquibase formatted sql


use recap;

--changeset Moses:1
INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('RECAP', 'RECAP_LAS', '', 'Y', 'Script', NOW(), 'Script', NOW());
INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('HD', 'HARVARD_LAS', '', 'Y', 'Script', NOW(), 'Script', NOW());
        
--changeset Rajesh:2   
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('1', '1', '1', '198572131', '', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('2', '2', '1', '198572132', '198572368', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('3', '3', '1', '198572133', '198572369', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('4', '2', '2', 'RECAPCUL01', '', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('5', '1', '2', 'RECAPPUL02', 'RECAPPUL01', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('6', '3', '2', 'RECAPNYPL2', 'RECAPNYPL1', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('7', '3', '3', '23333090796036', '', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('8', '1', '3', '23333090796010', '70620957062095', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');
INSERT INTO `generic_patron_t` (`generic_patron_id`, `requesting_inst_id`, `item_own_inst_id`, `edd_generic_patron`, `retrieval_generic_partron`, `created_by`, `created_date`, `updated_by`, `updated_date`) VALUES ('9', '2', '3', '23333090796028', '70620917062091', 'Script', '2020-09-25 00:00:00', 'Script', '2020-09-25 00:00:00');

--changeset Hari:3
INSERT INTO `job_param_data_t` (`PARAM_NAME`, `PARAM_VALUE`, `RECORD_NUM`) VALUES ('imsDepositoryCodes', 'RECAP', '2');
INSERT INTO `job_param_data_t` (`PARAM_NAME`, `PARAM_VALUE`, `RECORD_NUM`) VALUES ('imsDepositoryCodes', 'RECAP', '3');
INSERT INTO `job_param_data_t` (`PARAM_NAME`, `PARAM_VALUE`, `RECORD_NUM`) VALUES ('imsDepositoryCodes', 'RECAP', '4'); 

--changeset Suresh:4


INSERT INTO BIBLIOGRAPHIC_HOLDINGS_T
    (SELECT @ROWNUM := @ROWNUM + 1, B.BIBLIOGRAPHIC_ID  , H.HOLDINGS_ID
FROM BIBLIOGRAPHIC_T B, HOLDINGS_T H, BIBLIOGRAPHIC_HOLDINGS_HISTORY_T  BH , (SELECT @ROWNUM := 0) R
 WHERE B.OWNING_INST_ID = BH.BIB_INST_ID AND B.OWNING_INST_BIB_ID = BH.OWNING_INST_BIB_ID
AND H.OWNING_INST_ID = BH.HOLDINGS_INST_ID AND H.OWNING_INST_HOLDINGS_ID = BH.OWNING_INST_HOLDINGS_ID);


INSERT INTO BIBLIOGRAPHIC_ITEM_T
    (SELECT @ROWNUM := @ROWNUM + 1, B.BIBLIOGRAPHIC_ID  , I.ITEM_ID
FROM BIBLIOGRAPHIC_T B, ITEM_T I, BIBLIOGRAPHIC_ITEM_HISTORY_T  BI , (SELECT @ROWNUM := 0) R
 WHERE B.OWNING_INST_ID = BI.BIB_INST_ID AND B.OWNING_INST_BIB_ID = BI.OWNING_INST_BIB_ID
AND I.OWNING_INST_ID = BI.ITEM_INST_ID AND I.OWNING_INST_ITEM_ID = BI.OWNING_INST_ITEM_ID);

INSERT INTO ITEM_HOLDINGS_T
    (SELECT @ROWNUM := @ROWNUM + 1,  H.HOLDINGS_ID, I.ITEM_ID
FROM ITEM_T I, HOLDINGS_T H, ITEM_HOLDINGS_HISTORY_T  IH , (SELECT @ROWNUM := 0) R
 WHERE I.OWNING_INST_ID = IH.ITEM_INST_ID AND I.OWNING_INST_ITEM_ID = IH.OWNING_INST_ITEM_ID
AND H.OWNING_INST_ID = IH.HOLDINGS_INST_ID AND H.OWNING_INST_HOLDINGS_ID = IH.OWNING_INST_HOLDINGS_ID);

--changeset Suresh:5

INSERT INTO `ims_location_t`(`ims_location_code`,`ims_location_name`,`description`,`active`,`created_by`,`created_date`,`updated_by`,`updated_date`)
VALUES ('UN', 'UNKNOWN', '', 'Y', 'Script', NOW(), 'Script', NOW());
