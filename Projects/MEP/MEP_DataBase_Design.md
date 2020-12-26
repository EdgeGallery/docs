数据库设计
====================

The MEP database uses an open source PostgreSQL database, only api gateway kong and mepauth use database, and the recommended version is 12.3.

- AuthInfoRecord: Store Ak/Sk information.
```
    create table auth_info_record (
        app_ins_id  varchar(255) not null,
        ak  varchar(255) not null,
        sk  varchar(255) not null,
        nonce  varchar(255) not null,
        primary key (app_ins_id)
    );
```