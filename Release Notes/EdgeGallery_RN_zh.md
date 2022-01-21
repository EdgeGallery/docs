.. This work is licensed under a Creative Commons Attribution 4.0 International License. <br>
.. http://creativecommons.org/licenses/by/4.0 <br>
.. Copyright 2019-2021 Huawei Technologies Co., Ltd. <br>

Release Notes
=============

EdgeGallery Introduction
------------------------
EdgeGallery 是一个5G MEC开源边缘计算平台，它是一个面向应用和应用开发者的端到端解决方案，对于APP应用来说除支持应用运行的基础MEP平台外，还提供APP应用管理系统（MEC Manager，极简管理面，包括MEPM以及MEAO的部分功能），能够对应用进行端到端生命周期管理，提供X86应用向ARM迁移的工具链，支持应用平滑的跨平台迁移和调优。对应用开发者来说，提供完整的应用开发IDE环境和集成验证环境，为应用开发者提供一站式开发体验，同时通过APP Store功能，对应用开发者开发的APP提供标准的准入验证流程。
- [项目简介](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery%2Emd)
- [开发者指南](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)



 Version: v1.5.0
--------------

 - Release Date: 2022-01
 - Image Version: v1.5.0
**新开源仓库列表**
|模块|名称|类型|URL|说明|
|------------------------------|:-------------:|------|---------------------------------------------|--------------------------------------|
|Common Service|common-service|产品仓|https://gitee.com/edgegallery/common-service|为EdgeGallery各组件提供公共服务|
|3rd Party System|3rd-party-system|产品仓|https://gitee.com/edgegallery/third-party-system|EdgeGallery对接的外部系统统一管理|


[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.5)

* **版本更新**
    - 系统架构增强
        - 整体抽象EdgeGallery 东南西北向的对接关系，进行三方系统的统一规划管理（包含MEAO、镜像仓库、Appstore、IaaS、测试系统）
        - Profile Management：完善Developer 与 MECM在Profile上展示与内部模型的映射，提供统一的北向Profile与数据出口
        - WASM运行态完整支持
        - EdgeGallery北向接口支持：支持北向对接认证API；支持与第三方IAM系统集成方案，形成一套标准的统一认证体系
        - 支持proxy代理访问部署EdgeGallery
    
    - 管理面增强        
        - EdgeGallery虚拟机场景增强：支持灵活定义MEC节点内的网络；支持灵活定义应用挂接的网络；支持配置应用的网络接口参数；支持在部署应用时灵活配置flavor；支持边缘节点内的租户隔离，EG用户与openstack租户绑定
        - MECM资源管理功能增强：1.支持边缘节点的资源管理，包括边缘节点的资源信息，租户信息等；2.支持APP的资源管理，包括APP使用的虚拟机列表，对应虚拟机的状态与度量指标；3.支持边缘资源的申请，包括虚拟机拉起，flavor设置，镜像（应用）选择等；4.支持边缘虚拟机资源的维护，包括重启，关闭，开机，远程VNC等
    
    - 边缘自治-企业Portal
        - 支持Openstack/FS资源统计，边缘节点检查支持定时任务，企业自助申请IaaS资源并隔离        
    - APP变现和商业化流程优化
        - 基于当前的设计持续推进APP变现流程，打通一个端到端的定价，订购，部署，维护的流程
    - 集成平台
        - 提供融合服务界面，大幅优化用户体验
        - EdgeGallery应用孵化流程优化，前台界面操作流程优化；后台接口重构，适配流程优化；ATP界面需要适配新的流程优化；容器应用流程优化
        - 基于RTMP的超低延迟推拉流服务：1. 搭建基于WebRTC的实时音视频平台集成至EdgeGallery，支撑VR/AR等应用上线；2. 提供开放SDK，支撑应用上线。
 
 * **其他**
    - 完成小程序解释层与MEP平台架构改造，相关部署脚本与workload形态同步完成
    - 安全加解密SDK： 针对EG平台内部存储的敏感数据，例如：沙箱环境密码，需要提供安全可靠的加解密方式进行密码的存储保存，安全的加解密服务


**Bug Fixes**

  参见 [EdgeGallery v1.5.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.3%20Test%20Report.md)


 **Security Notes**


**Fixed/Known Security Issues**

  参见 [EdgeGallery v1.5.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.5/EG%20v1.5%20Security%20Test%20Report.md)

 **Known Vulnerabilities in Used Modules**

  参见 [EdgeGallery v1.5.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.5/EG%20v1.5%20Security%20Test%20Report.md)

 EdgeGallery v1.5.0 版本第三方开源组件存在以下漏洞需要用户自行修复：
| 三方组件 | 版本 | CVE编号 | 涉及模块 |
| ---      | ---  | ---     | ---      |
| log4j | 1.2.17 | CVE-2019-17571 | Appstore,MECM |
| netty-transport | 4.1.36 | CVE-2019-20444,CVE-2019-20445 | Appstore |
| vertx-core | 3.9.4 | CVE-2019-17640 | UserMgmt,Appstore,Developer,ATP |
| docker-java-core | 3.2.10 | CVE-2019-13139，CVE-2019-13509，CVE-2019-16884，CVE-2019-5736 | Appstore，Developer，MECM |
| foundation-ssl | 1.3.2 | CVE-2004-0009 | UserMgmt，Appstore，Developer，ATP |
| mybatis-spring | 2.0.6 | CVE-2020-26945 | UserMgmt，Appstore，Developer，ATP |
| mybatis-spring-boot-starter | 2.2.0 | CVE-2020-26945 | UserMgmt，Appstore，ATP，3rd-System |
| spring-security-core | 5.3.10.RELEASE | CVE-2018-1258 | UserMgmt，Developer，MECM |
| spring-security-web | 5.3.8.RELEASE | CVE-2018-1258 | UserMgmt，Developer，MECM |
| golang.org/x/net | v0.0.0-20200301022130 | CVE-2021-33194 | MEP |






-----------------------------------------------------------------------------


 Version: v1.3.0
--------------

 - Release Date: 2021-10-12
 - Image Version: v1.3.0

**新开源仓库列表**

None


[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.3)

* **亮点功能**
    - 南向IoT设备Profile Management完善
        - 边缘侧集成Kuiper，Flink等Stream analyzer进行数据的清洗：如整形与格式化，上报大数据系统内；也可以通过云边接口上传至公有云进行进一步的数据计算，如机器学习等
        - 集成业界IoT协议栈，如Fledge，EdgeX，KubeEdge等开源组件，实现MQTT、OPCUA等典型协议支持
        - 支持大数据平台接入，支持标准化工业平台配置等
    - 大应用传输体验优化
        - 大包制作效率提升：支持二次大包制作，虚机镜像瘦身60%，减少应用包制作时间3-4小时。
        - Appstore支持分片下载，即MEAO可以通过分片下载、上传机制进行应用包传递，提升应用传输稳定性

* **模块增强**
    - ATP能力自动化测试能力增强
        - 增强安全性测试含病毒、端口和漏洞扫描，以及时延等性能测试
        - 增加应用使能测试，含服务注册、更新、下线等指标测试
        - 支持测试用例灵活可定义的用例参数配置
    - 界面全面优化升级，提升用户体验
        - Developer、AppStore、MECM和边缘自治平台界面全面优化，界面风格统一，全面提升用户使用体验
        - 边缘自治界面增加用户管理功能
        - Developer平台增加“统一界面组件”，帮助开发人员快速参与EdgeGallery社区开发
        - MECM平台增加节点资源和应用资源的展示
    - Developer平台虚机能力增强
        - 增加应用包签名功能
        - 增加容器镜像管理功能
        - 增加虚机镜像瘦身功能，针对上传镜像和生成的镜像完成自动瘦身，镜像大小减少60%
    - AppStore平台能力增强
        - 增加APPD转换功能
    - MEP完全实现ETSI接口规范
    - Edge AI能力全面优化
        - 集成Tensorflow Lite，MindSpore Lite，增强EdgeGallery AI相关框架能力
    - 安全增强
        - 对所有流量添加了访问频率限制，短时间访问频率达到限定值会禁止访问，极大降低了遭受DOS攻击和暴力破解的风险


 * **其他**
    - [应用创新](https://47.243.125.138:30091/#/home): 完成150+应用集成、落地30+创新基地
    - 体验优化: [AppStore](https://47.243.125.138:30091/#/home)、[Developer](https://47.243.125.138:30092/#/)、[MECM](https://47.243.125.138:30093/)各平台界面全面升级优化
    - 1.4功能预告
        - 通过wasmEdge进行AI能力大幅瘦身以及定制优化
        - E2E边缘应用自助订购以及开发集成优化
        - 边缘自治系统自助服务增强
            - 支持企业用户查看资源使用，应用运行以及upf网络连接等状态        


**Bug Fixes**

  参见 [EdgeGallery v1.3.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.3%20Test%20Report.md)


 **Security Notes**


**Fixed/Known Security Issues**

参见 [EdgeGallery v1.3.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.3/EG%20v1.3%20Security%20Test%20Report.md)

 **Known Vulnerabilities in Used Modules**

参见 [EdgeGallery v1.3.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.3/EG%20v1.3%20Security%20Test%20Report.md)

 EdgeGallery v1.3.0 版本第三方开源组件存在以下漏洞需要用户自行修复：

**User-mgmt**
| Component                                             | Version       | CVE                         |
| ----------------------------------------------------- | ------------- | --------------------------- |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| foundation-ssl | 1.3.2 | CVE-2004-0009 CVE-2021-21501 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.2.0 | CVE-2020-26945 |
| spring-core | 5.2.8.RELEASE | CVE-2021-22118 |
| spring-security-core | 5.3.10.RELEASE | CVE-2018-1258 |
| spring-security-core | 5.3.8.RELEASE | CVE-2018-1258 |
| tomcat-embed-core | 9.0.44 | CVE-2021-30639 |


**Appstore**
| Component                                  | Version       | CVE                                                          |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| log4j                 | 1.2.17        | CVE-2019-17571                                               |
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| docker-java-core | 3.2.10 | CVE-2019-13139  CVE-2019-13509  CVE-2019-16884  CVE-2019-5736|
| foundation-ssl | 1.3.2 | CVE-2004-0009 CVE-2021-21501 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.2.0 | CVE-2020-26945 |
| spring-jdbc | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |


**Developer**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| swagger-codegen-cli | 3.0.21 | CVE-2018-8088  CVE-2016-6199  CVE-2019-15052  CVE-2020-25649  CVE-2019-10086  CVE-2017-1000207  CVE-2017-1000208  CVE-2017-18640  CVE-2020-11979 CVE-2021-29428 |
| commons-compress | 1.19 | CVE-2021-35515 CVE-2021-35516 CVE-2021-35517 CVE-2021-36090 |
| docker-java-core | 3.2.10 | CVE-2019-13139  CVE-2019-13509  CVE-2019-16884  CVE-2019-5736|
| foundation-ssl | 1.3.2 | CVE-2004-0009 CVE-2021-21501 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.2.0 | CVE-2020-26945 |
| sprint-jdbc | 5.2.8.RELEASE | CVE-2021-22118 |
| spring-security-core | 5.3.10.RELEASE | CVE-2018-1258 |
| tomcat-embed-core | 9.0.44 | CVE-2021-30639 |


**MECM**
| Component  | Version  | CVE  |
|---|---|---|
| bcprov-jdk15on-1.56.jar | 1.56 | CVE-2018-1000613 CVE-2018-1000180 |
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| log4j | 1.2.17 | CVE-2019-17571 |
| vertx-core | 3.6.3 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| hibernate-core | 5.3.10.Final | CVE-2020-25638 |
| netty-transport | 4.1.36.Final | CVE-2019-20444 CVE-2019-20445 CVE-2019-16869 CVE-2020-11612 |
| spring-security-core | 5.3.8.RELEASE | CVE-2018-1258 |
| spring-tx | 5.1.8.RELEASE | CVE-2020-5398 |
| tomcat-embed-core | 9.0.21 | CVE-2020-1938 CVE-2019-12418 CVE-2019-17563 CVE-2020-11996 CVE-2020-13934 CVE-2020-13935 CVE-2020-17527 CVE-2020-8022 CVE-2020-9484 CVE-2021-25122 CVE-2021-25329 |
| jackson-databind | 2.9.9 | CVE-2019-14379 CVE-2019-14540 CVE-2019-14892 CVE-2019-14893 CVE-2019-16335 CVE-2019-16942 CVE-2019-16943 CVE-2019-17267 CVE-2019-17531 CVE-2019-20330 CVE-2020-8840 CVE-2020-9546 CVE-2020-9547 CVE-2020-9548 CVE-2019-14439 CVE-2020-10672 CVE-2020-10673 CVE-2020-10968 CVE-2020-10969 CVE-2020-11111 CVE-2020-11112 CVE-2020-11113 CVE-2020-11619 CVE-2020-11620 CVE-2020-14060 CVE-2020-14061 CVE-2020-14062 CVE-2020-14195 CVE-2020-24616 CVE-2020-24750 CVE-2020-25649 CVE-2020-35490 CVE-2020-35491 CVE-2020-35728 CVE-2020-36179 CVE-2020-36180 CVE-2020-36181 CVE-2020-36182 CVE-2020-36183 CVE-2020-36184 CVE-2020-36185 CVE-2020-36186 CVE-2020-36187 CVE-2020-36188 CVE-2020-36189 CVE-2020-36190 |
| mybatis | 3.4.4 | CVE-2020-26945 |


**ATP**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| commons-compress | 1.19 | CVE-2021-35515 CVE-2021-35516 CVE-2021-35517 CVE-2021-36090 |
| foundation-ssl | 1.3.2 | CVE-2004-0009 CVE-2021-21501 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.2.0 | CVE-2020-26945 |
| spring-core | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 CVE-2021-22112 CVE-2018-1258 CVE-2021-22112 |
| tomcat-embed-core | 9.0.44 | CVE-2021-30639 |


**MEP**
| Component  | Version  | CVE  |
|---|---|---|
| golang.org/x/net | v0.0.0-20200301022130 | CVE-2021-33194 |




-----------------------------------------------------------------------------


 Version: v1.2.0
--------------

 - Release Date: 2021-07-07
 - Image Version: v1.2.0

**新开源仓库列表**
| 模块                           |      名称       | 类型   | URL                                           | 说明                                   |
| ------------------------------ | :-------------: | ------ | --------------------------------------------- | -------------------------------------- |
| Installer      | installer    | 配置仓 | https://gitee.com/edgegallery/installer    | EdgeGallery离线包制作以及离线安装、在线安装、docker compose方式安装脚本    |
| filesystem       | filesystem | 产品仓 | https://gitee.com/edgegallery/file-system | EdgeGallery平台内的应用镜像管理服务         |


**New Features**

[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.2)



* **开放能力**
    - [AI软硬件能力](https://47.243.125.138:30092/#/mecDeveloper/api/mep) 
        - 支撑昇腾/Atlas硬件以及开放API：支持昇腾20+开放能力，包括图像修复、目标定位、超分辨图像算法等
        - AI换脸、OCR、智慧货架、姿态识别等
    - [行业套件](https://47.243.125.138:30091/#/home) 支持行业组合能力
        - PCB质量检测：提供开放能力和PCB板质量检测的样例应用
        - 工业现场南向设备管理通信：提供基于Fledge的工业南向设备管理方案以及部署脚本
        - 视频会议、在线课堂：提供视频开源样例应用
* **[安全增强](https://gitee.com/edgegallery/installer)**
    - 用户管理模块增加动态验证码校验功能，解决恶意注册和邮件轰炸等安全漏洞问题
    - 应用调测过程中，VNC远程登录沙箱环境设置非root用户操作，限制访问权限
* **[新增模块特性](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.2)**
    - Developer、AppStore和MECM平台增加管理员操作界面
    - AppStore平台提供应用在线体验功能
    - 全流程支持虚机应用的快速集成、测试和发布，MECM平台支持虚机应用的分发和部署
    - 虚机应用集成能力增强，支持虚机规格配置、网络配置和环境变量配置
    - 增加镜像文件管理服务，解决EdgeGallery中心节点模块间镜像文件共享问题
    - 提供边缘自治管理界面和边缘节点健康检查功能
    - 全模块支持数据持久化能力
* **[按需部署](https://gitee.com/edgegallery/installer)**
    - 提供基于Ansible的离线部署脚本与离线安装包，支持用户进行自定义的按需部署
        - IaaS层提供k8s与k3s两种部署方式
        - EdgeGallery各子模块支持单独部署与卸载
        - 支持基于k8s NFS的数据持久化功能
    - 支持以docker-compose方式（不依赖k8s/k3s）部署EdgeGallery各子模块
    - [PoC] 支持树莓派部署
 * **其他**
    - [应用创新](https://47.243.125.138:30091/#/home): 完成130+应用集成、落地25+创新基地
    - 体验优化: [AppStore](https://47.243.125.138:30091/#/home)、[Developer](https://47.243.125.138:30092/#/)、[MECM](https://47.243.125.138:30093/)各平台界面全面升级优化


**Bug Fixes**

  参见 [EdgeGallery v1.2.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.2%20Test%20Report.md)

总缺陷数量： 267（含 34个安全类缺陷），已解决数量： 265个；未解决bug 16个（含16 个known issue，遗留到下一版本解决）

- 按缺陷类型分析：安全类bug 35个；其他类bug 246个。
- 按缺陷严重级别分析：严重bug 31个；主要bug 70个；次要bug 129个；不重要bug 9个；不指定42 个。
- 按需求点分析
- 缺陷收敛性分析：总计281 个bug（含 14个无效bug；含安全类bug 34）；迭代一 39 个bug（含 3个无效bug）；迭代二 65 个bug（含 5个无效bug）；迭代三 143 个bug（含 4个无效bug）
；未制定迭代34 个bug（含 2个无效bug）

 **Security Notes**

参见 [EdgeGallery v1.2.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.2/EG%20v1.2%20Security%20Test%20Report.md)


**Fixed/Known Security Issues**
| **No.** | **Issue 标题** | **状态** | **级别** |
| --- | --- | --- | --- |
| 1 | [【mecm】【Security】lcm，rule，apm，appo，inventory，k8xplugin等pod中usr/app/log目录下没有日志文件](https://e.gitee.com/OSDT/issues/list?issue=I3XSH9) | 已修复 | 主要 |
| 2 | [【user-mgmt】【Security】user-mgmt pod中usr/app/log目录下没有日志文件](https://e.gitee.com/OSDT/issues/list?issue=I3XUNS) | **遗留** | 主要 |
| 3 | [【developer】【Security】developer-be中usr/app/log目录下没有日志文件](https://e.gitee.com/OSDT/issues/list?issue=I3XSH9) | 已修复 | 主要 |
| 4 | [【user-mgmt】【Security】日志记录敏感信息（ssoSessionId）](https://e.gitee.com/OSDT/issues/list?issue=I3XS2G) | 已修复 | 主要 |
| 5 | [【developer】【Security】虚机部署时，日志中记录了敏感信息（lcmToken）](https://e.gitee.com/OSDT/issues/list?issue=I3XR72) | 已修复 | 主要 |
| 6 | [【atp】【Security】用户贡献测试用例功能存在重放攻击漏洞](https://e.gitee.com/OSDT/issues/list?issue=I3VZS3) | 已修复 | 主要 |
| 7 | [【user-mgmt】【Security】首次登陆admin账户未强制修改密码](https://e.gitee.com/OSDT/issues/list?issue=I3V708) | 已修复 | 主要 |
| 8 | [【atp】【Security】在appstore进行atp测试->社区场景->安全测试用例执行失败](https://e.gitee.com/OSDT/issues/list?issue=I3T6A0) | 已修复 | 主要 |
| 9 | [【developer】【Security】新增沙箱环境时，鉴权应按角色判断，不应按userId判断](https://e.gitee.com/OSDT/issues/list?issue=I3YTO7) | 已修复 | 主要 |

 **Known Vulnerabilities in Used Modules**

 EdgeGallery v1.2.0 版本第三方开源组件存在以下漏洞需要用户自行修复：


**User-mgmt**
| Component                                             | Version       | CVE                         |
| ----------------------------------------------------- | ------------- | --------------------------- |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.3.8.RELEASE | CVE-2018-1258 |


**Appstore**
| Component                                  | Version       | CVE                                                          |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| log4j                 | 1.2.17        | CVE-2019-17571                                               |
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| docker-java-core | 3.2.7 | CVE-2019-13139  CVE-2019-13509  CVE-2019-16884  CVE-2019-5736|
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-jdbc | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |


**Developer**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| swagger-codegen-cli | 3.0.21 | CVE-2018-8088  CVE-2016-6199  CVE-2019-15052  CVE-2020-25649  CVE-2019-10086  CVE-2017-1000207  CVE-2017-1000208  CVE-2017-18640  CVE-2020-11979 CVE-2021-29428 |
| docker-java-core | 3.2.7 | CVE-2019-13139  CVE-2019-13509  CVE-2019-16884  CVE-2019-5736|
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.3.8.RELEASE | CVE-2018-1258 |
| sprint-jdbc | 5.2.8.RELEASE | CVE-2021-22118 |


**MECM**
| Component  | Version  | CVE  |
|---|---|---|
| bcprov-jdk15on-1.56.jar | 1.56 | CVE-2018-1000613 CVE-2018-1000180 |
| log4j | 1.2.17 | CVE-2019-17571 |
| vertx-core | 3.6.3 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| hibernate-core | 5.3.10.Final | CVE-2020-25638 |
| netty-transport | 4.1.36.Final | CVE-2019-20444 CVE-2019-20445 CVE-2019-16869 CVE-2020-11612 |
| spring-security-core | 5.3.8.RELEASE | CVE-2018-1258 |
| spring-tx | 5.1.8.RELEASE | CVE-2020-5398 |
| tomcat-embed-core | 9.0.21 | CVE-2020-1938 CVE-2019-12418 CVE-2019-17563 CVE-2020-11996 CVE-2020-13934 CVE-2020-13935 CVE-2020-17527 CVE-2020-8022 CVE-2020-9484 CVE-2021-25122 CVE-2021-25329 |
| jackson-databind | 2.9.9 | CVE-2019-14379 CVE-2019-14540 CVE-2019-14892 CVE-2019-14893 CVE-2019-16335 CVE-2019-16942 CVE-2019-16943 CVE-2019-17267 CVE-2019-17531 CVE-2019-20330 CVE-2020-8840 CVE-2020-9546 CVE-2020-9547 CVE-2020-9548 CVE-2019-14439 CVE-2020-10672 CVE-2020-10673 CVE-2020-10968 CVE-2020-10969 CVE-2020-11111 CVE-2020-11112 CVE-2020-11113 CVE-2020-11619 CVE-2020-11620 CVE-2020-14060 CVE-2020-14061 CVE-2020-14062 CVE-2020-14195 CVE-2020-24616 CVE-2020-24750 CVE-2020-25649 CVE-2020-35490 CVE-2020-35491 CVE-2020-35728 CVE-2020-36179 CVE-2020-36180 CVE-2020-36181 CVE-2020-36182 CVE-2020-36183 CVE-2020-36184 CVE-2020-36185 CVE-2020-36186 CVE-2020-36187 CVE-2020-36188 CVE-2020-36189 CVE-2020-36190 |
| mybatis | 3.4.4 | CVE-2020-26945 |


**ATP**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |
| spring-core | 5.1.8.RELEASE | CVE-2020-5398 |


**MEP**
| Component  | Version  | CVE  |
|---|---|---|
| golang.org/x/net | v0.0.0-20200301022130 | CVE-2021-33194 |


-----------------------------------------------------------------------------
 

 Version: v1.1.0
--------------

 - Release Date: 2020-04-09
 - Image Version: v1.1.0

**新开源仓库列表**
| 模块                           |      名称       | 类型   | URL                                           | 说明                                   |
| ------------------------------ | :-------------: | ------ | --------------------------------------------- | -------------------------------------- |
| Example Applications           | example-apps    | PoC仓 | https://gitee.com/edgegallery/example-apps    | 提供基于EdgeGallery的样例app   |
| EdgeGallery Frontend Component |     eg-view     | 产品仓 | https://gitee.com/edgegallery/eg-view          | 提供归一化的EdgeGallery前端组件         |
| EdgeGallery Testing Platform   |    edgeT        | PoC仓 | https://gitee.com/edgegallery/edgeT | 为用户提供本地测试的工具链 |

**New Features**

[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.1)


![](/uploads/images/2021/v1.1/NewFeature.png "NewFeature.png")


* **AI软硬件能** 支撑昇腾/Atlas硬件以及开放API
    - AI图像修复、边缘检测、卡通图像生成、图像上色、对象分类、目标检测等；
* **跨平台支持** 支持基于Openstack的虚机应用和基于K8S容器应用的孵化集成
* **体验优化**
    - APP分类、APP推荐、爆款动态刷新
* **EdgeNative支持**
    - IaaS/PaaS/应用都支持按需部署、应用框架自动生成
    - MEP微服务管理架构可视化
    - 提供EdgeGallery小程序、设计态等
* **API管理** ETSI MEC API、3GPP CAPIF以及昇腾能力支持情况匹配
* **安全、用户管理**
    - 分权分域，对关键操作和数据进行权限控制
    - 应用远程登录（如VNC）支持安全协议登录
* **社区实验室增强**
    - 提供真实E2E 5G验证环境
    - 资源一键申请，一键释放，可视化管理
* **应用创新**
    - AppStore联邦，可注册外部AppStore，应用在不同AppStore间可相互推送和拉取
    - 完成80+应用集成、落地17+创新基地、西安电子科技大学研究生课程


 **Bug Fixes**

  参见 [EdgeGallery v1.1.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.1%20Test%20Report%2Emd)

 **Known Issues**

  参见 [EdgeGallery v1.1.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.1%20Test%20Report%2Emd)

 **Security Notes**

 **Fixed Security Issues**

  参见 [EdgeGallery v1.1.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Plan/Release-R1.1/EG%20R1.1%20Security%20Test%20Plan%20%2Emd)

 **Known Security Issues**

  参见 [EdgeGallery v1.1.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.1/EG%20v1.1%20Security%20Test%20Report%2Emd)

 **Known Vulnerabilities in Used Modules**

 EdgeGallery v1.1.0 版本第三方开源组件存在以下漏洞需要用户自行修复：

**Appstore**
| Component                                  | Version       | CVE                                                          |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| log4j                 | 1.2.17        | CVE-2019-17571                                               |
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| docker-java-core | 3.2.7 | CVE-2019-13139  CVE-2019-13509  CVE-2019-16884  CVE-2019-5736|
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-jdbc | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |


**Developer**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| swagger-codegen-cli | 3.0.21 | CVE-2018-8088  CVE-2016-6199  CVE-2019-15052  CVE-2020-25649  CVE-2019-10086  CVE-2017-1000207  CVE-2017-1000208  CVE-2017-18640  CVE-2020-11979 |
| docker-java-core | 3.2.7 | CVE-2019-13139  CVE-2019-13509  CVE-2019-16884  CVE-2019-5736|
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |


**ATP**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444  CVE-2019-20445  CVE-2019-16869  CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |
| spring-core | 5.1.8.RELEASE | CVE-2020-5398 |


**User-mgmt**
| Component                                             | Version       | CVE                         |
| ----------------------------------------------------- | ------------- | --------------------------- |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.3.8.RELEASE | CVE-2018-1258 |


 **Upgrade Notes**

 N/A

 **Deprecation Notes**

 N/A

 **Other**

N/A

-----------------------------------------------------------------------------


Version: v1.0.0
--------------

 - Release Date: 2020-12-31
 - Image Version: v1.0.0

**新开源仓库列表**
| 模块                           |      名称       | 类型   | URL                                           | 说明                                   |
| ------------------------------ | :-------------: | ------ | --------------------------------------------- | -------------------------------------- |
| ATP(Application Test Platform) |       atp       | 产品仓 | https://gitee.com/edgegallery/atp             | 应用测试平台，为应用认证提供测试支撑   |
| ATP(Application Test Platform) |     atp-fe      | 产品仓 | https://gitee.com/edgegallery/atp-fe          | 提供应用测试认证平台前台支撑           |
| Developer                      | crane-framework | 产品仓 | https://gitee.com/edgegallery/crane-framework | 为应用开发提供轻量化，插件是的开发框架 |
| MECM                           | mecm-apprulemgr | 产品仓 | https://gitee.com/edgegallery/mecm-apprulemgr | 管理面提供应用规则配置下发和管理的能力    |

**New Features**

[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/TSC/Release/v1.0)

1. 版本规划特性
    * **Developer** 优化APP开发测试发布流程，优化API界面，集成多语言SDK
        - 优化首页设计，增加应用开发生命周期流程图；
        - 优化项目开发流程，全新界面设计；
        - 优化部署调测环节，增加可视化展示部署过程展示，增加部署结果POD展示；
        - 优化能力中心界面，增加能力分类选择；
        - 应用发布环节对接认证测试平台；
    * **AppStore** 界面易用性优化，EdgeGallery生态能力优化
    * **MECM** 优化拓扑、应用管理及边缘节点管理，新增获取MEP能力功能，AK/SK配置接口
    * **MEP** 支持APP心跳检测，新增获取MEP能力接口，AK/SK配置接口，MEP-agent新增获取token接口
    * **ATP** APP应用的测试能力增强
    * **Test** 提供健康检查功能，优化安装包，开发测试平台支持测试例管理

2. PoC 特性
    * MEP服务治理页面展示
    * 引入插件式应用框架[Crane-framework](https://gitee.com/edgegallery/crane-framework)
    * AppStore联邦，可注册外部AppStore，应用在不同AppStore间可相互推送和拉取

 **PoC Test Report**

  参见[EdgeGallery v1.0.0 PoC Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.0%20Poc%20Requirement%20Test%20Report%2Emd)

 **Bug Fixes**

  参见 [EdgeGallery v1.0.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.0%20Test%20Report%2Emd)

 **Known Issues**

  参见 [EdgeGallery v1.0.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.0%20Test%20Report%2Emd)

 **Security Notes**

 **Fixed Security Issues**

  参见 [EdgeGallery v1.0.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.0/EG%20v1.0.0%20Security%20Test%20Report%2Emd)

 **Known Security Issues**

  参见 [EdgeGallery v1.0.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.0/EG%20v1.0.0%20Security%20Test%20Report%2Emd)

 **Known Vulnerabilities in Used Modules**

EdgeGalelry v1.0.0 版本第三方开源组件存在以下漏洞需要用户自行修复：

**Appstore**
| Component                                  | Version       | CVE                                                          |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| log4j (indirect dependency)                | 1.2.17        | CVE-2019-17571                                               |
| bcprov-jdk15on-1.66.jar | 1.66 | CVE-2020-28052                                                |
| jackson-databind | 2.10.5 | CVE-2020-25649                                                |
| spring-security-oauth2 | 2.3.3.RELEASE | CVE-2018-15758                                                |
| tomcat-embed-core | 9.0.37 | CVE-2020-17525                                                |


**Developer**
| Component  | Version  | CVE  |
|---|---|---|
| spring-beans (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.3.4.RELEASE | CVE-2018-1258 |
| jackson-databind | 2.10.5 | CVE-2020-25649 |
| mybatis-spring-boot-starter | 2.1.1 | CVE-2020-26945 |
| tomcat-embed-core | 9.0.37 | CVE-2020-17527 |


**ATP**
| Component  | Version  | CVE  |
|---|---|---|
| mybatis-spring-boot-starter |2.1.1 | CVE-2020-26945|

**User-mgmt**
| Component                                             | Version       | CVE                         |
| ----------------------------------------------------- | ------------- | --------------------------- |
| spring-security-core                                  |5.3.4.RELEASE  | CVE-2018-1258               |
| bcprov-jdk15on                                        | 1.66          | CVE-2020-28052               |
| jackson-databind                                      | 2.10.5         | CVE-2020-25649       |
|  mybatis-spring-boot-starter                             | 2.1.1         | CVE-2020-26945                |
|  spring-security-oauth2                             | 2.3.3.RELEAS         | CVE-2018-15758                |

**Website-gateway**
| Component            | Version       | CVE            |
| -------------------- | ------------- | -------------- |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258  |
| jackson-databind | 2.10.5 | CVE-2020-26945  |
| spring-security-oauth2 | 2.3.3 | CVE-2018-15758  |
| tomcat-embed-core | 9.0.37 | CVE-2020-17527  |

**MECM**
| Component | Version | CVE           |
| --------- | ------- | ------------- |
| lodash    | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4   | NPM-118       |


 **Upgrade Notes**

 N/A

 **Deprecation Notes**

 N/A

 **Other**

N/A

-----------------------------------------------------------------------------



 Version: v0.9.1
--------------

 - Release Date: 2020-11-11
 - Image Version: v0.9.1

**新开源仓库列表**
| 模块            | 名称            | 类型   | URL                                           | 说明                 |
|-----------------|-----------------|--------|-----------------------------------------------|----------------------|
| Developer     | api-emulator     | 产品仓   | https://gitee.com/edgegallery/api-emulator     | 提供基本能力的模拟api  |
| Mep | Plugins | 产品仓 | https://gitee.com/edgegallery/plugins |       plugins仓       |
| Developer| toolchain| 产品仓 | https://gitee.com/edgegallery/toolchain | 提供x86平台应用上车ARM时源码分析功能            |


**New Features**

[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/TSC/Release/v0.9.x)

* 安全设计排查问题汇总
* api模拟器和工具链、plugin仓库开源
* **MEP/MEP Agent**ak/sk配置接口


 **Bug Fixes**

  参见 [EdgeGallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 **Known Issues**

  参见 [EdgeGallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 **Security Notes**

 **Fixed Security Issues**

  参见 [EdgeGallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 **Known Security Issues**

  参见 [EdgeGallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 **Known Vulnerabilities in Used Modules**

EdgeGallery v0.9.1版本第三方开源组件存在以下漏洞需要用户自行修复：

**Appstore**
| Component                                  | Version       | CVE                                                          |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| netty-transport (indirect dependency)      | 4.1.36.Final  | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| log4j (indirect dependency)                | 1.2.17        | CVE-2019-17571                                               |
| spring-jdbc (indirect dependency)          | 5.1.8.RELEASE | CVE-2020-5398                                                |
| spring-security-core (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258                                                |
| bcprov-jdk15on-1.66.jar | 1.66 | CVE-2020-28052                                                |
| foundation-ssl | 1.3.0 | CVE-2004-0009                                                |
| jackson-databind | 2.10.5 | CVE-2020-25649                                                |
| mybatis | 3.5.3 | CVE-2020-25645                                                |
| spring-security-oauth2 | 2.3.3.RELEASE | CVE-2018-15758                                                |
| tomcat-embed-core | 9.0.37 | CVE-2020-17525                                                |
| vertx-core | 3.6.3 | CVE-2019-17640                                                |




**Developer**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| spring-beans (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-config (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258, CVE-2020-5398 |
| spring-security-core | 5.3.4.RELEASE | CVE-2018-1258 |
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |
| spring-security-oauth2 | 2.3.3 | CVE-2018-15758，CVE-2019-11269，CVE-2018-3778 |
| swagger-codegen-cli (shaded: com.fasterxml.jackson.core.jackson-databind:2.10.3) | 3.0.21 | CVE-2020-25649 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| jackson-databind | 2.10.5 | CVE-2020-25649 |
| mybatis-spring | 2.0.3 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.1 | CVE-2020-26945 |
| swagger-codegen-cli | 3.0.21 | CVE-2017-1000207，CVE-2017-1000208，CVE-2019-10086，CVE-2018-8088，CVE-2017-18640，CVE-2016-6199，CVE-2019-11065，CVE-2019-15052， |
| tomcat-embed-core | 9.0.37 | CVE-2020-17527 |
| vertx-core | 3.6.3 | CVE-2019-17640 |

**User-mgmt**
| Component  | Version  | CVE  |
|---|---|---|
| rxnetty (indirect dependency) | 0.4.9 | CVE-2015-2156 |
| netty-tcnative-boringssl-static (indirect dependency) | 2.0.31.Final | CVE-2015-2156 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |
| lodash | 4.17.20 | NPM-1065, NPM-557, NPM-7823 |
| minimatch | 3.0.4 | NPM-118 |

**Website-gateway**
| Component  | Version  | CVE  |
|---|---|---|
| log4j | 1.2.17 | CVE-2019-17571 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |

**MECM**
| Component  | Version  | CVE  |
|---|---|---|
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |


 **Upgrade Notes**

 N/A

 **Deprecation Notes**

 N/A

 **Other**

 经过安全工作组评审，Plugins仓库遗留问题单[I1XA0N](https://gitee.com/OSDT/dashboard/programs/114640/issues?issue_id=I1XA0N)将在v0.9版本发布后通过补丁形式修复，详细情况请参见安全工作组[会议纪要](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Meetings/Meeting%20Minutes%2030-09-2020%2Emd)

-----------------------------------------------------------------------------

Version: v0.9
--------------

 - Release Date: 2020-09-30
 - Image Version: v0.9

**新开源仓库列表**
| 模块            | 名称            | 类型   | URL                                           | 说明                 |
|-----------------|-----------------|--------|-----------------------------------------------|----------------------|
| helm-charts     | helm-charts     | 部署   | https://gitee.com/edgegallery/helm-charts     | EdgeGallery部署脚本  |
| website-gateway | website-gateway | 产品仓 | https://gitee.com/edgegallery/website-gateway | 前台封装             |
| user-mgmt       | user-mgmt       | 产品仓 | https://gitee.com/edgegallery/user-mgmt       | usermgmt后台         |
| user-mgmt       | user-mgmt-fe    | 产品仓 | https://gitee.com/edgegallery/user-mgmt-fe    | usermgmt前台         |
| mecm            | mecm-fe         | 产品仓 | https://gitee.com/edgegallery/mecm-fe         | MECM前台             |
| mecm            | mecm-applcm     | 产品仓 | https://gitee.com/edgegallery/mecm-applcm     | MECM应用生命周期管理 |
| mecm            | mecm-apm        | 产品仓 | https://gitee.com/edgegallery/mecm-apm        | MECM应用包管理       |
| mecm            | mecm-inventory  | 产品仓 | https://gitee.com/edgegallery/mecm-inventory  | MECM存量管理         |
| mecm            | mecm-appo       | 产品仓 | https://gitee.com/edgegallery/mecm-appo       | MECM应用编排         |
| developer       | developer-be    | 产品仓 | https://gitee.com/edgegallery/developer-be    | developer后台        |
| developer       | developer-fe    | 产品仓 | https://gitee.com/edgegallery/developer-fe    | developer前台        |
| appstore        | appstore-fe     | 产品仓 | https://gitee.com/edgegallery/appstore-fe     | appstore前台         |
| appstore        | appstore-be     | 产品仓 | https://gitee.com/edgegallery/appstore-be     | appstore后台         |
| platform-mgmt   | platform-mgmt   | 产品仓 | https://gitee.com/edgegallery/platform-mgmt   | 安装k8/docker        |
| docs            | docs            | 产品仓 | https://gitee.com/edgegallery/docs            | 文档                 |


**New Features**

[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/TSC/Release/v0.9)

* All-in-One MEP/MECM网络隔离
* MEP支持DNS配置
* 支持All-in-One部署
* 多节点离线部署
* 九大维度安全优化
* MECM界面/拓扑管理/资源管理优化
* （PoC）kubeedge集成验证


 **Bug Fixes**

  参见 [EdgeGallery v0.9 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

 **Known Issues**

  参见 [EdgeGallery v0.9 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

 **Security Notes**

 **Fixed Security Issues**

  参见 [EdgeGallery v0.9 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

 **Known Security Issues**

  参见 [EdgeGallery v0.9 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

 **Known Vulnerabilities in Used Modules**

EdgeGallery v0.9版本第三方开源组件存在以下漏洞需要用户自行修复：

**Appstore**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| log4j (indirect dependency) | 1.2.17 | CVE-2019-17571 |
| spring-jdbc (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258 |


**Developer**
| Component  | Version  | CVE  |
|---|---|---|
| netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| spring-beans (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-config (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258, CVE-2020-5398 |
| spring-security-core | 5.3.4.RELEASE | CVE-2018-1258 |
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |

**User-mgmt**
| Component  | Version  | CVE  |
|---|---|---|
| rxnetty (indirect dependency) | 0.4.9 | CVE-2015-2156 |
| netty-tcnative-boringssl-static (indirect dependency) | 2.0.31.Final | CVE-2015-2156 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |
| lodash | 4.17.20 | NPM-1065, NPM-557, NPM-7823 |
| minimatch | 3.0.4 | NPM-118 |

**Website-gateway**
| Component  | Version  | CVE  |
|---|---|---|
| log4j | 1.2.17 | CVE-2019-17571 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |

**MECM**
| Component  | Version  | CVE  |
|---|---|---|
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |


 **Upgrade Notes**

 N/A

 **Deprecation Notes**

 N/A

 **Other**

 经过安全工作组评审，Plugins仓库遗留问题单[I1XA0N](https://gitee.com/OSDT/dashboard/programs/114640/issues?issue_id=I1XA0N)将在v0.9版本发布后通过补丁形式修复，详细情况请参见安全工作组[会议纪要](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Meetings/Meeting%20Minutes%2030-09-2020%2Emd)
