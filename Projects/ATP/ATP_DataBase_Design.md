数据库设计
=========================
- 在V1.3版本中，较v1.2版本，数据库表TEST_CASE_TABLE新增了configIdList字段，表TASK_TABLE新增字段reportPath，需要在上述2个数据库表中执行如下sql语句：  
alter table TEST_CASE_TABLE add column configIdList  TEXT  NULL;  
alter table TASK_TABLE add column reportPath varchar(200) NULL; 
 
- 新增了配置项的数据库表CONFIG_TABLE，建表信息见下方表结构信息即可。

- ATP数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。目前设计并应用的数据库表格如下：

- TABLE TASK_TABLE: 存储测试任务信息
```
    CREATE TABLE TASK_TABLE (
        ID                       VARCHAR(200)       NOT NULL,
        APPNAME                  VARCHAR(200)       NULL,
        APPVERSION               VARCHAR(200)       NULL,
        STATUS                   VARCHAR(200)       NULL,
        TESTCASEDETAIL           TEXT               NULL,
        CREATETIME               TIMESTAMP          NULL,
        ENDTIME                  TIMESTAMP          NULL,
        PROVIDERID               VARCHAR(200)       NULL,
        PACKAGEPATH              VARCHAR(200)       NULL,
        USERID                   VARCHAR(200)       NULL,
        USERNAME                 VARCHAR(200)       NULL,
        REPORTPATH               VARCHAR(200)       NULL,
        CONSTRAINT task_table_pkey PRIMARY KEY (ID)
    );
```

- TEST_CASE_TABLE : 存储测试用例信息
```
CREATE TABLE TEST_CASE_TABLE (
       ID                       VARCHAR(200)       NOT NULL,
       NAMECH                   VARCHAR(200)       NULL,
       NAMEEN                   VARCHAR(200)       NULL,
       TYPE                     VARCHAR(200)       NULL,
       CLASSNAME                VARCHAR(200)       NULL,
       HASHCODE                 TEXT               NULL, 
       DESCRIPTIONCH            TEXT               NULL,
       DESCRIPTIONEN            TEXT               NULL,
       FILEPATH                 VARCHAR(200)       NULL,
       CODELANGUAGE             VARCHAR(200)       NULL,
       EXPECTRESULTCH           VARCHAR(200)       NULL,
       EXPECTRESULTEN           VARCHAR(200)       NULL,
       TESTSUITEIDLIST          TEXT               NULL,
       TESTSTEPCH               TEXT               NULL,
       TESTSTEPEN               TEXT               NULL,
       CREATETIME               TIMESTAMP          NULL,
       CONFIGIDLIST             TEXT               NULL,
       CONSTRAINT test_case_table_pkey PRIMARY KEY (ID)
    );
```

- TEST_SCENARIO_TABLE: 存储测试场景信息
```
    CREATE TABLE TEST_SCENARIO_TABLE (
        ID                       VARCHAR(200)       NOT NULL,
        NAMECH                   VARCHAR(200)       NULL,
        NAMEEN                   VARCHAR(200)       NULL,
        DESCRIPTIONCh            TEXT               NULL,
        DESCRIPTIONEN            TEXT               NULL,
        LABEL                    VARCHAR(200)       NULL,
        CREATETIME               TIMESTAMP          NULL,
        CONSTRAINT test_scenario_table_pkey PRIMARY KEY (ID)
    );
```

- TEST_SUITE_TABLE: 存储测试套信息
```
    CREATE TABLE TEST_SUITE_TABLE (
       ID                       VARCHAR(200)       NOT NULL,
       NAMECH                   VARCHAR(200)       NULL,
       NAMEEN                   VARCHAR(200)       NULL,
       DESCRIPTIONCh            TEXT               NULL,
       DESCRIPTIONEN            TEXT               NULL, 
       SCENARIOIDLIST           VARCHAR(255)       NULL,
       CREATETIME               TIMESTAMP          NULL,
       CONSTRAINT test_suite_table_pkey PRIMARY KEY (ID)
    );
```

- FILE_TABLE: 存储图标文件信息
```
    CREATE TABLE FILE_TABLE (
       FILEID                   VARCHAR(200)       NOT NULL,
       TYPE                     VARCHAR(200)       NOT NULL,
       CREATETIME               TIMESTAMP          NULL,
       FILEPATH                 VARCHAR(200)       NULL
    );
    alter table FILE_TABLE add constraint file_table_pkey unique(FILEID,TYPE);
```

- CONTRIBUTION_TABLE: 存储贡献的测试用例信息
```
    CREATE TABLE CONTRIBUTION_TABLE (
        ID                       VARCHAR(200)       NOT NULL,
        NAME                     VARCHAR(200)       NULL,
        OBJECTIVE                VARCHAR(200)       NULL,
        STEP                     TEXT               NULL,
        EXPECTRESULT             TEXT               NULL, 
        TYPE                     VARCHAR(255)       NULL,
        CREATETIME               TIMESTAMP          NULL,
        FILEPATH                 VARCHAR(200)       NULL,
        CONSTRAINT contribution_table_pkey PRIMARY KEY (ID)
    );
```

- CONFIG_TABLE: 存储配置项信息
```
    CREATE TABLE CONFIG_TABLE (
             ID                       VARCHAR(200)       NOT NULL,
             NAMECH                   VARCHAR(200)       NULL,
             NAMEEN                   VARCHAR(200)       NULL,
             DESCRIPTIONCh            TEXT               NULL,
             DESCRIPTIONEN            TEXT               NULL,
             CONFIGURATION            TEXT               NOT NULL,
             CREATETIME               TIMESTAMP          NULL,
             CONSTRAINT config_table_pkey PRIMARY KEY (ID)
     );
```