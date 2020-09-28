.. This work is licensed under a Creative Commons Attribution 4.0 International License. <br>
.. http://creativecommons.org/licenses/by/4.0 <br>
.. Copyright 2019-2020 Huawei Technologies Co., Ltd. <br>

Release Notes
=============

EdgeGallery Introduction
------------------------
[Start from a Demo on EdgeGallery](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery.md)
   
 Version: e.g. v0.9
--------------

 - Release Date: 2020-09-30
 - Image Version: v0.9


**New Features**

* MEP/MECM网络隔离
* MEP支持DNS配置
* 支持All-in-One部署
* 支持离线部署
* 九大维度安全优化
* MECM界面/拓扑管理/资源管理优化
* （PoC）kubeedge集成验证


 **Bug Fixes**

 N/A

 **Known Issues**

 N/A

 **Security Notes**

 *Fixed Security Issues*

- [I1VFV9](https://gitee.com/OSDT/dashboard/issues?id=I1VFV9) -- 两次密码输入不一致，也可以注册成功
- [I1VN01](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VN01) -- mecm平台，点击注销时候报 network error，页面不会改变，注销不生效
- [I1VG05](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VG05) -- appstore模块退出登录后，在develop里面点击插件列表，依然可以操作，查看插件列表
- [I1VG3M](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VG3M) -- developer注销页面没有改变，点击刷新才跳转登录页面
- [I1VG7F](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VG7F) -- developer前台 上传应用文件前台类型没有做限制
- [I1VG5S](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VG5S) -- 登录后，使用拦截工具可以拦截到用户名和密码
- [I1VY62](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VY62) -- developer swagger-data

 *Known Security Issues*

- [I1VY5P](https://gitee.com/OSDT/dashboard/programs/114640/issues?labels=bug&issue_id=I1VY5P) -- Password is exposed


 *Known Vulnerabilities in Used Modules*

For EdgeGalelry R0.9, there are some vulnerabilities in third-party open source components need to be fixed by users:
- Appstore:
  | Component  | Version  | CVE  |
  |------------|----------|------|
  | netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
  | log4j (indirect dependency) | 1.2.17 | CVE-2019-17571 |
  | spring-jdbc (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
  | spring-security-core (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258 |

- Developer:
  | Component  | Version  | CVE  |
  |------------|----------|------|
  | netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
  | spring-beans (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
  | spring-security-config (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258, CVE-2020-5398 |
  | spring-security-core | 5.3.4.RELEASE | CVE-2018-1258 |
  | lodash | 4.17.13 | CVE-2020-8203 |
  | minimatch | 3.0.4 | NPM-118 |

- User-mgmt:
  | Component  | Version  | CVE  |
  |------------|----------|------|
  | rxnetty (indirect dependency) | 0.4.9 | CVE-2015-2156 |
  | netty-tcnative-boringssl-static (indirect dependency) | 2.0.31.Final | CVE-2015-2156 |
  | spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |
  | lodash | 4.17.20 | NPM-1065, NPM-557, NPM-7823 |
  | minimatch | 3.0.4 | NPM-118 |

- Website-gateway:
  | Component  | Version  | CVE  |
  |------------|----------|------|
  | log4j | 1.2.17 | CVE-2019-17571 |
  | spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |

- MECM:
  | Component  | Version  | CVE  |
  |------------|----------|------|
  | lodash | 4.17.13 | CVE-2020-8203 |
  | minimatch | 3.0.4 | NPM-118 |

 **Upgrade Notes**

 N/A

 **Deprecation Notes**

 N/A

 **Other**

 N/A
