��          t               �      �      �   _   �      E  ?   I  &   �  �  �  a   T     �  3   �  �  	     �     �  _   �       >     &   R  �  y  a   &     �  3   �   ); Appo Database Design The APPO database uses an open source PostgreSQL database, and the recommended version is 12.3. ``` ``` - appotenant: Store tenant information, such as tenant. ``` app_instance_id  varchar(64) not null, app_package_id varchar(64) not null, app_id varchar(64) not null, tenant varchar(64) not null, app_name varchar(128) not null, app_descriptor varchar(256) not null, mec_host varchar(15) not null, applcm_host varchar(15), operational_status varchar(128) not null, operation_info varchar(256), create_time timestamp default current_timestamp, update_time timestamp default current_timestamp, primary key (app_instance_id) appinstanceinfo: Store app instance information, such as app_instance_id, applcm_host and tenant. create table appinstanceinfo ( tenant  varchar(255) not null, primary key (tenant) Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-04-12 10:35+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 ); Appo Database Design The APPO database uses an open source PostgreSQL database, and the recommended version is 12.3. ` ` ` ` ` ` - apply: Store tenant information, such as tenant. ` ` ` app_instance_id varchar (64) not null, app_package_id varchar (64) not null, app_id varchar (64) not null, tenant varchar (64) not null, app_name varchar (128) not null, app_descriptor varchar (256) not null, mec_host varchar (15) not null, applcm_host varchar (15), operational_status varchar (128) not null, operation_info varchar (256), create_time timestamp default current_timestamp, update_time timestamp default current_timestamp, primary key (app_instance_id) appinstanceinfo: Store app instance information, such as app_instance_id, applcm_host and tenant. create table appinstanceinfo ( tenant varchar (255) not null, primary key (tenant) 