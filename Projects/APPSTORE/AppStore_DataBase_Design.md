数据库设计
=========================
AppStore数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。目前设计并应用了三张数据库表格：

- app_table: 存储app信息，如名字、提供者、描述等
```
create TABLE if not exists app_table (
    	APPID                    VARCHAR(200)       NOT NULL,
    	APPNAME                  VARCHAR(100)       NULL,
    	APPLICATIONTYPE          VARCHAR(300)       NULL,
    	SHORTDESC                TEXT               NULL,
    	PROVIDER                 VARCHAR(300)       NULL,
    	APPINTRODUCTION	         TEXT               NULL,
    	DOWNLOADCOUNT            INT                NULL,
    	AFFINITY                 VARCHAR(100)       NULL,
    	INDUSTRY                 VARCHAR(100)       NULL,
    	CONTACT                  VARCHAR(100)       NULL,
    	USERID                   VARCHAR(100)       NULL,
    	USERNAME                 VARCHAR(100)       NULL,
    	CREATETIME               TIMESTAMP          NULL,
    	MODIFYTIME               TIMESTAMP          NULL,
        SCORE                    NUMERIC(2,1)       NULL,
        STATUS                   VARCHAR(50)        NULL,
    	CONSTRAINT app_table_pkey PRIMARY KEY (APPID)
    );
```

- catalog_package_table: 存储应用的package信息，一个应用可以拥有多个package
```
create TABLE if not exists catalog_package_table (
    	PACKAGEID                VARCHAR(200)       NOT NULL,
    	PACKAGEADDRESS           VARCHAR(200)       NULL,
    	ICONADDRESS              VARCHAR(200)       NULL,
    	DEMOVIDEOADDRESS         VARCHAR(200)       NULL,
    	SIZE                     VARCHAR(100)       NULL,
    	FILESTRUCTURE            TEXT               NULL,
    	CREATETIME               TIMESTAMP          NULL,
    	SHORTDESC                TEXT               NULL,
    	APPNAME                  VARCHAR(100)       NULL,
    	VERSION                  VARCHAR(20)        NULL,
    	APPLICATIONTYPE          VARCHAR(300)       NULL,
    	MARKDOWNCONTENT          TEXT               NULL,
    	AFFINITY                 VARCHAR(100)       NULL,
    	INDUSTRY                 VARCHAR(100)       NULL,
    	CONTACT                  VARCHAR(100)       NULL,
    	APPID                    VARCHAR(100)       NULL,
    	USERID                   VARCHAR(100)       NULL,
    	USERNAME                 VARCHAR(100)       NULL,
    	TESTTASKID               VARCHAR(100)       NULL,
    	STATUS                   VARCHAR(100)       NULL,
    	PROVIDER                 VARCHAR(100)       NULL,
    	CONSTRAINT catalog_package_table_pkey PRIMARY KEY (PACKAGEID)
    );
```

- csar_package_score: 存储应用的评论信息
```
create TABLE if not exists csar_package_score (
        COMMENTID                serial,
        USERID                   VARCHAR(100)       NULL,
        USERNAME                 VARCHAR(100)       NULL,
        APPID                    VARCHAR(200)       NOT NULL,
        COMMENTS                 TEXT               NULL,
        SCORE                    NUMERIC(2,1)       NULL,
        COMMENTTIME              TIMESTAMP          NULL,
        CONSTRAINT csar_package_score_pkey PRIMARY KEY (COMMENTID)
    );
```

- app_store_table: 存储外部appstore信息（POC特性）
```
create TABLE if not exists app_store_table (
        APPSTOREID               VARCHAR(64)        NOT NULL,
        APPSTORENAME             VARCHAR(128)       NULL,
        APPSTOREVERSION          VARCHAR(64)        NOT NULL,
        COMPANY                  VARCHAR(128)       NULL,
        URL                      VARCHAR(256)       NOT NULL,
        SCHEMA                   VARCHAR(16)        NULL,
        APPPUSHINTF              VARCHAR(256)       NULL,
        APPDTRANSID              VARCHAR(64)        NULL,
        DESCRIPTION              VARCHAR(256)       NULL,
        ADDEDTIME                TIMESTAMP          NOT NULL,
        MODIFIEDTIME             TIMESTAMP          NULL,
        CONSTRAINT app_store_table_pkey PRIMARY KEY (APPSTOREID)
    );
```

- pushable_package_table: 存储可推送csar包的信息（POC特性）
```
create TABLE if not exists pushable_package_table (
        PACKAGEID  VARCHAR(64) NOT NULL,
        ATPTESTREPORTURL VARCHAR(100) NOT NULL,
        LATESTPUSHTIME TIMESTAMP NOT NULL,
        PUSHTIMES INTEGER NOT NULL DEFAULT 0,
        SOURCEPLATFORM VARCHAR(100) NOT NULL,
        CONSTRAINT pushable_package_table_pkey PRIMARY KEY (PACKAGEID)
    );
```

- message_table: 存储appstore间互通时的消息（POC特性）
```
create TABLE if not exists message_table (
        MESSAGEID                VARCHAR(100)       NOT NULL,
        RESULT                   VARCHAR(100)       NULL,
        READED                   boolean            default false,
        NAME                     VARCHAR(100)       NULL,
        PROVIDER                 VARCHAR(100)       NULL,
        VERSION                  VARCHAR(100)       NULL,
        MESSAGETYPE              VARCHAR(20)        NULL,
        SOURCEAPPSTORE           VARCHAR(100)       NULL,
        TARGETAPPSTORE           VARCHAR(100)       NULL,
        TIME                     VARCHAR(100)       NULL,
        DESCRIPTION              VARCHAR(255)       NULL,
        ATPTESTSTATUS            VARCHAR(50)        NULL,
        ATPTESTTASKID            VARCHAR(100)       NULL,
        ATPTESTREPORTURL         VARCHAR(255)       NULL,
        PACKAGEDOWNLOADURL       VARCHAR(255)       NULL,
        ICONDOWNLOADURL          VARCHAR(255)       NULL,
        DEMOVIDEODOWNLOADURL     VARCHAR(255)       NULL,
        AFFINITY                 VARCHAR(100)       NULL,
        SHORTDESC                TEXT               NULL,
        INDUSTRY                 VARCHAR(100)       NULL,
        TYPE                     VARCHAR(50)        NULL,
        CONSTRAINT message_table_pkey PRIMARY KEY (MESSAGEID)
    );
	```