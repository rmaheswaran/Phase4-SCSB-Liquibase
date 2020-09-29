--liquibase formatted sql
--changeset Moses:2

ALTER TABLE item_t ADD  ims_location_id  INT Not Null ,
ADD FOREIGN KEY (ims_location_id) REFERENCES ims_location_t(ims_location_id);


ALTER TABLE Institution_t ADD  ils_protocol varchar(10) Not Null;

