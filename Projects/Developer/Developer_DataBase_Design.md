Developer DataBase Design
============

Developer数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。**PostgreSQL** 是开源的对象-关系数据库服务器(ORDBMS)，在灵活的BSD许可证下发行。进一步了解PostgreSQL可以点击[这里](https://www.runoob.com/postgresql/postgresql-tutorial.html)。

- **tbl_plugin** 存储开发者上传的插件信息，如名字、满意度、插件保存路径等
```
  CREATE TABLE IF NOT EXISTS tbl_plugin (
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

- **tbl_downloadrecord** 存储插件的下载记录，一个插件对应对应多条下载记录
```
  CREATE TABLE IF NOT EXISTS tbl_downloadrecord (
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

- **tbl_app_project** 存储开发者在开发者平台自构建的应用项目的信息
```
  CREATE TABLE IF NOT EXISTS  tbl_app_project  (
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

- **tbl_project_image** 存储开发者在开发者平台对自构建的应用项目进行部署测试时，开发者上传或者填写的镜像信息，一个项目的可以利用不同的镜像构建多次
```
  CREATE TABLE IF NOT EXISTS  tbl_project_image  (
       id                 varchar(255)       NOT NULL,           --image ID
       image_info         text               DEFAULT NULL,       --Store image information
       project_id         varchar(255)       DEFAULT NULL,       --Project ID (corresponding to the id in tbl_app_project)
       helm_chart_file_id varchar(255)       DEFAULT NULL,       --id of uoloaded deploy yaml
      CONSTRAINT  tbl_project_image_pkey  PRIMARY KEY ( id )
  );
```
- **tbl_container_image** 存储开发者在开发者平台上传容器镜像包时，生成的容器镜像信息
```
  CREATE TABLE IF NOT EXISTS  tbl_container_image  (
       image_id           varchar(255)       NOT NULL,           --image ID
       image_name         varchar(255)       NOT NULL,           --image name
       image_version      varchar(255)       NOT NULL,           --image version
       user_id            varchar(255)       NOT NULL,           --the author id of upload container image
       user_name          varchar(255)       NOT NULL,           --the author name of upload container image
       upload_time        timestamptz(0)     DEFAULT NULL,       --upload image time
       create_time        timestamptz(0)     DEFAULT NULL,       --create db record time
       image_status       varchar(255)       DEFAULT NULL,       --image status
       image_type         varchar(255)       DEFAULT NULL,       --image type(private or public)
       image_path         text               DEFAULT NULL,       --image info(xxxx:xxx)
       file_name         varchar(255)       DEFAULT NULL,       --image type(private or public)
       CONSTRAINT tbl_container_image_uniqueName UNIQUE (image_name,image_version,user_name),
       CONSTRAINT tbl_container_image_pkey PRIMARY KEY (image_id)
  );
```
- **tbl_app_project_capability** 开发者新建容器应用项目时，选择平台能力（此表是项目和能力之间的关联表）
```
  CREATE TABLE IF NOT EXISTS  tbl_app_project_capability  (
       project_id         varchar(50)        NOT NULL,           --project_id
       capability_id      varchar(50)        NOT NULL,           --capability id
       CONSTRAINT tbl_app_project_capability_pkey PRIMARY KEY (project_id,capability_id)
  );
```
- **tbl_capability_group** 开发者新建容器应用项目时，选择平台能力（能力分类表）
```
  CREATE TABLE IF NOT EXISTS  tbl_capability_group  (
       id             varchar(50)         NOT NULL,         --group id
       name           varchar(255)        DEFAULT NULL,     --capability group zh name
       name_en        varchar(255)        DEFAULT NULL,     --capability group en name
       type           varchar(20)         DEFAULT NULL,     --capability group type(openmep or openmep_eco)
       description    text                DEFAULT NULL,     --capability group desc
       description_en text                DEFAULT NULL,     --capability group en desc
       icon_file_id   varchar(50)         DEFAULT NULL,     --group icon
       author         varchar(50)         DEFAULT NULL,     --the author of create group
       update_time    bigint              NOT NULL DEFAULT 0,       --update db record time
       create_time    bigint              NOT NULL DEFAULT 0,       --create db record time
       CONSTRAINT tbl_capability_group_pkey PRIMARY KEY (id)
  );
```
- **tbl_capability** 开发者新建容器应用项目时，选择平台能力（能力详情表）
```
  CREATE TABLE IF NOT EXISTS  tbl_capability  (
       id                varchar(50)         NOT NULL,         --capability id
       name              varchar(100)        DEFAULT NULL,     --capability  zh name
       name_en           varchar(100)        DEFAULT NULL,     --capability  en name
       version           varchar(100)        DEFAULT NULL,     --capability  version
       description       text                DEFAULT NULL,     --capability  desc
       description_en    text                DEFAULT NULL,     --capability  en desc
       provider          varchar(100)        DEFAULT NULL,     --capability  provider
       api_file_id       varchar(255)        DEFAULT NULL,     --capability api file
       guide_file_id     varchar(255)        DEFAULT NULL,     --capability guide file
       guide_file_id_en  varchar(255)        DEFAULT NULL,     --capability guide file(en version)
       upload_time       varchar(50)         NOT NULL,         --create capability time
       host              varchar(50)         DEFAULT NULL,     --registered service name
       port              int4                DEFAULT NULL,     --service port
       protocol          varchar(20)         DEFAULT NULL,     --http,https
       app_id            varchar(255)        DEFAULT NULL,     --id posted to appstore
       package_id        varchar(255)        DEFAULT NULL,     --the packageId published to the appstore
       user_id           varchar(255)        DEFAULT NULL,     --the author id of create this capability
       select_count      integer             NOT NULL DEFAULT 0, --the number of select this capability
       icon_file_id      varchar(50)         DEFAULT NULL,     --capability icon file
       author            varchar(50)         DEFAULT NULL,     --the author name of create this capability
       experience_url    text                DEFAULT NULL,     --the access url of capability
       CONSTRAINT tbl_capability_pkey PRIMARY KEY (id)
  );
```

- **tbl_project_test_config** 存储开发者在开发者平台对自构建的应用项目进行部署测试的配置信息，包括镜像、服务器等，一个项目可以多次配置测试项进行部署测试
```
  CREATE TABLE IF NOT EXISTS  tbl_project_test_config  (
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

- **tbl_service_host** 存储开发者在开发者平台对自构建的应用项目进行部署测试时，可供选择的服务器信息
```
  CREATE TABLE IF NOT EXISTS  tbl_service_host  (
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
       vnc_port          int4           DEFAULT 22,      --The exposed connection port of the server deploying the edge application
       parameter         text           DEFAULT NULL,    --sandbox parameter
       delete            bool           DEFAULT NULL,    --delete or not  
       resource          text           DEFAULT NULL     --Sandbox hardware information 
  );
```

- **tbl_uploaded_file** 存储开发者在开发者平台对自构建的应用项目进行部署测试时，上传的图标、镜像、api等文件信息
```
  CREATE TABLE IF NOT EXISTS  tbl_uploaded_file  (
       file_id         varchar(50)      NOT NULL,       --File ID
       file_name       varchar(255)     DEFAULT NULL,   --file name
       is_temp         bool             DEFAULT NULL,   --Is it a temporary file
       user_id         varchar(50)      DEFAULT NULL,   --ID of the user who uploaded the file
       upload_date     timestamptz(6)   DEFAULT NULL,   --Upload time
       file_path       varchar(255)     DEFAULT NULL,   --file path
      CONSTRAINT  tbl_uploaded_file_pkey  PRIMARY KEY ( file_id )
  );
```

- **tbl_helm_template_yaml** 存储开发者在开发者平台对自构建的应用项目进行部署测试时，上传的Helm yaml文件信息(目前版本通过yaml部署)，一个项目可以通过不同的yaml文件进行多次部署测试
```
  CREATE TABLE IF NOT EXISTS  tbl_helm_template_yaml  (
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

- **tbl_host_log** 记录app项目在边缘节点上部署的日志
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

- **tbl_release_config** 存储应用发布对应的配置信息
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

- **tbl_vm_regulation** 虚机规则，虚机属性说明（虚机部署时提供选择）
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

- **tbl_vm_network** 虚机网络配置
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_network  (
       network_type  varchar(50) DEFAULT NULL,    --Network Type
       description_zh  varchar(255) DEFAULT NULL, --Network Chinese description
       description_en  varchar(255) DEFAULT NULL, --English description of the network
       network_name  varchar(50) DEFAULT NULL     --Network name
    );
```

- **tbl_vm_system** 虚机系统属性说明
```
  CREATE TABLE IF NOT EXISTS  tbl_vm_system  (
       system_id  SERIAL,                          --System id
       system_name varchar(128) DEFAULT NULL,      --system vm name
       type  varchar(50) DEFAULT NULL,             --System type
       operate_system  varchar(50) DEFAULT NULL,   --system name
       version  varchar(50) NOT NULL DEFAULT NULL, --system version
       system_bit  varchar(50) DEFAULT NULL,       --System size
       system_disk  int4  DEFAULT NULL             --System disk description
       user_id varchar(50) DEFAULT NULL,           --author id or create db record
       user_name varchar(50) DEFAULT NULL,         --author name or create db record
       create_time timestamptz(6)  DEFAULT NULL,   --create time
       modify_time timestamptz(6)  DEFAULT NULL,   --update time
       system_format varchar(50) DEFAULT NULL,     --vm image format
       system_size bigint DEFAULT NULL,            --vm image size
       system_slim varchar(50) DEFAULT NULL,       --vm image size then slim
       upload_time timestamptz(6)  DEFAULT NULL,   --vm image upload time
       system_path varchar(128) DEFAULT NULL,      --uploaded vm image path
       file_name varchar(128) DEFAULT NULL,        --uploaded vm image file name
       file_md5 varchar(128) DEFAULT NULL,         --uploaded vm image file md5 value
       status varchar(50) DEFAULT NULL,            --vm image status
       file_identifier varchar(128) DEFAULT NULL,  --uploaded vm image file identifier
       error_type varchar(32) DEFAULT NULL,        -- the type when upload vm image fail
       CONSTRAINT tbl_vm_system_uniqueName UNIQUE (system_name,user_id),
       CONSTRAINT tbl_vm_system_pkey PRIMARY KEY (system_id)
    );
```

- **tbl_project_vm_create_config** app项目虚机部署，创建虚机的配置说明
```
    CREATE TABLE IF NOT EXISTS  tbl_project_vm_create_config  (
       vm_id   varchar(255) NOT NULL DEFAULT NULL,                 --Virtual machine id
       project_id  varchar(50) DEFAULT NULL,                       --Project id
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
       CONSTRAINT  tbl_project_vm_create_config_pkey  PRIMARY KEY ( vm_id )
    );
```

- **tbl_project_vm_image_config** app项目虚机部署，镜像配置说明
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
      CONSTRAINT  tbl_project_vm_image_config_pkey  PRIMARY KEY ( vm_id )
    );
```
- **tbl_vm_user_data** app项目虚机部署，存储的部署用户的信息
```
    CREATE TABLE IF NOT EXISTS  tbl_vm_user_data  (
       operate_system   varchar(50)  DEFAULT NULL,              --vm system type
       flavor_extra_specs  text DEFAULT NULL,                   --user config flavor
       is_temp  bool DEFAULT NULL,                              --Determine whether the user is a temporary configuration
       contents  text  DEFAULT NULL,                            --user config content
       params  text  DEFAULT NULL,                              --user config param
      CONSTRAINT  tbl_vm_user_data_pkey  PRIMARY KEY ( operate_system )
    );
```

- **tbl_project_vm_package_config** app项目虚机部署，生成虚机包所需的配置信息
```
    CREATE TABLE IF NOT EXISTS tbl_project_vm_package_config (
      id varchar(50) DEFAULT NULL,                              --id
      project_id varchar(50) DEFAULT NULL,                      --project id
      vm_regulation_desc text DEFAULT NULL,                     --Rule information required to generate sequel package
      vm_system_desc text DEFAULT NULL,                         --vm image config info
      vm_network_desc text DEFAULT NULL,                        --vm network config info
      vm_user_data text DEFAULT NULL,                           --user config
      vm_name varchar(500) DEFAULT NULL,                        --vm name
      ak text DEFAULT NULL,                                     --user config param
      sk text DEFAULT NULL,                                     --user config param
      app_instance_id varchar(50) DEFAULT NULL,                 --instance id of generate vm pkg
      create_time timestamptz(6) DEFAULT NULL,                  --create time
      CONSTRAINT tbl_project_vm_package__uniqueProjectId UNIQUE (project_id),
      CONSTRAINT tbl_project_vm_package_config_pkey PRIMARY KEY (id)
    );
```


Developer DataBase Design v1.5
============

- **tbl_container_image**容器镜像管理
```
    CREATE TABLE IF NOT EXISTS "tbl_container_image" (
    "image_id" varchar(255) NOT NULL,
    "image_name" varchar(255) NOT NULL,
    "image_version" varchar(255) NOT NULL,
    "user_id" varchar(255) NOT NULL,
    "user_name" varchar(255) NOT NULL,
    "upload_time" timestamptz(0) DEFAULT NULL,
    "create_time" timestamptz(0) DEFAULT NULL,
    "image_status" varchar(255) DEFAULT NULL,
    "image_type" varchar(255) DEFAULT NULL,
    "image_path" text DEFAULT NULL,
    "file_name" varchar(255) DEFAULT NULL,
    CONSTRAINT  "tbl_container_image_uniqueName" UNIQUE ("image_name","image_version","user_name"),
    CONSTRAINT "tbl_container_image_pkey" PRIMARY KEY ("image_id")
    );
```
- **tbl_app_traffic_rule**流量规则配置
```
    CREATE TABLE IF NOT EXISTS "tbl_app_traffic_rule" (
    "app_id" varchar(255) NOT NULL,
    "traffic_rule_id" varchar(255) NOT NULL,
    "action" varchar(255) DEFAULT NULL,
    "priority" int4 DEFAULT NULL,
    "filter_type" varchar(255) DEFAULT NULL,
    "traffic_filter" text DEFAULT NULL,
    "dst_interface" text DEFAULT NULL,
    CONSTRAINT  "tbl_app_traffic_rule_unique_id_traffic_rule" UNIQUE ("app_id","traffic_rule_id")
    );
```
- **tbl_app_dns_rule**分流规则配置
```
    CREATE TABLE IF NOT EXISTS "tbl_app_dns_rule" (
    "app_id" varchar(255) NOT NULL,
    "dns_rule_id" varchar(255) NOT NULL,
    "domain_name" varchar(255) DEFAULT NULL,
    "ip_address_type" varchar(255) DEFAULT NULL,
    "ip_address" varchar(255) DEFAULT NULL,
    "ttl" varchar(255) DEFAULT NULL,
    CONSTRAINT  "tbl_app_dns_rule_unique_id_dns_rule" UNIQUE ("app_id","dns_rule_id")
    );
```
- **tbl_app_service_produced**能力发布配置
```
    CREATE TABLE IF NOT EXISTS "tbl_app_service_produced" (
    "app_id" varchar(50) NOT NULL,
    "app_service_produced_id" varchar(50) NOT NULL,
    "one_level_name" varchar(100) NOT NULL,
    "one_level_name_en" varchar(100) NOT NULL,
    "two_level_name" varchar(100) NOT NULL,
    "description" varchar(500) NOT NULL,
    "api_file_id" varchar(50) NOT NULL,
    "guide_file_id" varchar(50) NOT NULL,
    "icon_file_id" varchar(50) NOT NULL,
    "service_name" varchar(50) NOT NULL,
    "internal_port" int4 NOT NULL,
    "version" varchar(30) NOT NULL,
    "protocol" varchar(30) NOT NULL,
    "author" varchar(50) NOT NULL,
    "experience_url" varchar(500) DEFAULT NULL,
    "dns_rule_id_list" text DEFAULT NULL,
    "traffic_rule_id_list" text DEFAULT NULL,
    CONSTRAINT  "tbl_app_service_produced_unique_id_name" UNIQUE ("app_id","service_name")
    );

- **tbl_app_service_required*服务依赖配置
```
    CREATE TABLE IF NOT EXISTS "tbl_app_service_required" (
    "app_id" varchar(255) NOT NULL,
    "id" varchar(255) NOT NULL,
    "one_level_name" varchar(255) NOT NULL,
    "one_level_name_en" varchar(255) NOT NULL,
    "two_level_name" varchar(255) NOT NULL,
    "two_level_name_en" varchar(255) NOT NULL,
    "ser_name" varchar(255) NOT NULL,
    "version" varchar(255) DEFAULT NULL,
    "requested_permissions" bool DEFAULT NULL,
    "ser_app_id" varchar(255) DEFAULT NULL,
    "package_id" varchar(255) DEFAULT NULL,
    CONSTRAINT  "tbl_app_service_required_unique_id_name" UNIQUE ("app_id","ser_name")
    );
- **tbl_app_certificate*认证配置
```
    CREATE TABLE IF NOT EXISTS "tbl_app_certificate" (
    "app_id" varchar(255) NOT NULL,
    "ak" text DEFAULT NULL,
    "sk" text DEFAULT NULL,
    CONSTRAINT "tbl_app_certificate_pkey" PRIMARY KEY ("app_id")
    );

- **tbl_application*创建应用配置
```
    CREATE TABLE IF NOT EXISTS "tbl_application" (
    "id" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(255) DEFAULT NULL,
    "version" varchar(255) NOT NULL,
    "provider" varchar(255) NOT NULL,
    "architecture" varchar(255) DEFAULT NULL,
    "app_class" varchar(255) DEFAULT NULL,
    "type" varchar(255) DEFAULT NULL,
    "industry" varchar(255) DEFAULT NULL,
    "icon_file_id" varchar(255) DEFAULT NULL,
    "guide_file_id" varchar(255) DEFAULT NULL,
    "app_create_type" varchar(255) DEFAULT NULL,
    "create_time" timestamptz(6)  DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "user_id" varchar(255) DEFAULT NULL,
    "user_name" varchar(255) DEFAULT NULL,
    "mep_host_id" varchar(255) DEFAULT NULL,
    CONSTRAINT  "tbl_application_unique_name_version" UNIQUE ("name","version"),
    CONSTRAINT "tbl_application_pkey" PRIMARY KEY ("id")
    );
- **tbl_application*创建应用配置
```
    CREATE TABLE IF NOT EXISTS "tbl_container_helm_chart" (
    "id" varchar(255) NOT NULL,
    "app_id" varchar(255) NOT NULL,
    "name" varchar(255) DEFAULT NULL,
    "helm_chart_file_id" text DEFAULT NULL,
    CONSTRAINT "tbl_container_helm_chart_pkey" PRIMARY KEY ("id")
    );
- **tbl_vm*创建虚机配置
```
    CREATE TABLE IF NOT EXISTS "tbl_vm" (
    "id" varchar(255) NOT NULL,
    "app_id" varchar(255) DEFAULT NULL,
    "name" varchar(255) NOT NULL,
    "flavor_id" varchar(255) DEFAULT NULL,
    "image_id" int4 DEFAULT NULL,
    "target_image_id" int4 DEFAULT NULL,
    "user_data" text DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "area_zone" varchar(255) DEFAULT NULL,
    "flavor_extra_specs"  text DEFAULT NULL,
    CONSTRAINT "tbl_vm_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_network" (
    "id" varchar(255) NOT NULL,
    "app_id" varchar(255) DEFAULT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(255) DEFAULT NULL,
    CONSTRAINT "tbl_network_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_port" (
    "id" varchar(255) NOT NULL,
    "vm_id" varchar(255) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "description" varchar(255) DEFAULT NULL,
    "network_name" varchar(255) DEFAULT NULL,
    CONSTRAINT "tbl_vm_port_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_certificate" (
    "vm_id" varchar(255) DEFAULT NULL,
    "certificate_type" varchar(255) NOT NULL,
    "pwd_certificate" text DEFAULT NULL,
    "key_pair_certificate" text DEFAULT NULL,
    CONSTRAINT "tbl_vm_certificate_pkey" PRIMARY KEY ("vm_id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_flavor" (
    "id" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(255) DEFAULT NULL,
    "architecture" varchar(255) DEFAULT NULL,
    "cpu" text DEFAULT NULL,
    "memory" varchar(255) DEFAULT NULL,
    "system_disk_size" int4 DEFAULT NULL,
    "data_disk_size"  int4 DEFAULT NULL,
    "gpu_extra_info" text DEFAULT NULL,
    "other_extra_info" text DEFAULT NULL,
    CONSTRAINT "tbl_vm_flavor_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_image" (
    "id" SERIAL,
    "name" varchar(255) NOT NULL,
    "visible_type" varchar(255) DEFAULT NULL,
    "os_type" varchar(255) DEFAULT NULL,
    "os_version" varchar(255) DEFAULT NULL,
    "os_bit_type" varchar(255) DEFAULT NULL,
    "system_disk_size" int4 DEFAULT NULL,
    "image_file_name" varchar(255) DEFAULT NULL,
    "image_format" varchar(255) DEFAULT NULL,
    "down_load_url" varchar(255) DEFAULT NULL,
    "file_md5" varchar(255) DEFAULT NULL,
    "image_size" bigint DEFAULT NULL,
    "image_slim_status" varchar(50) DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "create_time" timestamptz(6)  DEFAULT NULL,
    "modify_time" timestamptz(6)  DEFAULT NULL,
    "upload_time" timestamptz(6)  DEFAULT NULL,
    "user_id" varchar(255) DEFAULT NULL,
    "user_name" varchar(255) DEFAULT NULL,
    "file_identifier" varchar(128) DEFAULT NULL,
    "error_type" varchar(32) DEFAULT NULL,
    CONSTRAINT "tbl_vm_image_uniqueName" UNIQUE ("name","user_id"),
    CONSTRAINT "tbl_vm_image_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_instantiate_info" (
    "vm_id" varchar(255) NOT NULL,
    "operation_id" varchar(255) DEFAULT NULL,
    "app_package_id" varchar(255) DEFAULT NULL,
    "distributed_mec_host" varchar(255) DEFAULT NULL,
    "mepm_package_id" varchar(255) DEFAULT NULL,
    "app_instance_id" varchar(255) DEFAULT NULL,
    "vm_instance_id" varchar(255) DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "vnc_url" varchar(255) DEFAULT NULL,
    "log" text DEFAULT NULL,
    "instantiate_time" timestamptz(6)  DEFAULT NULL,
    CONSTRAINT "tbl_vm_instantiate_info_pkey" PRIMARY KEY ("vm_id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_port_instantiate_info" (
    "vm_id" varchar(255) NOT NULL,
    "network_name" varchar(255) NOT NULL,
    "ip_address" varchar(255) DEFAULT NULL,
    CONSTRAINT  "tbl_vm_port_instantiate_info_unique_id_name" UNIQUE ("vm_id","network_name")
    );

    CREATE TABLE IF NOT EXISTS "tbl_vm_image_export_info" (
    "vm_id" varchar(255) NOT NULL,
    "operation_id" varchar(255) DEFAULT NULL,
    "image_instance_id" varchar(255) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "image_file_name" varchar(255) DEFAULT NULL,
    "format" varchar(255) DEFAULT NULL,
    "download_url" varchar(255) DEFAULT NULL,
    "check_sum" varchar(255) DEFAULT NULL,
    "image_size" varchar(255) DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "log" text DEFAULT NULL,
    "create_time" timestamptz(6)  DEFAULT NULL,
    CONSTRAINT "tbl_vm_image_export_info_pkey" PRIMARY KEY ("vm_id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_container_app_instantiate_info" (
    "app_id" varchar(255) NOT NULL,
    "app_package_id" varchar(255) DEFAULT NULL,
    "distributed_mec_host" varchar(255) DEFAULT NULL,
    "app_instance_id" varchar(255) DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "log" text DEFAULT NULL,
    "instantiate_time" timestamptz(6)  DEFAULT NULL,
    CONSTRAINT "tbl_container_app_instantiate_info_pkey" PRIMARY KEY ("app_id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_k8s_pod_instantiate_info" (
    "name" varchar(255) NOT NULL,
    "app_id" varchar(255) NOT NULL,
    "pod_status" varchar(255) DEFAULT NULL,
    "events_info" text DEFAULT NULL,
    CONSTRAINT  "tbl_k8s_pod_instantiate_info_unique_id_name" UNIQUE ("app_id","name")
    );

    CREATE TABLE IF NOT EXISTS "tbl_container_instantiate_info" (
    "name" varchar(255) NOT NULL,
    "pod_name" varchar(255) NOT NULL,
    "cpu_usage" varchar(255) DEFAULT NULL,
    "mem_usage" varchar(255) DEFAULT NULL,
    "disk_usage" varchar(255) DEFAULT NULL,
    CONSTRAINT  "tbl_container_instantiate_info_unique_id_name" UNIQUE ("pod_name","name")
    );

    CREATE TABLE IF NOT EXISTS "tbl_k8s_service_instantiate_info" (
    "name" varchar(255) NOT NULL,
    "app_id" varchar(255) NOT NULL,
    "type" varchar(255) DEFAULT NULL,
    CONSTRAINT "tbl_k8s_service_instantiate_info_pkey" PRIMARY KEY ("name")
    );

    CREATE TABLE IF NOT EXISTS "tbl_k8s_service_port_instantiate_info" (
    "port" varchar(255) NOT NULL,
    "service_name" varchar(255) NOT NULL,
    "target_port" varchar(255) DEFAULT NULL,
    "node_port" varchar(255) DEFAULT NULL,
    CONSTRAINT "tbl_k8s_service_port_instantiate_info_pkey" PRIMARY KEY ("service_name")
    );

    CREATE TABLE IF NOT EXISTS "tbl_operation_status" (
    "id" varchar(255) NOT NULL,
    "user_name" varchar(255) NOT NULL,
    "object_type" varchar(255) DEFAULT NULL,
    "object_id" varchar(255) DEFAULT NULL,
    "object_name" varchar(255) DEFAULT NULL,
    "operation_name" varchar(255) DEFAULT NULL,
    "progress" int4 DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "error_msg" text DEFAULT NULL,
    "create_time" timestamptz(6) DEFAULT NULL,
    "update_time" timestamptz(6)  DEFAULT NULL,
    CONSTRAINT "tbl_operation_status_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_action_status" (
    "id" varchar(255) NOT NULL,
    "operation_id" varchar(255) NOT NULL,
    "object_type" varchar(255) DEFAULT NULL,
    "object_id" varchar(255) DEFAULT NULL,
    "action_name" varchar(255) DEFAULT NULL,
    "progress" int4 DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "error_msg" text DEFAULT NULL,
    "status_log" text DEFAULT NULL,
    "update_time" timestamptz(6)  DEFAULT NULL,
    CONSTRAINT "tbl_action_status_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_app_package" (
    "id" varchar(255) NOT NULL,
    "app_id" varchar(255) NOT NULL,
    "package_file_name" varchar(255) DEFAULT NULL,
    CONSTRAINT "tbl_app_package_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_atp_test_task" (
    "id" varchar(255) NOT NULL,
    "app_id" varchar(255) NOT NULL,
    "app_name" varchar(255) DEFAULT NULL,
    "status" varchar(255) DEFAULT NULL,
    "create_time" varchar(255)  DEFAULT NULL,
    CONSTRAINT "tbl_atp_test_task_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_reverse_proxy" (
    "id" varchar(255) NOT NULL,
    "dest_host_id" varchar(255) NOT NULL,
    "dest_host_port" int4 NOT NULL,
    "proxy_port" int4 NOT NULL,
    "type" int4 NOT NULL,
    CONSTRAINT "tbl_reverse_proxy_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_profile" (
    "id" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" varchar(255) DEFAULT NULL,
    "description_en" varchar(255) DEFAULT NULL,
    "file_path" varchar(255) NOT NULL,
    "deploy_file_path" TEXT NOT NULL,
    "config_file_path" varchar(255) DEFAULT NULL,
    "seq" varchar(255) NOT NULL,
    "create_time" timestamptz(6)  NOT NULL,
    "type" varchar(255) NOT NULL,
    "industry" varchar(255) NOT NULL,
    "topo_file_path" varchar(255) DEFAULT NULL,
    CONSTRAINT "tbl_profile_pkey" PRIMARY KEY ("id")
    );

    CREATE TABLE IF NOT EXISTS "tbl_app_script" (
    "id" varchar(255) NOT NULL,
    "app_id" varchar(255) NOT NULL,
    "name" varchar(255) DEFAULT NULL,
    "script_file_id" text DEFAULT NULL,
    "create_time" timestamptz(6)  NOT NULL,
    CONSTRAINT "tbl_app_script_pkey" PRIMARY KEY ("id")
    );