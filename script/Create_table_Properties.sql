 

CREATE TABLE IF NOT EXISTS scsb_properties_t (

properties_id INT NOT NULL AUTO_INCREMENT,

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

PRIMARY KEY ( properties_id )

);

