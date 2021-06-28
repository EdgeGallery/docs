DataBase Desgian
=========================
The AppStore database uses an open source PostgreSQL database, and the recommended version is 12.2. The following database tables are currently designed and applied:

- app_table: Store app information, such as name, provider, description, etc.
```
create TABLE if not exists app_table (
        APPID                    VARCHAR(200)       NOT NULL,
        APPNAME                  VARCHAR(100)       NULL,
        APPLICATIONTYPE          VARCHAR(300)       NULL,
        DEPLOYMODE               VARCHAR(100)       NULL,
        SHORTDESC                TEXT               NULL,
        PROVIDER                 VARCHAR(300)       NULL,
        APPINTRODUCTION          TEXT               NULL,
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
        SHOWTYPE                 VARCHAR(100)       NOT NULL DEFAULT 'public',
        ISHOTAPP                 boolean            DEFAULT false,
        EXPERIENCEABLE           boolean            DEFAULT false,
        CONSTRAINT app_table_pkey PRIMARY KEY (APPID)
    );
```

- catalog_package_table: Store application package information, one application can have multiple packages
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
        DEPLOYMODE               VARCHAR(100)       NULL,
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
        SHOWTYPE                 VARCHAR(100)       NOT NULL DEFAULT 'public',
        APPINSTANCEID            VARCHAR(100)       NULL,
        INSTANCETENENTID         VARCHAR(100)       NULL,
        INSTANCEPACKAGEID        VARCHAR(255)       NULL,
        EXPERIENCEABLE           boolean            DEFAULT false,
        CONSTRAINT catalog_package_table_pkey PRIMARY KEY (PACKAGEID)
    );
```

- csar_package_score: Store application comments information
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

- app_store_table: Store external appstores information
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

- pushable_package_table: Store information about pushable application packages
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

- message_table: Store messages during intercommunication between appstores
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

- tbl_service_host: Store sandbox environment information

```
CREATE TABLE IF NOT EXISTS TBL_SERVICE_HOST (
        HOST_ID VARCHAR(50) NOT NULL,
        USER_ID VARCHAR(50) DEFAULT NULL,
        NAME VARCHAR(100) DEFAULT NULL,
        ADDRESS VARCHAR(255) DEFAULT NULL,
        ARCHITECTURE VARCHAR(100) DEFAULT NULL,
        STATUS VARCHAR(20) DEFAULT NULL,
        PROTOCOL VARCHAR(20) DEFAULT NULL,
        LCM_IP VARCHAR(20) DEFAULT NULL,
        MEC_HOST VARCHAR(20) DEFAULT NULL,
        OS VARCHAR(255) DEFAULT NULL,
        PORT_RANGE_MIN INTEGER DEFAULT 0,
        PORT_RANGE_MAX INTEGER DEFAULT 0,
        PORT INTEGER DEFAULT 0,
        VNC_PORT INTEGER DEFAULT NULL,
        PARAMETER VARCHAR(500) DEFAULT 22,
        DELETE BOOLEAN DEFAULT NULL
    );
```

- pushable_package_table: Store the k8s file information of the sandbox environment

```
CREATE TABLE IF NOT EXISTS TBL_UPLOADED_FILE (
        FILE_ID VARCHAR(50) NOT NULL DEFAULT NULL,
        FILE_NAME VARCHAR(255) DEFAULT NULL,
        IS_TEMP BOOL DEFAULT NULL,
        USER_ID VARCHAR(50) DEFAULT NULL,
        UPLOAD_DATE TIMESTAMPTZ(6) DEFAULT NULL,
        FILE_PATH VARCHAR(255) DEFAULT NULL,
        CONSTRAINT TBL_UPLOADED_FILE_PKEY PRIMARY KEY (FILE_ID)
    );
```
