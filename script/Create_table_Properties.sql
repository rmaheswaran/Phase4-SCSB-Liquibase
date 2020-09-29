CREATE TABLE IF NOT EXISTS recap.ims_location_t (

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
