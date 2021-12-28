Developer DataBase Design v1.5
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
       file_name          varchar(255)       DEFAULT NULL,       --image type(private or public)
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

- **tbl_mep_host** 存储开发者在开发者平台对自构建的应用项目进行部署测试时，可供选择的服务器（测试沙箱）信息
```
  CREATE TABLE IF NOT EXISTS  tbl_mep_host  (
       host_id                 varchar(50)    NOT NULL,        --Server id
	   name                    varchar(100)   DEFAULT NULL,    --server name
       lcm_ip                  varchar(20)    DEFAULT NULL,    --lcm IP address
	   lcm_protocol            varchar(20)    DEFAULT NULL,    --lcm protocol
	   lcm_port                int4           DEFAULT '-1',    --lcm port
       architecture            varchar(100)   DEFAULT NULL,    --architecture
	   status                  varchar(20)    DEFAULT NULL,    --status
	   mec_host_ip             varchar(20)    DEFAULT NULL,    --mec host address
	   vim_type                varchar(255)   DEFAULT NULL,    --Operating system name
	   mec_host_user_name      varchar(50)    DEFAULT NULL,    --User name required to log in to the host  
	   mec_host_password       varchar(50)    DEFAULT NULL,    --Password required to log in to the host
	   mec_host_port           int4           DEFAULT 22,      --The exposed connection port of the server deploying the edge application
       user_id                 varchar(50)    DEFAULT NULL，   --UserId
	   config_file_id          varchar(50)    DEFAULT NULL，   --config file id
	   net_work_parameter      text           DEFAULT NULL,    --sandbox parameter 
	   resource                text           DEFAULT NULL     --Sandbox hardware information 
       address                 varchar(255)   DEFAULT NULL,    --address     
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

- **tbl_host_log** 记录app项目在边缘节点上部署的日志
```
   CREATE TABLE IF NOT EXISTS  tbl_host_log  (
       log_id           varchar(50) NOT NULL,              --Log ID
       host_ip          varchar(50) NOT NULL,              --host IP
       user_name        varchar(50) DEFAULT NULL,          --username
       user_id          varchar(50) DEFAULT NULL,          --User ID
       project_id       varchar(50) DEFAULT NULL,          --Project ID
       project_name     varchar(50) DEFAULT NULL,          --project name
       app_instances_id varchar(50) DEFAULT NULL,          --The instance ID of the app project
       deploy_time      varchar(50) DEFAULT NULL,          --Project deployment time
       status           varchar(50) DEFAULT NULL,          --host status
       operation        varchar(50) DEFAULT NULL,          --operating
       host_id          varchar(50) DEFAULT NULL           --host ID
    );   
```

- **tbl_api_emulator** 平台能力调用模拟器
```
   CREATE TABLE IF NOT EXISTS  tbl_api_emulator  (
       id             varchar(50) NOT NULL,        --id
       user_id        varchar(50) NOT NULL,        --host IP
       host_id        varchar(50) NOT NULL,        --username
       port           int4 NOT NULL,               --port
	   workload_id    varchar(50) NOT NULL,        --work load id
	   create_time    varchar(50) NOT NULL,        --create tine
    );   
```

- **tbl_app_traffic_rule** 流量规则配置
```
   CREATE TABLE IF NOT EXISTS tbl_app_traffic_rule (
       app_id              varchar(255) NOT NULL,      --application id
       traffic_rule_id     varchar(255) NOT NULL,      --primary key
       action              varchar(255) DEFAULT NULL,  --action
       priority            int4 DEFAULT NULL,          --priority
       filter_type         varchar(255) DEFAULT NULL,  --filter type
       traffic_filter      text DEFAULT NULL,          --traffic filter
       dst_interface       text DEFAULT NULL,          -- dst interface
       CONSTRAINT  tbl_app_traffic_rule_unique_id_traffic_rule UNIQUE (app_id,traffic_rule_id)
    );
```

- **tbl_app_dns_rule** 分流规则配置
```
   CREATE TABLE IF NOT EXISTS tbl_app_dns_rule (
       app_id            varchar(255) NOT NULL,        --application id
       dns_rule_id       varchar(255) NOT NULL,        --primary key
       domain_name       varchar(255) DEFAULT NULL,    --domain name
       ip_address_type   varchar(255) DEFAULT NULL,    --ip type
       ip_address        varchar(255) DEFAULT NULL,    --ip
       ttl               varchar(255) DEFAULT NULL,    --ttl
       CONSTRAINT  tbl_app_dns_rule_unique_id_dns_rule UNIQUE (app_id,dns_rule_id)
    );
```

- **tbl_app_service_produced** 能力发布配置
```
   CREATE TABLE IF NOT EXISTS tbl_app_service_produced (
      app_id                     varchar(50) NOT NULL,     --application id
      app_service_produced_id    varchar(50) NOT NULL,     --primary key
      one_level_name             varchar(100) NOT NULL,    --one level capability name
      one_level_name_en          varchar(100) NOT NULL,    --one level english capability name
      two_level_name             varchar(100) NOT NULL,    --two level capability name
      description                varchar(500) NOT NULL,    --two level english capability name
      api_file_id                varchar(50) NOT NULL,     --api file
      guide_file_id              varchar(50) NOT NULL,     --guide file
      icon_file_id               varchar(50) NOT NULL,     --icon file
      service_name               varchar(50) NOT NULL,     --service name
      internal_port              int4 NOT NULL,            --service port
      version                    varchar(30) NOT NULL,     --service version
      protocol                   varchar(30) NOT NULL,     --service protocol
      author                     varchar(50) NOT NULL,     --create author
      experience_url             varchar(500) DEFAULT NULL,--service experience url
      dns_rule_id_list           text DEFAULT NULL,        --dns list
      traffic_rule_id_list       text DEFAULT NULL,        --traffic list
      CONSTRAINT  tbl_app_service_produced_unique_id_name UNIQUE (app_id,service_name)
   );
 ```
   
- **tbl_app_service_required** 服务依赖配置
```
   CREATE TABLE IF NOT EXISTS tbl_app_service_required (
      app_id                   varchar(255) NOT NULL,       --application id
      id                       varchar(255) NOT NULL,       --primary key
      one_level_name           varchar(255) NOT NULL,       --one level capability name
      one_level_name_en        varchar(255) NOT NULL,       --one level english capability name
      two_level_name           varchar(255) NOT NULL,       --two level capability name
      two_level_name_en        varchar(255) NOT NULL,       --two level english capability name
      ser_name                 varchar(255) NOT NULL,       --service name
      version                  varchar(255) DEFAULT NULL,   --service version
      requested_permissions    bool DEFAULT NULL,           --need permission
      ser_app_id               varchar(255) DEFAULT NULL,   --service application id 
      package_id               varchar(255) DEFAULT NULL,   -- package id
      CONSTRAINT  tbl_app_service_required_unique_id_name UNIQUE (app_id,ser_name)
    );
```

- **tbl_app_certificate** 认证配置
```
   CREATE TABLE IF NOT EXISTS tbl_app_certificate (
       app_id      varchar(255) NOT NULL,   --application id
       ak          text DEFAULT NULL,       --ak
       sk          text DEFAULT NULL,       --sk
       CONSTRAINT tbl_app_certificate_pkey PRIMARY KEY (app_id)
    );
```

- **tbl_application** 项目（孵化应用）配置
```
   CREATE TABLE IF NOT EXISTS tbl_application (
      id              varchar(255) NOT NULL,          --application id
      name            varchar(255) NOT NULL,          --application name
      description     varchar(255) DEFAULT NULL,      --description
      version         varchar(255) NOT NULL,          --version
      provider        varchar(255) NOT NULL,          --application provider
      architecture    varchar(255) DEFAULT NULL,      --application architecture
      app_class       varchar(255) DEFAULT NULL,      --application class
      type            varchar(255) DEFAULT NULL,      --application type
      industry        varchar(255) DEFAULT NULL,      --industry
      icon_file_id    varchar(255) DEFAULT NULL,      --icon file
      guide_file_id   varchar(255) DEFAULT NULL,      --guide file
      app_create_type varchar(255) DEFAULT NULL,      --create type
      create_time     timestamptz(6)  DEFAULT NULL,   --create time
      status          varchar(255) DEFAULT NULL,      --application status
      user_id         varchar(255) DEFAULT NULL,      --user id
      user_name       varchar(255) DEFAULT NULL,      --user name
      mep_host_id     varchar(255) DEFAULT NULL,      --selected sandbox
      CONSTRAINT  tbl_application_unique_name_version UNIQUE (name,version),
      CONSTRAINT tbl_application_pkey PRIMARY KEY (id)
    );
```

- **tbl_container_helm_chart** 记录应用部署文件
```
   CREATE TABLE IF NOT EXISTS tbl_container_helm_chart (
      id                     varchar(255) NOT NULL,         --primary key
      app_id                 varchar(255) NOT NULL,         --application id
      name                   varchar(255) DEFAULT NULL,     --generate tgz name
      helm_chart_file_id     text DEFAULT NULL,             --upload file name
	  create_time            timestamptz(6)  DEFAULT NULL,  --create time
      helm_chart_file_list   text DEFAULT NULL,             --file list of tgz file
      CONSTRAINT tbl_container_helm_chart_pkey PRIMARY KEY (id)
   );
```

- **tbl_vm** 虚机配置
```
   CREATE TABLE IF NOT EXISTS tbl_vm (
      id                 varchar(255) NOT NULL,          --vm id
      app_id             varchar(255) DEFAULT NULL,      --application id
      name               varchar(255) NOT NULL,          --vm name
      flavor_id          varchar(255) DEFAULT NULL,      --vm flavor id
      image_id           int4 DEFAULT NULL,              --vm image
      target_image_id    int4 DEFAULT NULL,              --vm target image
      user_data          text DEFAULT NULL,              --user data
      status             varchar(255) DEFAULT NULL,      --vm status
      area_zone          varchar(255) DEFAULT NULL,      --deploy zone
      flavor_extra_specs text DEFAULT NULL,              -- flavor param
      CONSTRAINT tbl_vm_pkey PRIMARY KEY (id)
   );
```

- **tbl_network** 虚机网络配置
```
 CREATE TABLE IF NOT EXISTS tbl_network (
    id           varchar(255) NOT NULL,        --primary key
    app_id       varchar(255) DEFAULT NULL,    --application id
    name         varchar(255) NOT NULL,        --net name
    description  varchar(255) DEFAULT NULL,    --net description
    CONSTRAINT tbl_network_pkey PRIMARY KEY (id)
    );
```

- **tbl_vm_port** 虚机端口配置
```
CREATE TABLE IF NOT EXISTS tbl_vm_port (
    id            varchar(255) NOT NULL,         --primary key
    vm_id         varchar(255) DEFAULT NULL,     --vm id
    name          varchar(255) DEFAULT NULL,     --port name
    description   varchar(255) DEFAULT NULL,     --port description
    network_name  varchar(255) DEFAULT NULL,     --net name
    CONSTRAINT tbl_vm_port_pkey PRIMARY KEY (id)
    );
```

- **tbl_vm_certificate** 虚机证书配置
```
CREATE TABLE IF NOT EXISTS tbl_vm_certificate (
    vm_id                  varchar(255) DEFAULT NULL,   --vm id
    certificate_type       varchar(255) NOT NULL,       --vm certificate
    pwd_certificate        text DEFAULT NULL,           --password certificate
    key_pair_certificate   text DEFAULT NULL,           --key-valye certificate
    CONSTRAINT tbl_vm_certificate_pkey PRIMARY KEY (vm_id)
    );
```

- **tbl_vm_flavor** 虚机规格配置
```
CREATE TABLE IF NOT EXISTS tbl_vm_flavor (
    id                varchar(255) NOT NULL,      --primary key
    name              varchar(255) NOT NULL,      --flavor name
    description       varchar(255) DEFAULT NULL,  --description
    architecture      varchar(255) DEFAULT NULL,  --architecture
    cpu               text DEFAULT NULL,          --cpu param
    memory            varchar(255) DEFAULT NULL,  --memory param
    system_disk_size  int4 DEFAULT NULL,          --system disk size
    data_disk_size    int4 DEFAULT NULL,          --data disk size
    gpu_extra_info    text DEFAULT NULL,          --gpu info 
    other_extra_info  text DEFAULT NULL,          --other info
    CONSTRAINT tbl_vm_flavor_pkey PRIMARY KEY (id)
    );
```

- **tbl_vm_image** 虚机镜像管理
```
CREATE TABLE IF NOT EXISTS tbl_vm_image (
    id                SERIAL,                      --primary key
    name              varchar(255) NOT NULL,       --image name
    visible_type      varchar(255) DEFAULT NULL,   --visible type
    os_type           varchar(255) DEFAULT NULL,   --os type
    os_version        varchar(255) DEFAULT NULL,   --os version
    os_bit_type       varchar(255) DEFAULT NULL,   --os bit
    system_disk_size  int4 DEFAULT NULL,           --system disk size
    image_file_name   varchar(255) DEFAULT NULL,   --image file name
    image_format      varchar(255) DEFAULT NULL,   --image format
    down_load_url     varchar(255) DEFAULT NULL,   --download url
    file_md5          varchar(255) DEFAULT NULL,   --file md5
    image_size        bigint DEFAULT NULL,         --image size
    image_slim_status varchar(50) DEFAULT NULL,    --image slim size
    status            varchar(255) DEFAULT NULL,   --image status
    create_time       timestamptz(6) DEFAULT NULL, --create time
    modify_time       timestamptz(6) DEFAULT NULL, --modify time
    upload_time       timestamptz(6) DEFAULT NULL, --upload time
    user_id           varchar(255) DEFAULT NULL,   --user id
    user_name         varchar(255) DEFAULT NULL,   --user name
    file_identifier   varchar(128) DEFAULT NULL,   --file identifier
    error_type        varchar(32) DEFAULT NULL,    --error type
    CONSTRAINT tbl_vm_image_uniqueName UNIQUE (name,user_id),
    CONSTRAINT tbl_vm_image_pkey PRIMARY KEY (id)
    );
```

- **tbl_vm_instantiate_info** 虚机实例化信息表
```
CREATE TABLE IF NOT EXISTS tbl_vm_instantiate_info (
    vm_id                   varchar(255) NOT NULL,       --vm id
    operation_id            varchar(255) DEFAULT NULL,   --opreation(after launch vm) id
    app_package_id          varchar(255) DEFAULT NULL,   --vm package id
    distributed_mec_host    varchar(255) DEFAULT NULL,   --selected sandbox
    mepm_package_id         varchar(255) DEFAULT NULL,   --mepm package id
    app_instance_id         varchar(255) DEFAULT NULL,   --app package instance 
    vm_instance_id          varchar(255) DEFAULT NULL,   --vm instance
    status                  varchar(255) DEFAULT NULL,   --vm status
    vnc_url                 varchar(255) DEFAULT NULL,   --vm vnc url
    log                     text DEFAULT NULL,           --deploy log
    instantiate_time        timestamptz(6) DEFAULT NULL, --instantiate time
    CONSTRAINT tbl_vm_instantiate_info_pkey PRIMARY KEY (vm_id)
  );
```

- **tbl_vm_port_instantiate_info** 虚拟端口实例化信息表
```
   CREATE TABLE IF NOT EXISTS tbl_vm_port_instantiate_info (
       vm_id           varchar(255) NOT NULL,      --vm id
       network_name    varchar(255) NOT NULL,      --net name
       ip_address      varchar(255) DEFAULT NULL,  --ip
       CONSTRAINT  tbl_vm_port_instantiate_info_unique_id_name UNIQUE (vm_id,network_name)
   );
```

- **tbl_vm_image_export_info** 记录虚机镜像导出信息
```
 CREATE TABLE IF NOT EXISTS tbl_vm_image_export_info (
    vm_id                varchar(255) NOT NULL,        --vm id
    operation_id         varchar(255) DEFAULT NULL,    --operation id
    image_instance_id    varchar(255) DEFAULT NULL,    --image instance id
    name                 varchar(255) DEFAULT NULL,    --image name
    image_file_name      varchar(255) DEFAULT NULL,    --image file
    format               varchar(255) DEFAULT NULL,    --image format
    download_url         varchar(255) DEFAULT NULL,    --image download url
    check_sum            varchar(255) DEFAULT NULL,    --image sum
    image_size           varchar(255) DEFAULT NULL,    --image size
    status               varchar(255) DEFAULT NULL,    --image status
    log                  text DEFAULT NULL,            --image log
    create_time          timestamptz(6)  DEFAULT NULL, --create time
    CONSTRAINT tbl_vm_image_export_info_pkey PRIMARY KEY (vm_id)
    );
```

- **tbl_container_app_instantiate_info**  容器应用实例化信息表
```
  CREATE TABLE IF NOT EXISTS tbl_container_app_instantiate_info (
    app_id                       varchar(255) NOT NULL,        --application id
    operation_id                 varchar(255) NOT NULL,        --operation id
    app_package_id               varchar(255) DEFAULT NULL,    --app pkg
    distributed_mec_host         varchar(255) DEFAULT NULL,    --selected sandbox
    mepm_package_id              varchar(255) DEFAULT NULL,    --mepm package
	app_instance_id              varchar(255) DEFAULT NULL,    --app instance
	status                       varchar(255) DEFAULT NULL,    --deploy status
	log                          text DEFAULT NULL,            --deploy log
	instantiate_time             timestamptz(6)  DEFAULT NULL, --instantiate time
    CONSTRAINT  tbl_container_instantiate_info_unique_id_name UNIQUE (pod_name,name)
    );
```

- **tbl_k8s_pod_instantiate_info** 容器应用部署的pod实例化信息
```
   CREATE TABLE IF NOT EXISTS tbl_k8s_pod_instantiate_info (
       name            varchar(255) NOT NULL,      --pod name
       app_id          varchar(255) NOT NULL,      --application id
       pod_status      varchar(255) DEFAULT NULL,  --pod status
       events_info     text DEFAULT NULL,          --pod instantiate info
       CONSTRAINT  tbl_k8s_pod_instantiate_info_unique_id_name UNIQUE (app_id,name)
   );
```

- **tbl_container_instantiate_info** 容器实例化信息
```
  CREATE TABLE IF NOT EXISTS tbl_container_instantiate_info (
      name            varchar(255) NOT NULL,       --container name
      pod_name        varchar(255) NOT NULL,       --container pod name
      cpu_usage       varchar(255) DEFAULT NULL,   --cpu usage percent
      mem_usage       varchar(255) DEFAULT NULL,   --memory usage percent
      disk_usage      varchar(255) DEFAULT NULL,   --disk usage percent
      CONSTRAINT  tbl_container_instantiate_info_unique_id_name UNIQUE (pod_name,name)
    );
```

- **tbl_k8s_service_instantiate_info** 容器应用部署的Service实例化信息
```
  CREATE TABLE IF NOT EXISTS tbl_k8s_service_instantiate_info (
      name          varchar(255) NOT NULL,       --service name
      app_id        varchar(255) NOT NULL,       --application id
      type          varchar(255) DEFAULT NULL,   --service type
      CONSTRAINT tbl_k8s_service_instantiate_info_pkey PRIMARY KEY (name)
   );
```

- **tbl_k8s_service_port_instantiate_info** 容器应用部署的Service端口实例化信息
```
  CREATE TABLE IF NOT EXISTS tbl_k8s_service_port_instantiate_info (
    port             varchar(255) NOT NULL,       --svc port
    service_name     varchar(255) NOT NULL,       --svc name
    target_port      varchar(255) DEFAULT NULL,   --svc target port
    node_port        varchar(255) DEFAULT NULL,   --svc node port
    CONSTRAINT tbl_k8s_service_port_instantiate_info_pkey PRIMARY KEY (service_name)
    );
```

- **tbl_operation_status** 应用部署操作信息表
```
  CREATE TABLE IF NOT EXISTS tbl_operation_status (
    id                 varchar(255) NOT NULL,      --operation id
    user_name          varchar(255) NOT NULL,      --operation author
    object_type        varchar(255) DEFAULT NULL,  --operate object type
    object_id          varchar(255) DEFAULT NULL,  --operate object id
    object_name        varchar(255) DEFAULT NULL,  --operate object name
    operation_name     varchar(255) DEFAULT NULL,  --operation name
    progress           int4 DEFAULT NULL,          --operate progress
    status             varchar(255) DEFAULT NULL,  --status
    error_msg          text DEFAULT NULL,          --error msg
    create_time        timestamptz(6) DEFAULT NULL,     --create time
    update_time        timestamptz(6)  DEFAULT NULL,    --update time
    CONSTRAINT tbl_operation_status_pkey PRIMARY KEY (id)
    );
```

- **tbl_action_status** 应用部署action信息表
```
  CREATE TABLE IF NOT EXISTS tbl_action_status (
     id             varchar(255) NOT NULL,        --primary key
     operation_id   varchar(255) NOT NULL,        --operation id
     object_type    varchar(255) DEFAULT NULL,    --operate object type
     object_id      varchar(255) DEFAULT NULL,    --operate object id
     action_name    varchar(255) DEFAULT NULL,    --action name
     progress       int4 DEFAULT NULL,            --action progress
     status         varchar(255) DEFAULT NULL,    --action status
     error_msg      text DEFAULT NULL,            --err msg
     status_log     text DEFAULT NULL,            --action status log
     update_time    timestamptz(6)  DEFAULT NULL, --update time
     CONSTRAINT tbl_action_status_pkey PRIMARY KEY (id)
    );
```

- **tbl_app_package**  生成的应用包信息
```
   CREATE TABLE IF NOT EXISTS tbl_app_package (
       id                  varchar(255) NOT NULL,      --pkg id
       app_id              varchar(255) NOT NULL,      --application id
       package_file_name   varchar(255) DEFAULT NULL,  --package file name
	   package_file_path   varchar(500) DEFAULT NULL,  --package file path
       CONSTRAINT tbl_app_package_pkey PRIMARY KEY (id)
    );
```

- **tbl_atp_test_task**  应用包测试认证信息表
```
   CREATE TABLE IF NOT EXISTS tbl_atp_test_task (
    id           varchar(255) NOT NULL,      --task id
    app_id       varchar(255) NOT NULL,      --application id
    app_name     varchar(255) DEFAULT NULL,  --application name
    status       varchar(255) DEFAULT NULL,  --task status
    create_time  varchar(255)  DEFAULT NULL, --create time
    CONSTRAINT tbl_atp_test_task_pkey PRIMARY KEY (id)
    );
```

- **tbl_profile** profile信息表
```
  CREATE TABLE IF NOT EXISTS tbl_profile (
    id                    varchar(255) NOT NULL,       --primary key
    name                  varchar(255) NOT NULL,       --profile name
    description           varchar(255) DEFAULT NULL,   --description
    description_en        varchar(255) DEFAULT NULL,   --english description
    file_path             varchar(255) NOT NULL,       --profile file path
    deploy_file_path      text NOT NULL,               --deploy file path
    config_file_path      varchar(255) DEFAULT NULL,   --config file path
    seq                   varchar(255) NOT NULL,       --sequence
    create_time           timestamptz(6)  NOT NULL,    --create time
    type                  varchar(255) NOT NULL,       --type
    industry              varchar(255) NOT NULL,       --industry
    topo_file_path        varchar(255) DEFAULT NULL,   --topo file path
    CONSTRAINT tbl_profile_pkey PRIMARY KEY (id)
    );
```

- **tbl_app_script** 应用包脚本文件表
```
  CREATE TABLE IF NOT EXISTS tbl_app_script (
    id              varchar(255) NOT NULL,     --primary key
    app_id          varchar(255) NOT NULL,     --application id
    name            varchar(255) DEFAULT NULL, --script file name
    script_file_id  text DEFAULT NULL,         --script file id
    create_time     timestamptz(6)  NOT NULL,  --create time
    CONSTRAINT tbl_app_script_pkey PRIMARY KEY (id)
    );
```

- **tbl_released_package** 从Appstore同步的应用包信息
```
   CREATE TABLE IF NOT EXISTS tbl_released_package (
       id                     varchar(50) NOT NULL,      --primary key
       app_store_app_id       varchar(50) NOT NULL,      --app id from appstore
       app_store_package_id   varchar(50) NOT NULL,      --pkg id from appstore
       name                   varchar(255) NOT NULL,     --pkg name
       version                varchar(255) NOT NULL,     --pkg version
       provider               varchar(255) NOT NULL,     --provider
       industry               varchar(255) NOT NULL,     --industry
       type                   varchar(255) NOT NULL,     --type
       architecture           varchar(255) NOT NULL,     --app architecture
       short_desc             varchar(255) NOT NULL,     --description
       synchronize_date       timestamptz(6) NOT NULL,   --synchronize date
       user_id                varchar(50) NOT NULL,      --user id
       user_name              varchar(255) NOT NULL,     --user name
       test_task_id           varchar(50) NOT NULL,      --test task id from appstore
       CONSTRAINT tbl_released_package_pkey PRIMARY KEY ("id")
    );
```



   

    

    

    

    

    


   



    

    

  

    

    

   

   

    

    

   