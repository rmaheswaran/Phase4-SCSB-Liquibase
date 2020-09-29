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

CREATE TABLE IF NOT EXISTS recap.scsb_properties_t (

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

