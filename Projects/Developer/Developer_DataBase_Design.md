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
        CONSTRAINT tbl_plugin_pkey PRIMARY KEY (pluginid)
    );
```

- tbl_downloadrecord: 存储插件的下载记录，一个插件对应对应多条下载记录
```
 CREATE TABLE  tbl_downloadrecord (
       recordid          varchar(255)    NOT NULL,    --下载记录ID
       pluginid          varchar(255)    NOT NULL,    --插件ID（对应tbl_plugin中的pluginid）
       downloaduserid    varchar(255)    NOT NULL,    --下载用户ID
       downloadusername  varchar(255)    NOT NULL,    --下载用户姓名
       score             float4          NOT NULL,    --评分分数（1-5）
       scoretype         int4            NOT NULL,    --评分类型
       downloadtime      timestamptz(0)  NOT NULL,    --下载时间
       CONSTRAINT  tbl_downloadrecord_pkey  PRIMARY KEY (recordid)
    );
```

- tbl_testapp: 存储开发者上传的应用信息，如应用名称，版本等
```
  CREATE TABLE tbl_testapp (
       appid          varchar(255)    NOT NULL,   --应用ID
       appname        varchar(255)    NULL,       --应用名称
       appfile        varchar(255)    NOT NULL,   --应用存储的路径
       affinity       varchar(255)    NOT NULL,   --亲和力（x86/arm/cpu等）
       industry       varchar(255)    NOT NULL,   --应用所属行业
       appdesc        varchar(500)    NULL,       --描述（应用简介）
       uploadtime     timestamptz(0)  NOT NULL,   --上传时间
       userid         varchar(255)    NOT NULL,   --上传应用的用户ID
       logofile       varchar(255)    NOT NULL,   --应用图标的存储路径
       appversion     varchar(255)    NULL,       --应用版本
       type           varchar(255)    NOT NULL,   --应用类型（视频/应用/安全等）
      CONSTRAINT  tbl_testapp_pkey  PRIMARY KEY ( appid )
    );
```

- tbl_testtask: 存储应用的测试任务信息，一个应用对应一个测试任务
```
    CREATE TABLE   tbl_testtask  (
       taskid      varchar(255)    NOT NULL,   --任务ID
       taskno      varchar(255)    NOT NULL,   --任务编号
       status      varchar(255)    NOT NULL,   --测试状态
       begintime   timestamptz(6)  NOT NULL,   --任务开始时间
       endtime     timestamptz(6)  NULL,       --任务结束时间
       appid       varchar(255)    NOT NULL,   --应用ID（对应tbl_testapp中的appid）
       CONSTRAINT  tbl_testtask_pkey  PRIMARY KEY ( taskid )
    );
```

- tbl_subtaskstatus: 存储应用的测试子任务信息，一个测试主任务对应多条子任务
```
 CREATE TABLE  tbl_subtaskstatus  (
       executionid      varchar(255)  DEFAULT NULL,   --执行ID（主键）
       taskid           varchar(255)  DEFAULT NULL,   --主任务ID（对应tbl_testtask中的taskid)
       testcaseid       int4          NOT NULL,       --测试用例id(1-5,int)
       status           varchar(255)  DEFAULT NULL,   --子任务执行状态
       parameters       text          DEFAULT NULL,   --子任务参数
       CONSTRAINT  tbl_subtaskstatus_pkey  PRIMARY KEY ( executionid )
    );
```

- tbl_appfunction: 存储应用的所有亲和力的信息
```
 CREATE TABLE  tbl_appfunction (
       functionid     varchar(255)    NOT NULL,   --功能ID（主键）
       funcname       varchar(255)    NOT NULL,   --功能名称
       funcdesc       varchar(255)    NOT NULL,   --功能描述
       addtime        varchar(244)    NOT NULL,   --添加时间
       CONSTRAINT  tbl_appfunction_pkey  PRIMARY KEY ( functionid )
    );
```
- tbl_app_project: 存储开发者在开发者平台自构建的应用项目的信息
```
 CREATE TABLE  tbl_app_project  (
       id                  varchar(50)   NOT NULL,      --项目ID
       name                varchar(100)  NOT NULL,      --项目名称
       provider            varchar(100)  NOT NULL,      --提供者
       platform            varchar(100)  NOT NULL,      --项目架构
       industries          varchar(100)  NOT NULL,      --项目所属行业
       type                varchar(50)   NOT NULL,      --项目类型（视频/安全/游戏等）
       description         text          DEFAULT NULL,  --项目描述
       status              varchar(20)   NOT NULL,      --项目状态（已测试，部署中等）
       user_id             varchar(50)   NOT NULL,      --创建项目的用户id
       create_date         timestamptz(6) DEFAULT NULL, --创建时间
       last_test_id        varchar(50)   DEFAULT NULL,  --最后一次测试的ID
       version             varchar(50)   DEFAULT NULL,  --项目版本
       capabilities        text          DEFAULT NULL,  --项目具有的能力（创建项目时勾选的能力）
       project_type        varchar(10)   DEFAULT NULL,  --项目类型（新建/迁移）
       icon_file_id        varchar(50)   DEFAULT NULL,  --项目图标文件的ID
       open_capability_id  varchar(50)   DEFAULT NULL,  --开发者平台本身提供的以及其他开发者共享的能力ID
       CONSTRAINT  tbl_app_project_pkey  PRIMARY KEY ( id )
    );
```
