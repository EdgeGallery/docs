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


 Version: v1.2.0
--------------

 - Release Date: 2020-07-07
 - Image Version: v1.2.0

**新开源仓库列表**
| 模块                           |      名称       | 类型   | URL                                           | 说明                                   |
| ------------------------------ | :-------------: | ------ | --------------------------------------------- | -------------------------------------- |
| Installer      | installer    | 配置仓 | https://gitee.com/edgegallery/installer    | EdgeGallery离线包制作以及离线安装、在线安装、docker compose方式安装脚本    |
| filesystem       | filesystem | 产品仓 | https://gitee.com/edgegallery/file-system | EdgeGallery平台内的应用镜像管理服务      |


**New Features**

[ **需求/发布计划详细说明** ](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.2)



* ** 开放能力 **
    - [AI软硬件能](https://47.243.125.138:30092/#/mecDeveloper/api/mep) 
        - 支撑昇腾/Atlas硬件以及开放API
        - AI换脸、OCR、智慧货架、姿态识别等
    - [行业套件](https://47.243.125.138:30091/#/home) 支持行业组合能力
        - PCB质量检测
        - 工业现场南向设备管理通信
        - 视频会议、在线课堂
* **[安全增强](https://gitee.com/edgegallery/installer)**
    - 用户管理增加动态验证码校验功能
* **[新增模块特性](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.2)**
    - Developer、AppStore和MECM平台增加管理员操作界面
    - AppStore平台提供应用在线体验功能
    - 虚机应用集成能力增强，可配置网络，input参数等，支持无镜像包调测
    - 支持虚机应用的全流上线，从集成、测试、发布，到部署和分发
    - 增加镜像文件管理服务，支持镜像文件的上传和下载
    - 提供边缘自治管理界面
    - 增加边缘节点的健康检查能力
    - 支持数据持久化
* **[按需部署](https://gitee.com/edgegallery/installer)**
    - 支持基于Ansible模块化部署k8s/k3s以及EdgeGallery各子模块
    - 支持非K8S平台以docker-compose方式部署EdgeGallery各子模块
 * **[其他]**
    - [应用创新](https://47.243.125.138:30091/#/home): 完成130+应用集成、落地25+创新基地
    - 体验优化: [AppStore](https://47.243.125.138:30091/#/home)、[Developer](https://47.243.125.138:30092/#/)、[MECM](https://47.243.125.138:30093/)各平台界面全面升级优化


**Bug Fixes**

  参见 [EdgeGallery v1.2.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.2%20Test%20Plan.md)

 **Known Issues**

  参见 [EdgeGallery v1.2.0 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.2%20Test%20Plan.md)

 **Security Notes**

 **Fixed Security Issues**

  参见 [EdgeGallery v1.2.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Plan/Release-R1.2/EG%20R1.2%20Security%20Test%20Plan%20.md)

 **Known Security Issues**

  参见 [EdgeGallery v1.2.0 Security Test Report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Plan/Release-R1.2/EG%20R1.2%20Security%20Test%20Plan%20.md)

 **Known Vulnerabilities in Used Modules**


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
