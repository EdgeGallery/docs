Developer DataBase Design
============

Developer数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。**PostgreSQL**是开源的对象-关系数据库服务器(ORDBMS)，在灵活的BSD许可证下发行。进一步了解PostgreSQL可以点击[这里](https://www.runoob.com/postgresql/postgresql-tutorial.html)。

- tbl_plugin: 存储开发者上传的插件信息，如名字、满意度、插件保存路径等
```
  CREATE TABLE tbl_plugin (
    	pluginid              varchar(255)       NOT NULL,    --Plugin ID
    	pluginname            varchar(255)       NOT NULL,    --Plugin name
    	introduction          varchar(500)       NULL,        --Introduction to the plugin
        satisfaction          float4             NOT NULL,    --Satisfaction (rating)
        codelanguage          varchar(255)       NOT NULL,    --The programming language represented by the plugin
        plugintype            int4               NOT NULL,    --Plugin type (1: plugin 2: sdk)
        version               varchar(255)       NOT NULL,    --Plugin version
        downloadcount         int4               NOT NULL,    --download times
        logofile              varchar(500)       NOT NULL,    --Saved path of the plugin icon
        pluginfile            varchar(500)       NOT NULL,    --Save path of the plugin
        userid                varchar(255)       NOT NULL,    --ID of the user who uploaded the plugin
        uploadtime            timestamptz(6)     NOT NULL,    --Upload time
        username              varchar(255)       NOT NULL,    --The name of the user who uploaded the plugin
        pluginsize            int4               NOT NULL,    --Plugin size (bytes)
        apifile               varchar(500)       NOT NULL,    --Saved path of the plugin API file
        scorecount            int4               NOT NULL,    --Number of ratings for the plugin
        pluginfilehashcode    varchar(50)        DEFAULT NULL --Plugin hash value, verification file
        CONSTRAINT tbl_plugin_pkey PRIMARY KEY (pluginid)
  );
```

- tbl_downloadrecord: 存储插件的下载记录，一个插件对应对应多条下载记录
```
  CREATE TABLE  tbl_downloadrecord (
       recordid          varchar(255)    NOT NULL,    --Download record ID
       pluginid          varchar(255)    NOT NULL,    --Plugin ID (corresponding to pluginid in tbl_plugin)
       downloaduserid    varchar(255)    NOT NULL,    --Download user ID
       downloadusername  varchar(255)    NOT NULL,    --Download user name
       score             float4          NOT NULL,    --Rating score (1-5)
       scoretype         int4            NOT NULL,    --Rating type
       downloadtime      timestamptz(0)  NOT NULL,    --Download time
       CONSTRAINT  tbl_downloadrecord_pkey  PRIMARY KEY (recordid)
  );
```

- tbl_testapp: 存储开发者上传的应用信息，如应用名称，版本等
```
  CREATE TABLE tbl_testapp (
       appid          varchar(255)    NOT NULL,   --App ID
       appname        varchar(255)    NULL,       --Application Name
       appfile        varchar(255)    NOT NULL,   --Application storage path
       affinity       varchar(255)    NOT NULL,   --Affinity (x86/arm/cpu, etc.)
       industry       varchar(255)    NOT NULL,   --Application industry
       appdesc        varchar(500)    NULL,       --Description (application brief)
       uploadtime     timestamptz(0)  NOT NULL,   --Upload time
       userid         varchar(255)    NOT NULL,   --ID of the user who uploaded the application
       logofile       varchar(255)    NOT NULL,   --The storage path of the application icon
       appversion     varchar(255)    NULL,       --App version
       type           varchar(255)    NOT NULL,   --Application type (video/application/security, etc.)
      CONSTRAINT  tbl_testapp_pkey  PRIMARY KEY ( appid )
  );
```

- tbl_testtask: 存储应用的测试任务信息，一个应用对应一个测试任务
```
  CREATE TABLE   tbl_testtask  (
       taskid      varchar(255)    NOT NULL,   --Task ID
       taskno      varchar(255)    NOT NULL,   --Task number
       status      varchar(255)    NOT NULL,   --Test status
       begintime   timestamptz(6)  NOT NULL,   --Task start time
       endtime     timestamptz(6)  NULL,       --Task end time
       appid       varchar(255)    NOT NULL,   --Application ID (corresponding to the appid in tbl_testapp)
       CONSTRAINT  tbl_testtask_pkey  PRIMARY KEY ( taskid )
  );
```

- tbl_subtaskstatus: 存储应用的测试子任务信息，一个测试主任务对应多条子任务
```
  CREATE TABLE  tbl_subtaskstatus  (
       executionid      varchar(255)  DEFAULT NULL,   --Execution ID (primary key)
       taskid           varchar(255)  DEFAULT NULL,   --Main task ID (corresponding to taskid in tbl_testtask)
       testcaseid       int4          NOT NULL,       --Test case id (1-5, int)
       status           varchar(255)  DEFAULT NULL,   --Subtask execution status
       parameters       text          DEFAULT NULL,   --Subtask parameters
       CONSTRAINT  tbl_subtaskstatus_pkey  PRIMARY KEY ( executionid )
  );
```

- tbl_appfunction: 存储应用的所有亲和力的信息
```
  CREATE TABLE  tbl_appfunction (
       functionid     varchar(255)    NOT NULL,   --Function ID (primary key)
       funcname       varchar(255)    NOT NULL,   --function name
       funcdesc       varchar(255)    NOT NULL,   --Function description
       addtime        varchar(244)    NOT NULL,   --add time
       CONSTRAINT  tbl_appfunction_pkey  PRIMARY KEY ( functionid )
  );
```

- tbl_app_project: 存储开发者在开发者平台自构建的应用项目的信息
```
  CREATE TABLE  tbl_app_project  (
       id                  varchar(50)   NOT NULL,      --Project ID
       name                varchar(100)  NOT NULL,      --project name
       provider            varchar(100)  NOT NULL,      --provider
       platform            varchar(100)  NOT NULL,      --Project structure
       industries          varchar(100)  NOT NULL,      --Project Industry
       type                varchar(50)   NOT NULL,      --Project type (video/security/game, etc.)
       description         text          DEFAULT NULL,  --project description
       status              varchar(20)   NOT NULL,      --Project status (tested, medium deployment)
       user_id             varchar(50)   NOT NULL,      --ID of the user who created the project
       create_date         timestamptz(6) DEFAULT NULL, --Creation time
       last_test_id        varchar(50)   DEFAULT NULL,  --ID of the last test
       version             varchar(50)   DEFAULT NULL,  --Project version
       capabilities        text          DEFAULT NULL,  --The ability of the project (the ability checked when creating the project)
       project_type        varchar(10)   DEFAULT NULL,  --Project type (new/migrated)
       icon_file_id        varchar(50)   DEFAULT NULL,  --ID of the project icon file
       open_capability_id  varchar(50)   DEFAULT NULL,  --Ability ID provided by the developer platform itself and shared by other developers
       deploy_platform     varchar(100)  DEFAULT NULL,  --Deployment method: virtual machine, container deployment
       CONSTRAINT  tbl_app_project_pkey  PRIMARY KEY ( id )
  );
```

- tbl_openmep_capability: 存储开发者在开发者平台自构建应用项目时，平台提供的全部能力的信息
```
  CREATE TABLE  tbl_openmep_capability  (
       group_id          varchar(50)     NOT NULL,         --Capability group ID
       one_level_name    varchar(255)    DEFAULT NULL,     --Capability name: the name of the first-level menu
       one_level_name_en    varchar(255)    DEFAULT NULL,  --Capability name: English name of the first-level menu
       two_level_name    varchar(255)    DEFAULT NULL,     --Capability name: secondary menu name
       two_level_name_en  varchar(255)    DEFAULT NULL,    --Capability name: English name of the secondary menu
       type          varchar(20)     DEFAULT NULL,         --Capability type
       description   text            DEFAULT NULL,         --Capability description
       description_en   text            DEFAULT NULL,      --English description of Capability
       CONSTRAINT  tbl_openmep_capability_pkey  PRIMARY KEY ( group_id )
  );
```

- tbl_openmep_capability_detail: 存储开发者在开发者平台自构建应用项目时，平台提供的能力详情（能力所提供的服务）的信息，一个能力对应多个能力详情（服务）
```
  CREATE TABLE  tbl_openmep_capability_detail  (
       detail_id      varchar(50)     NOT NULL,       --Capability Details ID
       service        varchar(100)    DEFAULT NULL,   --service name
       service_en     varchar(100)    DEFAULT NULL,   --English name of service  
       version        varchar(100)    DEFAULT NULL,   --Service version
       description    text            DEFAULT NULL,   --Service description
       description_en text         DEFAULT NULL,      --Service description in English
       provider       varchar(100)    DEFAULT NULL,   --service providers
       group_id       varchar(50)     DEFAULT NULL,   --Capability ID (corresponding to group_id of tbl_openmep_capability)
       api_file_id    varchar(255)    DEFAULT NULL,   --Service API document ID
       guide_file_id  varchar(255)    DEFAULT NULL,   --Service documentation
       guide_file_id_en  varchar(255)    DEFAULT NULL,   --Service Description Document-English
       upload_time    timestamptz(6)  NOT NULL,       --Upload time
       host           varchar(50)     DEFAULT NULL,   --Registered service name
       port           int4            DEFAULT NULL,   --Service port
       protocol       varchar(20)     DEFAULT NULL,   --THHP,HTTPS
       app_id         varchar(255)    DEFAULT NULL,   --Id posted to appstore
       package_id     varchar(255)    DEFAULT NULL,   --The packageId published to the appstore
       user_id        varchar(255)    DEFAULT NULL,   --UserId
      CONSTRAINT  tbl_openmep_capability_detail_pkey  PRIMARY KEY ( detail_id )
  );
```

- tbl_project_image: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，开发者上传或者填写的镜像信息，一个项目的可以利用不同的镜像构建多次
```
  CREATE TABLE  tbl_project_image  (
       id                 varchar(255)       NOT NULL,           --Mirror ID
       pod_name           varchar(255)       DEFAULT NULL,       --Mirror name (project name)
       pod_containers     text               DEFAULT NULL,       --Mirror information
       project_id         varchar(255)       DEFAULT NULL,       --Project ID (corresponding to the id in tbl_app_project)
       svc_type           varchar(255)       DEFAULT NULL,       --Mirror type (possibly multiple)
       svc_port           varchar(255)       DEFAULT NULL,       --Mirror port (possibly multiple)
       svc_node_port      varchar(255)       DEFAULT NULL,       --Ports exposed by the mirror
      CONSTRAINT  tbl_project_image_pkey  PRIMARY KEY ( id )
  );
```

- tbl_project_test_config: 存储开发者在开发者平台对自构建的应用项目进行部署测试的配置信息，包括镜像、服务器等，一个项目可以多次配置测试项进行部署测试
```
  CREATE TABLE  tbl_project_test_config  (
       test_id             varchar(50)      NOT NULL,        --Test configuration ID
       project_id          varchar(50)      NOT NULL,        --Project ID (corresponding to the id in tbl_app_project)
       agent_config        text             DEFAULT NULL,    --MEP AGENT configuration item
       image_file_id       varchar(255)     NOT NULL,        --Image file ID
       app_api_file_id     varchar(50)      DEFAULT NULL,    --Project API document ID
       deploy_file_id      varchar(50)      DEFAULT NULL,    --Deployment file ID
       private_host        bool             DEFAULT FALSE,   --Whether the node is private
       platform            varchar(100)     DEFAULT NULL,    --Deployment method
       access_url          varchar(200)     DEFAULT NULL,    --Project accessible URl
       error_log           text             DEFAULT NULL,    --Project deployment test failed log
       deploy_date         timestamptz(6)   DEFAULT NULL,    --Project deployment time
       hosts               varchar(255)     DEFAULT NULL,    --Server information selected for project deployment
       app_instance_id     varchar(50)      DEFAULT NULL,    --The project deployment is successfully uploaded to the instance ID generated by the app store
       work_load_id        varchar(255)     DEFAULT NULL,    --Deploy the project to applcm
       pods                text             DEFAULT NULL,    --Deploy pods information
       deploy_status       varchar(255)     DEFAULT NULL,    --Deployment status
       stage_status        varchar(255)     DEFAULT NULL,    --Deployment steps
       lcm_token           varchar(1000)    DEFAULT NULL,    --lcm token
       package_id          varchar(255)     DEFAULT NULL,    --Generated csar package ID
       CONSTRAINT  tbl_project_test_config_pkey  PRIMARY KEY ( test_id )
  );
```

- tbl_service_host: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，可供选择的服务器信息
```
  CREATE TABLE  tbl_service_host  (
       host_id           varchar(50)    NOT NULL,        --Server id
       user_id           varchar(50)    DEFAULT NULL，   --UserId
       name              varchar(100)   DEFAULT NULL,    --server nickname
       address           varchar(255)   DEFAULT NULL,    --address
       architecture      varchar(100)   DEFAULT NULL,    --Architecture
       status            varchar(20)    DEFAULT NULL,    --status
       protocol          varchar(20)    DEFAULT NULL,    --protocol
       lcm_ip            varchar(20)    DEFAULT NULL,    --IP address
       mec_host          varchar(20)    DEFAULT NULL,    --mec host address
       os                varchar(255)   DEFAULT NULL,    --Operating system name
       port_range_min    int            DEFAULT '-1',    --Port minimum
       port_range_max    int            DEFAULT '-1',    --Maximum port
       port              int4           DEFAULT '-1',    --Port value
       user_name         varchar(50)    DEFAULT NULL,    --User name required to log in to the host  
       password          varchar(50)    DEFAULT NULL,    --Password required to log in to the host
       delete            bool           DEFAULT NULL     --delete or not  
  );
```

- tbl_uploaded_file: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，上传的图标、镜像、api等文件信息
```
  CREATE TABLE  tbl_uploaded_file  (
       file_id         varchar(50)      NOT NULL,       --File ID
       file_name       varchar(255)     DEFAULT NULL,   --file name
       is_temp         bool             DEFAULT NULL,   --Is it a temporary file
       user_id         varchar(50)      DEFAULT NULL,   --ID of the user who uploaded the file
       upload_date     timestamptz(6)   DEFAULT NULL,   --Upload time
       file_path       varchar(255)     DEFAULT NULL,   --file path
      CONSTRAINT  tbl_uploaded_file_pkey  PRIMARY KEY ( file_id )
  );
```

- tbl_helm_template_yaml: 存储开发者在开发者平台对自构建的应用项目进行部署测试时，上传的Helm yaml文件信息(目前版本通过yaml部署)，一个项目可以通过不同的yaml文件进行多次部署测试
```
  CREATE TABLE  tbl_helm_template_yaml  (
       file_id            varchar(50)  NOT NULL,      --File ID
       file_name          varchar(255) DEFAULT NULL,  --file name
       user_id            varchar(50)  DEFAULT NULL,  --ID of the user who uploaded the file
       project_id         varchar(50)  DEFAULT NULL,  --Project ID (corresponding to the id in tbl_app_project)
       content            text         DEFAULT NULL,  --document content
       upload_time_stamp  bigint       DEFAULT NULL,  --Upload time
       config_type        varchar(50)  DEFAULT NULL,  --Distinguish the deployment type (deployment file/visual configuration)
      CONSTRAINT  tbl_helm_template_yaml_pkey  PRIMARY KEY ( file_id )
  );
```

- tbl_api_emulator: 存储对已部署测试完成的项目，模拟API调用时的配置信息（api模拟调用已从当前版本剔除）
```
  CREATE TABLE  tbl_api_emulator  (
       id            varchar(50)  NOT NULL,  --Simulator ID
       user_id       varchar(50)  NOT NULL,  --User ID
       host_id       varchar(50)  NOT NULL,  --Server ID (corresponding to host_id of tbl_service_host)
       port          int4         NOT NULL,  --port
       workload_id   varchar(50)  NOT NULL,  --Simulation deployment ID
       create_time   varchar(50)  NOT NULL   --Creation time
  );
```

-tbl_host_log： 记录app项目在边缘节点上部署的日志
```
   CREATE TABLE IF NOT EXISTS  tbl_host_log  (
       log_id  varchar(50) NOT NULL,               --Log ID
       host_ip  varchar(50) NOT NULL,              --host IP
       user_name  varchar(50) DEFAULT NULL,        --username
       user_id  varchar(50) DEFAULT NULL,          --User ID
       project_id  varchar(50) DEFAULT NULL,       --Project ID
       project_name  varchar(50) DEFAULT NULL,     --project name
       app_instances_id  varchar(50) DEFAULT NULL, --The instance ID of the app project
       deploy_time  varchar(50) DEFAULT NULL,      --Project deployment time
       status  varchar(50) DEFAULT NULL,           --host status
       operation  varchar(50) DEFAULT NULL,        --operating
       host_id  varchar(50) DEFAULT NULL           --host ID
    );
     
```

- tbl_release_config: 存储应用发布对应的配置信息
```
  CREATE TABLE IF NOT EXISTS tbl_release_config (
         release_id            varchar(255)     NOT NULL,             --Application release id
         project_id            varchar(255)     NOT NULL,             --Project id
         guide_file_id         varchar(255)     DEFAULT NULL,         --Guidance document ID
         appinstance_id        varchar(255)     DEFAULT NULL,         --Instantiated ID
         capabilities_detail   text             DEFAULT NULL,         --Application configuration information
         atp_test              text             DEFAULT NULL,         --atp test result
         test_status           varchar(255)     DEFAULT NULL,         --Test status
         create_time           timestamptz(0)   NOT NULL DEFAULT NULL,--Creation time
         CONSTRAINT tbl_release_config_pkey PRIMARY KEY (release_id)
  );
```

-tbl_vm_regulation： 虚机规则，虚机属性说明（虚机部署时提供选择）
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_regulation  (
       regulation_id  SERIAL,                         --Rule id
       architecture  varchar(50) DEFAULT NULL,        --Virtual machine architecture
       name_zh  varchar(50) NOT NULL DEFAULT NULL,    --Chinese name of the virtual machine
       name_en  varchar(50) NOT NULL DEFAULT NULL,    --English name of virtual machine
       scene_zh  varchar(255) DEFAULT NULL,           --Virtual machine usage scenarios
       scene_en  varchar(255) DEFAULT NULL,           --English description of virtual machine usage scenarios
       memory  int4  DEFAULT NULL,                    --Virtual Memory
       cpu  int4  DEFAULT NULL,                       --Virtual machine cpu   
       system_disk  int4  DEFAULT NULL,               --Virtual machine system disk size
       data_disk  int4  DEFAULT NULL,                 --Virtual machine data disk size
       gpu  varchar(50)  DEFAULT NULL,                --Virtual machine gpu
       other_ability  varchar(255)  DEFAULT NULL      --Other capabilities of the virtual machine
    );
```

-tbl_vm_network：虚机网络配置
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_network  (
       network_type  varchar(50) DEFAULT NULL,    --Network Type
       description_zh  varchar(255) DEFAULT NULL, --Network Chinese description
       description_en  varchar(255) DEFAULT NULL, --English description of the network
       network_name  varchar(50) DEFAULT NULL     --Network name
    );
```

-tbl_vm_system：虚机系统属性说明
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_system  (
       system_id  SERIAL,                          --System id
       type  varchar(50) DEFAULT NULL,             --System type
       operate_system  varchar(50) DEFAULT NULL,   --system name
       version  varchar(50) NOT NULL DEFAULT NULL, --system version
       system_bit  varchar(50) DEFAULT NULL,       --System size
       system_disk  int4  DEFAULT NULL             --System disk description
    );
```

-tbl_vm_flavor：虚机规格模板说明
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_flavor  (
       architecture  varchar(50) DEFAULT NULL,  --Virtual machine architecture specifications
       flavor  varchar(50) DEFAULT NULL,        --Virtual machine specification template
       constraints  varchar(50) DEFAULT NULL    --Virtual machine constraints
    );
```

-tbl_project_vm_create_config：app项目虚机部署，创建虚机的配置说明
```
    CREATE TABLE IF NOT EXISTS  tbl_project_vm_create_config  (
       vm_id   varchar(255) NOT NULL DEFAULT NULL,                 --Virtual machine id
       project_id  varchar(50) DEFAULT NULL,                       --Project id
       vm_regulation_desc  varchar(512) DEFAULT NULL,              --Description of virtual machine rules
       vm_system_desc  varchar(512) NOT NULL DEFAULT NULL,         --Virtual machine system description
       vm_network_desc  varchar(512) DEFAULT NULL,                 --Virtual machine network description
       vm_name  varchar(50)  DEFAULT NULL,                         --Virtual machine name
       host  varchar(512)  DEFAULT NULL,                           --Virtual machine host description
       status  varchar(50)  DEFAULT NULL,                          --Virtual machine state
       stage_status  varchar(500)  DEFAULT NULL,                   --Virtual machine deployment step status
       lcm_token  varchar(1024)  DEFAULT NULL,                     --lcm token
       vm_info  varchar(512)  DEFAULT NULL,                        --Virtual machine information
       app_instance_id  varchar(50)  DEFAULT NULL,                 --The id of the deployed app instance
       package_id  varchar(100)  DEFAULT NULL,                     --Deploy the generated csar package id
       create_time   timestamptz(6)  DEFAULT NULL,                 --Creation time
       log  text  DEFAULT NULL,                                    --Operation log
       CONSTRAINT  tbl_vm_create_config_pkey  PRIMARY KEY ( vm_id )
    );
```

-tbl_project_vm_image_config: app项目虚机部署，镜像配置说明
```
    CREATE TABLE IF NOT EXISTS  tbl_project_vm_image_config  (
       vm_id   varchar(255) NOT NULL DEFAULT NULL,              --Virtual machine id
       image_id  varchar(50) DEFAULT NULL,                      --Mirror id
       project_id  varchar(50) DEFAULT NULL,                    --Project id
       vm_name  varchar(50) NOT NULL DEFAULT NULL,              --Virtual machine name
       image_name  varchar(50) DEFAULT NULL,                    --Mirror name
       app_instance_id  varchar(50)  DEFAULT NULL,              --Instance id
       host_ip  varchar(50)  DEFAULT NULL,                      --Host ip
       sum_chunk_num  varchar(50)  DEFAULT NULL,                --Number of mirrored blocks
       chunk_size  varchar(50)  DEFAULT NULL,                   --Mirror block size
       stage_status  varchar(500)  DEFAULT NULL,                --Deployment status
       status  varchar(512)  DEFAULT NULL,                      --status
       lcm_token  varchar(1024)  DEFAULT NULL,                  --lcm token
       create_time   timestamptz(6)  DEFAULT NULL,              --Creation time
       log  text  DEFAULT NULL,                                 --Log
      CONSTRAINT  tbl_vm_image_config_pkey  PRIMARY KEY ( vm_id )
    );
```






