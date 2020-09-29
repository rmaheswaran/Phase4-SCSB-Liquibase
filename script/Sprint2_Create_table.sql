--liquibase formatted sql
--changeset Moses:1

use recap;

CREATE TABLE IF NOT EXISTS ims_location_t (

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

CREATE TABLE IF NOT EXISTS scsb_properties_t (

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

CREATE TABLE IF NOT EXISTS Institution_ims_location_t (

Institution_ims_location_id   INT NOT NULL AUTO_INCREMENT,

institution_id  INT  NOT NULL UNIQUE,

ims_location_id INT NOT NULL, 

active char(1)  NOT NULL,

created_by varchar(255) NOT NULL,

created_date timestamp NOT NULL ,

updated_by  varchar(255) NOT NULL ,

updated_date timestamp NOT NULL,

PRIMARY KEY ( Institution_ims_location_id ),
FOREIGN KEY (institution_id) REFERENCES institution_t (institution_id),
FOREIGN KEY (ims_location_id) REFERENCES ims_location_t (ims_location_id)

);

CREATE TABLE IF NOT EXISTS generic_patron_t (

generic_patron_id   INT NOT NULL AUTO_INCREMENT,

requesting_inst_id  INT  NOT NULL UNIQUE,

item_own_inst_id INT NOT NULL, 

edd_generic_patron varchar(20) ,

retrieval_generic_partron varchar(20),

created_by varchar(255) NOT NULL,

created_date timestamp NOT NULL ,

updated_by  varchar(255) NOT NULL ,

updated_date timestamp NOT NULL,

PRIMARY KEY ( generic_patron_id ),
FOREIGN KEY (requesting_inst_id) REFERENCES institution_t (institution_id),
FOREIGN KEY (item_own_inst_id) REFERENCES institution_t (institution_id)

);
