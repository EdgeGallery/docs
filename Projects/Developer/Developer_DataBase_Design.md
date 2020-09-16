## 概要
Developer数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。**PostgreSQL**是开源的对象-关系数据库服务器(ORDBMS)，在灵活的BSD许可证下发行。进一步了解PostgreSQL可以点击[这里](https://www.runoob.com/postgresql/postgresql-tutorial.html)。
- tbl_plugin: 存储开发者上传的插件信息，如名字、满意度、插件保存路径等
```
CREATE TABLE tbl_plugin (
    	pluginid              varchar(255)       NOT NULL,    --插件ID
    	pluginname            varchar(255)       NOT NULL,    --插件名字
    	introduction          varchar(500)       NULL,        --插件简介
        satisfaction          float4             NOT NULL,    --满意度（评分）
        codelanguage          varchar(255)       NOT NULL,    --插件代表的编程语言
        plugintype            int4               NOT NULL,    --插件类型（1：plugin 2:sdk）
        version               varchar(255)       NOT NULL,    --插件版本
        downloadcount         int4               NOT NULL,    --下载次数
        logofile              varchar(500)       NOT NULL,    --插件图标的保存路径
        pluginfile            varchar(500)       NOT NULL,    --插件的保存路径
        userid                varchar(255)       NOT NULL,    --上传插件的用户ID
        uploadtime            timestamptz(6)     NOT NULL,    --上传时间
        username              varchar(255)       NOT NULL,    --上传插件的用户姓名
        pluginsize            int4               NOT NULL,    --插件大小（字节）
        apifile               varchar(500)       NOT NULL,    --插件API文件的保存路径
        scorecount            int4               NOT NULL,    --插件的评分次数
        CONSTRAINT "tbl_plugin_pkey" PRIMARY KEY ("pluginid")
    );
```

- catalog_package_table: 存储应用的package信息，一个应用可以拥有多个package
```
CREATE TABLE catalog_package_table (
    	VERSIONID                VARCHAR(200)       NOT NULL,
    	PACKAGEADDRESS           VARCHAR(200)       NULL,
    	ICONADDRESS              VARCHAR(200)       NULL,
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
    	CONSTRAINT catalog_package_table_pkey PRIMARY KEY (VERSIONID)
    );
```

- csar_package_score: 存储应用的评论信息
```
CREATE TABLE csar_package_score (
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