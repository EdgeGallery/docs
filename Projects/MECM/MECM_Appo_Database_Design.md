Appo Database Design
===============
The APPO database uses an open source PostgreSQL database, and the recommended version is 12.3.
                                    
- appinstanceinfo: Store app instance information, such as app_instance_id, applcm_host and tenant.
```
    create table appinstanceinfo (
       app_instance_id  varchar(64) not null,
        app_package_id varchar(64) not null,
        app_id varchar(64) not null,
        tenant varchar(64) not null,
        app_name varchar(128) not null,
        app_descriptor varchar(256) not null,
        mec_host varchar(15) not null,
        applcm_host varchar(15),
        operational_status varchar(128) not null,
        operation_info varchar(256),
        create_time timestamp default current_timestamp,
        update_time timestamp default current_timestamp,
        primary key (app_instance_id)
    );
```
- appotenant: Store tenant information, such as tenant.
```
    create table appotenant (
        tenant  varchar(255) not null,
        primary key (tenant)
    );
```
