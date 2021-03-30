Developer DataBase Design
============

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
        pluginfilehashcode    varchar(50)        DEFAULT NULL --插件哈希值，校验文件
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
       deploy_platform     varchar(100)  DEFAULT NULL,  --部署方式：虚机、容器部署
       CONSTRAINT  tbl_app_project_pkey  PRIMARY KEY ( id )
  );
```

- tbl_openmep_capability: 存储开发者在开发者平台自构建应用项目时，平台提供的全部能力的信息
```
  CREATE TABLE  tbl_openmep_capability  (
       group_id          varchar(50)     NOT NULL,         --能力组ID
       one_level_name    varchar(255)    DEFAULT NULL,     --能力名称：一级菜单名称
       one_level_name_en    varchar(255)    DEFAULT NULL,  --能力名称：一级菜单英文名称
       two_level_name    varchar(255)    DEFAULT NULL,     --能力名称：二级菜单名称
       two_level_name_en  varchar(255)    DEFAULT NULL,    --能力名称：二级菜单英文名称
       type          varchar(20)     DEFAULT NULL,         --能力类型
       description   text            DEFAULT NULL,         --能力描述
       description_en   text            DEFAULT NULL,      --能力英文描述
       CONSTRAINT  tbl_openmep_capability_pkey  PRIMARY KEY ( group_id )
  );
```

- tbl_openmep_capability_detail: 存储开发者在开发者平台自构建应用项目时，平台提供的能力详情（能力所提供的服务）的信息，一个能力对应多个能力详情（服务）
```
  CREATE TABLE  tbl_openmep_capability_detail  (
       detail_id      varchar(50)     NOT NULL,       --能力详情ID
       service        varchar(100)    DEFAULT NULL,   --服务名称
       service_en     varchar(100)    DEFAULT NULL,   --服务英文名称  
       version        varchar(100)    DEFAULT NULL,   --服务版本
       description    text            DEFAULT NULL,   --服务描述
       description_en text         DEFAULT NULL,      --服务英文描述
       provider       varchar(100)    DEFAULT NULL,   --服务提供者
       group_id       varchar(50)     DEFAULT NULL,   --能力ID（对应tbl_openmep_capability的group_id）
       api_file_id    varchar(255)    DEFAULT NULL,   --服务API文件ID
       guide_file_id  varchar(255)    DEFAULT NULL,   --服务说明文档
       guide_file_id_en  varchar(255)    DEFAULT NULL,   --服务说明文档-英文
       upload_time    timestamptz(6)  NOT NULL,       --上传时间
       host           varchar(50)     DEFAULT NULL,   --注册的服务名
       port           int4            DEFAULT NULL,   --服务端口
       protocol       varchar(20)     DEFAULT NULL,   --THHP,HTTPS
       app_id         varchar(255)    DEFAULT NULL,   --发布到appstore的id
       package_id     varchar(255)    DEFAULT NULL,   --发布到appstore的packageId
       user_id        varchar(255)    DEFAULT NULL,   --用户Id
      CONSTRAINT  tbl_openmep_capability_detail_pkey  PRIMARY KEY ( detail_id )
  );
```

- tbl_project_image: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，开发者上传或者填写的镜像信息，一个项目的可以利用不同的镜像构建多次
```
  CREATE TABLE  tbl_project_image  (
       id                 varchar(255)       NOT NULL,           --镜像ID
       pod_name           varchar(255)       DEFAULT NULL,       --镜像名称(项目名称)
       pod_containers     text               DEFAULT NULL,       --镜像信息
       project_id         varchar(255)       DEFAULT NULL,       --项目ID（对应tbl_app_project中的id）
       svc_type           varchar(255)       DEFAULT NULL,       --镜像类型（可能多个）
       svc_port           varchar(255)       DEFAULT NULL,       --镜像端口 （可能多个）
       svc_node_port      varchar(255)       DEFAULT NULL,       --镜像对外暴露的端口
      CONSTRAINT  tbl_project_image_pkey  PRIMARY KEY ( id )
  );
```

- tbl_project_test_config: 存储开发者在开发者平台对自构建的应用项目进行部署测试的配置信息，包括镜像、服务器等，一个项目可以多次配置测试项进行部署测试
```
  CREATE TABLE  tbl_project_test_config  (
       test_id             varchar(50)      NOT NULL,        --测试配置ID
       project_id          varchar(50)      NOT NULL,        --项目ID（对应tbl_app_project中的id）
       agent_config        text             DEFAULT NULL,    --MEP AGENT配置项
       image_file_id       varchar(255)     NOT NULL,        --镜像文件ID
       app_api_file_id     varchar(50)      DEFAULT NULL,    --项目API文件ID
       deploy_file_id      varchar(50)      DEFAULT NULL,    --部署文件ID
       private_host        bool             DEFAULT FALSE,   --节点是否私有
       platform            varchar(100)     DEFAULT NULL,    --部署方式
       access_url          varchar(200)     DEFAULT NULL,    --项目可访问的URl
       error_log           text             DEFAULT NULL,    --项目部署测试失败的日志
       deploy_date         timestamptz(6)   DEFAULT NULL,    --项目部署时间
       hosts               varchar(255)     DEFAULT NULL,    --项目部署选择的服务器信息
       app_instance_id     varchar(50)      DEFAULT NULL,    --项目部署成功上传到应用商店生成的实例ID
       work_load_id        varchar(255)     DEFAULT NULL,    --部署项目到applcm用
       pods                text             DEFAULT NULL,    --部署pods信息
       deploy_status       varchar(255)     DEFAULT NULL,    --部署状态
       stage_status        varchar(255)     DEFAULT NULL,    --部署步骤
       lcm_token           varchar(1000)    DEFAULT NULL,    --lcm token
       package_id          varchar(255)     DEFAULT NULL,    --生成的csar包ID
       CONSTRAINT  tbl_project_test_config_pkey  PRIMARY KEY ( test_id )
  );
```

- tbl_service_host: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，可供选择的服务器信息
```
  CREATE TABLE  tbl_service_host  (
       host_id           varchar(50)    NOT NULL,        --服务器ID
       user_id           varchar(50)    DEFAULT NULL，   --用户Id
       name              varchar(100)   DEFAULT NULL,    --服务器名称
       address           varchar(255)   DEFAULT NULL,    --地址
       architecture      varchar(100)   DEFAULT NULL,    --架构
       status            varchar(20)    DEFAULT NULL,    --状态
       protocol          varchar(20)    DEFAULT NULL,    --协议
       lcm_ip            varchar(20)    DEFAULT NULL,    --IP地址
       mec_host          varchar(20)    DEFAULT NULL,    --mec主机地址
       os                varchar(255)   DEFAULT NULL,    --操作系统名称
       port_range_min    int            DEFAULT '-1',    --端口最小值
       port_range_max    int            DEFAULT '-1',    --端口最大值
       port              int4           DEFAULT '-1',    --端口值
       user_name         varchar(50)    DEFAULT NULL,    --登录host所需的用户名  
       password          varchar(50)    DEFAULT NULL,    --登录host所需的密码
       delete            bool           DEFAULT NULL     --是否删除  
  );
```

- tbl_uploaded_file: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，上传的图标、镜像、api等文件信息
```
  CREATE TABLE  tbl_uploaded_file  (
       file_id         varchar(50)      NOT NULL,       --文件ID
       file_name       varchar(255)     DEFAULT NULL,   --文件名称
       is_temp         bool             DEFAULT NULL,   --是否是临时文件
       user_id         varchar(50)      DEFAULT NULL,   --上传文件的用户ID
       upload_date     timestamptz(6)   DEFAULT NULL,   --上传时间
       file_path       varchar(255)     DEFAULT NULL,   --文件路径
      CONSTRAINT  tbl_uploaded_file_pkey  PRIMARY KEY ( file_id )
  );
```

- tbl_helm_template_yaml: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，上传的Helm yaml文件信息(目前版本通过yaml部署)，一个项目可以通过不同的yaml文件进行多次部署测试
```
  CREATE TABLE  tbl_helm_template_yaml  (
       file_id            varchar(50)  NOT NULL,      --文件ID
       file_name          varchar(255) DEFAULT NULL,  --文件名称
       user_id            varchar(50)  DEFAULT NULL,  --上传文件的用户ID
       project_id         varchar(50)  DEFAULT NULL,  --项目ID(对应tbl_app_project中的id)
       content            text         DEFAULT NULL,  --文件内容
       upload_time_stamp  bigint       DEFAULT NULL,  --上传时间
       config_type        varchar(50)  DEFAULT NULL,  --区别部署类型（部署文件/可视化配置）
      CONSTRAINT  tbl_helm_template_yaml_pkey  PRIMARY KEY ( file_id )
  );
```

- tbl_api_emulator: 存储对已部署测试完成的项目，模拟API调用时的配置信息（api模拟调用已从当前版本剔除）
```
  CREATE TABLE  tbl_api_emulator  (
       id            varchar(50)  NOT NULL,  --模拟器ID
       user_id       varchar(50)  NOT NULL,  --用户ID
       host_id       varchar(50)  NOT NULL,  --服务器ID（对应tbl_service_host的host_id）
       port          int4         NOT NULL,  --端口
       workload_id   varchar(50)  NOT NULL,  --模拟部署的ID
       create_time   varchar(50)  NOT NULL   --创建时间
  );
```

-tbl_host_log： 记录app项目在边缘节点上部署的日志
```
   CREATE TABLE IF NOT EXISTS  tbl_host_log  (
       log_id  varchar(50) NOT NULL,               --日志ID
       host_ip  varchar(50) NOT NULL,              --host IP
       user_name  varchar(50) DEFAULT NULL,        --用户名
       user_id  varchar(50) DEFAULT NULL,          --用户ID
       project_id  varchar(50) DEFAULT NULL,       --项目ID
       project_name  varchar(50) DEFAULT NULL,     --项目名称
       app_instances_id  varchar(50) DEFAULT NULL, --app项目的实例ID
       deploy_time  varchar(50) DEFAULT NULL,      --项目部署时间
       status  varchar(50) DEFAULT NULL,           --host状态
       operation  varchar(50) DEFAULT NULL,        --操作
       host_id  varchar(50) DEFAULT NULL           --host ID
    );
     
```

- tbl_release_config: 存储应用发布对应的配置信息
```
  CREATE TABLE IF NOT EXISTS tbl_release_config (
         release_id            varchar(255)     NOT NULL,             --应用发布id
         project_id            varchar(255)     NOT NULL,             --项目id
         guide_file_id         varchar(255)     DEFAULT NULL,         --指导文档ID
         appinstance_id        varchar(255)     DEFAULT NULL,         --实例化ID
         capabilities_detail   text             DEFAULT NULL,         --应用配置信息
         atp_test              text             DEFAULT NULL,         --atp测试结果
         test_status           varchar(255)     DEFAULT NULL,         --测试状态
         create_time           timestamptz(0)   NOT NULL DEFAULT NULL,--创建时间
         CONSTRAINT tbl_release_config_pkey PRIMARY KEY (release_id)
  );
```

-tbl_vm_regulation： 虚机规则，虚机属性说明（虚机部署时提供选择）
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_regulation  (
       regulation_id  SERIAL,                         --规则id
       architecture  varchar(50) DEFAULT NULL,        --虚机架构
       name_zh  varchar(50) NOT NULL DEFAULT NULL,    --虚机中文名称
       name_en  varchar(50) NOT NULL DEFAULT NULL,    --虚机英文名称
       scene_zh  varchar(255) DEFAULT NULL,           --虚机使用场景
       scene_en  varchar(255) DEFAULT NULL,           --虚机使用场景英文说明
       memory  int4  DEFAULT NULL,                    --虚拟内存
       cpu  int4  DEFAULT NULL,                       --虚机cpu   
       system_disk  int4  DEFAULT NULL,               --虚机系统盘大小
       data_disk  int4  DEFAULT NULL,                 --虚机数据盘大小
       gpu  varchar(50)  DEFAULT NULL,                --虚机gpu
       other_ability  varchar(255)  DEFAULT NULL      --虚机其他能力
    );
```

-tbl_vm_network：虚机网络配置
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_network  (
       network_type  varchar(50) DEFAULT NULL,    --网络类型
       description_zh  varchar(255) DEFAULT NULL, --网络中文描述
       description_en  varchar(255) DEFAULT NULL, --网络英文描述
       network_name  varchar(50) DEFAULT NULL     --网络名称
    );
```

-tbl_vm_system：虚机系统属性说明
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_system  (
       system_id  SERIAL,                          --系统id
       type  varchar(50) DEFAULT NULL,             --系统类型
       operate_system  varchar(50) DEFAULT NULL,   --系统名称
       version  varchar(50) NOT NULL DEFAULT NULL, --系统版本
       system_bit  varchar(50) DEFAULT NULL,       --系统大小
       system_disk  int4  DEFAULT NULL             --系统盘说明
    );
```

-tbl_vm_flavor：虚机规格模板说明
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_flavor  (
       architecture  varchar(50) DEFAULT NULL,  --虚机架构规格
       flavor  varchar(50) DEFAULT NULL,        --虚机规格模板
       constraints  varchar(50) DEFAULT NULL    --虚机约束条件
    );
```

-tbl_project_vm_create_config：app项目虚机部署，创建虚机的配置说明
```
    CREATE TABLE IF NOT EXISTS  tbl_project_vm_create_config  (
       vm_id   varchar(255) NOT NULL DEFAULT NULL,                 --虚机id
       project_id  varchar(50) DEFAULT NULL,                       --项目id
       vm_regulation_desc  varchar(512) DEFAULT NULL,              --虚机规则描述
       vm_system_desc  varchar(512) NOT NULL DEFAULT NULL,         --虚机系统说明
       vm_network_desc  varchar(512) DEFAULT NULL,                 --虚机网络说明
       vm_name  varchar(50)  DEFAULT NULL,                         --虚机名称
       host  varchar(512)  DEFAULT NULL,                           --虚机主机说明
       status  varchar(50)  DEFAULT NULL,                          --虚机状态
       stage_status  varchar(500)  DEFAULT NULL,                   --虚机部署步骤状态
       lcm_token  varchar(1024)  DEFAULT NULL,                     --lcm token
       vm_info  varchar(512)  DEFAULT NULL,                        --虚机信息
       app_instance_id  varchar(50)  DEFAULT NULL,                 --部署的app实例id
       package_id  varchar(100)  DEFAULT NULL,                     --部署生成的csar包id
       create_time   timestamptz(6)  DEFAULT NULL,                 --创建时间
       log  text  DEFAULT NULL,                                    --操作日志
       CONSTRAINT  tbl_vm_create_config_pkey  PRIMARY KEY ( vm_id )
    );
```

-tbl_project_vm_image_config: app项目虚机部署，镜像配置说明
```
    CREATE TABLE IF NOT EXISTS  tbl_project_vm_image_config  (
       vm_id   varchar(255) NOT NULL DEFAULT NULL,              --虚机id
       image_id  varchar(50) DEFAULT NULL,                      --镜像id
       project_id  varchar(50) DEFAULT NULL,                    --项目id
       vm_name  varchar(50) NOT NULL DEFAULT NULL,              --虚机名称
       image_name  varchar(50) DEFAULT NULL,                    --镜像名称
       app_instance_id  varchar(50)  DEFAULT NULL,              --实例id
       host_ip  varchar(50)  DEFAULT NULL,                      --主机ip
       sum_chunk_num  varchar(50)  DEFAULT NULL,                --镜像块数
       chunk_size  varchar(50)  DEFAULT NULL,                   --镜像块大小
       stage_status  varchar(500)  DEFAULT NULL,                --部署状态
       status  varchar(512)  DEFAULT NULL,                      --状态
       lcm_token  varchar(1024)  DEFAULT NULL,                  --lcm token
       create_time   timestamptz(6)  DEFAULT NULL,              --创建时间
       log  text  DEFAULT NULL,                                 --日志
      CONSTRAINT  tbl_vm_image_config_pkey  PRIMARY KEY ( vm_id )
    );
```






