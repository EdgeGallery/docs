数据库设计
=========================
ATP数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。目前设计并应用了两张数据库表格：

- TABLE TASK_TABLE: 存储测试任务信息
```
    CREATE TABLE TASK_TABLE (
        ID                       VARCHAR(200)       NOT NULL,
        APPNAME                  VARCHAR(100)       NULL,
        APPVERSION               VARCHAR(100)       NULL,
        STATUS                   VARCHAR(100)       NULL,
        TESTCASEDETAIL           TEXT               NULL,
        CREATETIME               TIMESTAMP          NULL,
        ENDTIME                  TIMESTAMP          NULL,
        USERID                   VARCHAR(100)       NULL,
        USERNAME                 VARCHAR(100)       NULL,
        CONSTRAINT task_table_pkey PRIMARY KEY (ID)
    );
```

- TEST_CASE_TABLE : 存储测试用例信息
```
    CREATE TABLE TEST_CASE_TABLE (
        ID                       VARCHAR(200)       NOT NULL,
        NAME                     VARCHAR(100)       NULL,
        TYPE                     VARCHAR(100)       NULL,
        CLASSNAME                VARCHAR(100)       NULL,
        CONTENT                  TEXT               NULL, 
        DESCRIPTION              TEXT               NULL,
        CONSTRAINT test_case_table_pkey PRIMARY KEY (ID)
    );
```
