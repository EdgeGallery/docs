.. This work is licensed under a Creative Commons Attribution 4.0 International License. <br>
.. http://creativecommons.org/licenses/by/4.0 <br>
.. Copyright 2019-2020 Huawei Technologies Co., Ltd. <br>

Release Notes
=============

EdgeGallery Introduction
------------------------
EdgeGallery 是一个5G MEC开源边缘计算平台，它是一个面向应用和应用开发者的端到端解决方案，对于APP应用来说除支持应用运行的基础MEP平台外，还提供APP应用管理系统（MEC Manager，极简管理面，包括MEPM以及MEAO的部分功能），能够对应用进行端到端生命周期管理，提供X86应用向ARM迁移的工具链，支持应用平滑的跨平台迁移和调优。对应用开发者来说，提供完整的应用开发IDE环境和集成验证环境，为应用开发者提供一站式开发体验，同时通过APP Store功能，对应用开发者开发的APP提供标准的准入验证流程。
- [项目简介](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery%2Emd)
- [开发者指南](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)
   
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
* 【MEP/MEP Agent】ak/sk配置接口


 **Bug Fixes**

  参见 [Edgeggallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 **Known Issues**

  参见 [Edgeggallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 **Security Notes**

 *Fixed Security Issues*

  参见 [Edgeggallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 *Known Security Issues*

  参见 [Edgeggallery v0.9.1 Test Report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report%2Emd)

 *Known Vulnerabilities in Used Modules*

EdgeGalelry v0.9.1版本第三方开源组件存在以下漏洞需要用户自行修复：

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
