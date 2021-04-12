.. This work is licensed under a Creative Commons Attribution 4.0 International License. <br>
.. http://creativecommons.org/licenses/by/4.0 <br>
.. Copyright 2019-2020 Huawei Technologies Co., Ltd. <br>

Release Notes
=============

EdgeGallery Introduction
------------------------
Edgegallery is a 5g MEC open source edge computing platform. It is an end-to-end solution for application and application developers. For app applications, in addition to the basic MEP platform supporting application running, it also provides an app management system (MEC Manager, minimal management, including some functions of MEPM and MEAO), can manage the end-to-end life cycle of applications, provide a toolchain for the migration of X86 applications to arm, and support the smooth cross-platform migration and tuning of applications. For application developers, it provides a complete ide environment and integrated verification environment for application development and provides a one-stop development experience for application developers. At the same time, the app store function provides a standard access verification process for apps developed by application developers.
- [project introduction](https://gitee.com/edgegallery/docs/blob/master/Get%20Started/Start%20from%20A%20Demo%20on%20EdgeGallery%2Emd)
- [developer's Guide](https://gitee.com/edgegallery/docs/tree/master/Developer%20Guide)


Version: v1.1.0
---------------

- Release Date: 2020-04-02
- Image Version: v1.1.0

**List of new open source warehouses**


|Module | name | type | URL | description|
| ------------------------------ | :-------------: | ------ | --------------------------------------------- | -------------------------------------- |
|Example applications | example apps | POC|https://gitee.com/edgegallery/example-apps |Provide a sample app based on edgegallery|
|Edgegallery front component | eg view | product warehouse|https://gitee.com/edgegallery/eg-view |Provide normalized edgegallery front end components|
|Edgegallery testing platform | edget | POC|https://gitee.com/edgegallery/edgeT |Provide local testing toolchain for users|


**New Features**


[**detailed description of release plan**](https://gitee.com/edgegallery/community/tree/master/Architecture%20WG/Requirements/v1.1)
 

* [AI software and hardware capability] supports the hardware of shengteng / atlas and open API
    - AI image restoration, edge detection, cartoon image generation, image coloring, object classification, target detection, etc;
* Cross-platform support supports the incubation integration of virtual machine applications based on openstack and container applications based on k8s
* [experience optimization]
    - App classification, APP recommendation and dynamic refresh of popular products
* [edgeenational support]
    - IAAs / PAAS / applications support on-demand deployment and automatic generation of application framework
    - Visualization of MEP microservice Management Architecture
    - Provide edgegallery applet, design state, etc
* [API management] matching of ETSI MEC API, 3GPP CAPIF and ascension capability
* [security, user management]
    - Divide power and domain to control the key operation and data
    - Application remote login (such as VNC) supports security protocol login
* [community laboratory enhancement]
    - Provide real E2E 5g verification environment
    - One-click application, one-click release and visual management of resources
* [application innovation]
    - Appstore federation can register external appstores, and applications can push and pull each other between different appstores
    - Completed 80 + application integration, landing 17 + innovation base and postgraduate courses of Xi&apos; an University of Electronic Science and technology


**Bug Fixes** 


  See [edgegallery V1.1.0 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.1%20Test%20Report.md)
 

**Known Issues**


  See [edgegallery V1.1.0 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.1%20Test%20Report.md)
 

**Security Notes**


*Fixed Security Issues*


  See [edgegallery V1.1.0 test report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Plan/Release-R1.1/EG%20R1.1%20Security%20Test%20Plan%20.md)


*Known Security Issues*


  See [edgegallery V1.1.0 security test report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.1/EG%20v1.1%20Security%20Test%20Report.md)
 
*Known Vulnerabilities in Used Modules*


The following vulnerabilities exist in the third-party open-source components of EdgeGallelry V1.1.0, which need to be fixed by users themselves:

- Appstore:

| Component | Version | CVE |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| log4j | 1.2.17 | CVE-2019-17571 |
| netty-transport | 4.1.36.Final | CVE-2019-20444 CVE-2019-20445 CVE-2019-16869 CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| docker-java-core | 3.2.7 | CVE-2019-13139 CVE-2019-13509 CVE-2019-16884 CVE-2019-5736|
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-jdbc | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |

 
-Developer:

| Component | Version | CVE |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444 CVE-2019-20445 CVE-2019-16869 CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| swagger-codegen-cli | 3.0.21 | CVE-2018-8088 CVE-2016-6199 CVE-2019-15052 CVE-2020-25649 CVE-2019-10086 CVE-2017-1000207 CVE-2017-1000208 CVE-2017-18640 CVE-2020-11979 |
| docker-java-core | 3.2.7 | CVE-2019-13139 CVE-2019-13509 CVE-2019-16884 CVE-2019-5736|
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |


- ATP

| Component | Version | CVE |
|---|---|---|
| netty-transport | 4.1.36.Final | CVE-2019-20444 CVE-2019-20445 CVE-2019-16869 CVE-2020-11612 |
| vertx-core | 3.9.4 | CVE-2019-17640 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| mybatis-spring | 2.0.6 | CVE-2020-26945 |
| mybatis-spring-boot-starter | 2.1.4 | CVE-2020-26945 |
| spring-security-core | 5.1.5.RELEASE | CVE-2018-1258 |
| spring-core | 5.1.8.RELEASE | CVE-2020-5398 |

- User-mgmt:


| Component | Version | CVE |
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

**List of new open source warehouses**


|Module | name | type | URL | description|
| ------------------------------ | :-------------: | ------ | --------------------------------------------- | -------------------------------------- |
|ATP (application test platform) | ATP | product warehouse|https://gitee.com/edgegallery/atp |Application testing platform provides testing support for application certification|
|ATP (application test platform) | ATP Fe | product warehouse|https://gitee.com/edgegallery/atp-fe |Provide the foreground support of application testing and certification platform|
|Developer | crane framework | product warehouse|https://gitee.com/edgegallery/crane-framework |To provide lightweight for application development, plug-in is the development framework|
|Mecm | mecm approlemgr | product warehouse|https://gitee.com/edgegallery/mecm-apprulemgr |The management side provides the ability to configure, distribute and manage application rules|

 
**New Features**


[**detailed description of release plan**](https://gitee.com/edgegallery/community/tree/master/TSC/Release/v1.0)

* [developer] optimizes app development test release process, optimizes API interface, and integrates multi language SDK
    - Optimize the home page design and add application development life cycle flow chart;
    - Optimize the project development process, new interface design;
    - Optimize the deployment and test link, increase the visualization display, the deployment process display and the pod display of the deployment results;
    - Optimize the interface of capability center and increase the selection of capability classification;
    - Application release link docking certification test platform;
* [app store] interface ease of use optimization, edgegallery ecological capability optimization
* [mecm] optimize the topology, application management and edge node management, add the function of acquiring MEP capability and AK / SK configuration interface
* [MEP] supports app heartbeat detection, adding an interface to acquire MEP capability, an AK / SK configuration interface, and an interface to acquire token for MEP agent
* Enhanced test capability of ATP app application
* [test] provides health check function, optimizes installation package, develops test platform, and supports test case management
 
* POC characteristics
    - MEP service governance page display
    - Introducing a plug-in application framework [crane framework]（https://gitee.com/edgegallery/crane-framework)
    - Appstore federation can register external appstores, and applications can push and pull each other between different appstores


**PoC Test Report**


  See [edgegallery v1.0.0 POC test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.0%20Poc%20Requirement%20Test%20Report%2Emd)

 
**Bug Fixes**


  See [edgegallery v1.0.0 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.0%20Test%20Report%2Emd)


**Known Issues**


  See [edgegallery v1.0.0 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R1.0%20Test%20Report%2Emd)


**Security Notes**


*Fixed Security Issues*


  See [edgegallery v1.0.0 test report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.0/EG%20v1.0.0%20Security%20Test%20Report.md)


*Known Security Issues*


  See [edgegallery v1.0.0 test report](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Security%20Test%20Result/Test%20result%20Release%20V1.0/EG%20v1.0.0%20Security%20Test%20Report.md)


*Known Vulnerabilities in Used Modules*


The following vulnerabilities exist in the third-party open source components of edgegallelry v1.0.0, which need to be fixed by users themselves:

- Appstore:

| Component | Version | CVE |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| log4j (indirect dependency) | 1.2.17 | CVE-2019-17571 |
| bcprov-jdk15on-1.66.jar | 1.66 | CVE-2020-28052 |
| jackson-databind | 2.10.5 | CVE-2020-25649 |
| spring-security-oauth2 | 2.3.3.RELEASE | CVE-2018-15758 |
| tomcat-embed-core | 9.0.37 | CVE-2020-17525 |

- Developer:

| Component | Version | CVE |
|---|---|---|
| spring-beans (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core | 5.3.4.RELEASE | CVE-2018-1258 |
| jackson-databind | 2.10.5 | CVE-2020-25649 |
| mybatis-spring-boot-starter | 2.1.1 | CVE-2020-26945 |
| tomcat-embed-core | 9.0.37 | CVE-2020-17527 | 

- ATP

| Component | Version | CVE |
|---|---|---|
| mybatis-spring-boot-starter |2.1.1 | CVE-2020-26945|

- User-mgmt:

| Component | Version | CVE |
| ----------------------------------------------------- | ------------- | --------------------------- |
| spring-security-core |5.3.4.RELEASE | CVE-2018-1258 |
| bcprov-jdk15on | 1.66 | CVE-2020-28052 |
| jackson-databind | 2.10.5 | CVE-2020-25649 |
| mybatis-spring-boot-starter | 2.1.1 | CVE-2020-26945 |
| spring-security-oauth2 | 2.3.3.RELEAS | CVE-2018-15758 |

- Website-gateway:

| Component | Version | CVE |
| -------------------- | ------------- | -------------- |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |
| jackson-databind | 2.10.5 | CVE-2020-26945 |
| spring-security-oauth2 | 2.3.3 | CVE-2018-15758 |
| tomcat-embed-core | 9.0.37 | CVE-2020-17527 |

- MECM:

| Component | Version | CVE |
| --------- | ------- | ------------- |
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |


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

**List of new open source warehouses**

|Module | name | type | URL | description|
|-----------------|-----------------|--------|-----------------------------------------------|----------------------|
|Developer | API emulator | product warehouse|https://gitee.com/edgegallery/api-emulator |Simulation API providing basic capabilities|
|MEP | plugins | product warehouse|https://gitee.com/edgegallery/plugins |Plugins warehouse|
|Developer | toolchain | product warehouse|https://gitee.com/edgegallery/toolchain |Provides the X86 platform application when the arm source code analysis function|


**New Features**

[**detailed description of release plan**](https://gitee.com/edgegallery/community/tree/master/TSC/Release/v0.9.x)
 
* Summary of safety design troubleshooting problems
* API simulator, toolchain and plugin warehouse are open source
* [MEP / MEP agent] AK / SK configuration interface


**Bug Fixes**

  See [edgegallery v0.9.1 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report.md)

**Known Issues**

  See [edgegallery v0.9.1 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report.md)

**Security notes**

*Fixed Security Issues*

  See [edgegallery v0.9.1 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report.md)

*Known Security Issues*

  See [edgegallery v0.9.1 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/%20EdgeGallery%20R0.9.1%20Test%20Report.md)

*Known Vulnerabilities in Used Modules*

The following vulnerabilities exist in the third-party open source components of EdgeGallelry v0.9.1, which need to be fixed by users themselves:

- Appstore:


| Component | Version | CVE |
| ------------------------------------------ | ------------- | ------------------------------------------------------------ |
| netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| log4j (indirect dependency) | 1.2.17 | CVE-2019-17571 |
| spring-jdbc (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258 |
| bcprov-jdk15on-1.66.jar | 1.66 | CVE-2020-28052 |
| foundation-ssl | 1.3.0 | CVE-2004-0009 |
| jackson-databind | 2.10.5 | CVE-2020-25649 |
| mybatis | 3.5.3 | CVE-2020-25645 |
| spring-security-oauth2 | 2.3.3.RELEASE | CVE-2018-15758 |
| tomcat-embed-core | 9.0.37 | CVE-2020-17525 |
| vertx-core | 3.6.3 | CVE-2019-17640 |


- Developer:

| Component | Version | CVE |
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


- User-mgmt:

| Component | Version | CVE |
|---|---|---|
| rxnetty (indirect dependency) | 0.4.9 | CVE-2015-2156 |
| netty-tcnative-boringssl-static (indirect dependency) | 2.0.31.Final | CVE-2015-2156 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |
| lodash | 4.17.20 | NPM-1065, NPM-557, NPM-7823 |
| minimatch | 3.0.4 | NPM-118 |


- Website-gateway:

| Component | Version | CVE |
|---|---|---|
| log4j | 1.2.17 | CVE-2019-17571 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |


- MECM:
 
| Component | Version | CVE |
|---|---|---|
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |


**Upgrade Notes**

N/A
 
**Deprecation Notes**

N/A

**Other**

After the review of the security working group, the problem sheet of plugins warehouse [i1xa0n](https://gitee.com/OSDT/dashboard/programs/114640/issues?issue_Id = i1xa0n) will be repaired in the form of patch after the release of version V0.9. Please refer to the security working group [minutes of meeting](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Meetings/Meeting%20Minutes%2030-09-2020%2Emd) for details.

-----------------------------------------------------------------------------

Version: v0.9
--------------

- Release Date: 2020-09-30
- Image Version: v0.9

**List of new open source warehouses**

|Module | name | type | URL | description|
|-----------------|-----------------|--------|-----------------------------------------------|----------------------|
|Helm charts | helm charts | deployment|https://gitee.com/edgegallery/helm-charts |Edgegallery deployment script|
|Website gateway | website gateway | product warehouse|https://gitee.com/edgegallery/website-gateway |Front desk packaging|
|User Mgmt | user Mgmt | product warehouse|https://gitee.com/edgegallery/user-mgmt |Background of usermgmt|
|User Mgmt | user MGMT Fe | product warehouse|https://gitee.com/edgegallery/user-mgmt-fe |Usermgmt front desk|
|Mecm | mecm Fe | product warehouse|https://gitee.com/edgegallery/mecm-fe |Mecm front desk|
|Mecm | mecm applcm | product warehouse|https://gitee.com/edgegallery/mecm-applcm |Mecm application lifecycle management|
|Mecm | mecm APM | product warehouse|https://gitee.com/edgegallery/mecm-apm |Mecm application package management|
|Mecm | mecm inventory | product warehouse|https://gitee.com/edgegallery/mecm-inventory |Mecm stock management|
|Mecm | mecm app | product warehouse|https://gitee.com/edgegallery/mecm-appo |Mecm application choreography|
|Developer | developer be | product warehouse|https://gitee.com/edgegallery/developer-be |Developer background|
|Developer | developer Fe | product warehouse|https://gitee.com/edgegallery/developer-fe |Developer front desk|
|Appstore | Appstore Fe | product warehouse|https://gitee.com/edgegallery/appstore-fe |Front desk of Appstore|
|Appstore | Appstore be | product warehouse|https://gitee.com/edgegallery/appstore-be |App store background|
|Platform Mgmt | platform Mgmt | product warehouse|https://gitee.com/edgegallery/platform-mgmt |Install K8 / docker|
|Doc | doc | product warehouse|https://gitee.com/edgegallery/docs |Documentation|


**New Features**

[**detailed description of release plan**](https://gitee.com/edgegallery/community/tree/master/TSC/Release/v0.9)

* All in one MEP / mecm network isolation
* MEP supports DNS configuration
* Support all in one deployment
* Multi node offline deployment
* Nine dimensions of security optimization
* Mecm interface / topology management / resource management optimization
* (POC) kubeedge integration verification

**Bug Fixes**

  See [edgegallery V0.9 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

**Known Issues**

  See [edgegallery V0.9 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

**Security notes**

*Fixed Security Issues*

  See [edgegallery V0.9 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

*Known Security Issues*

  See [edgegallery V0.9 test report](https://gitee.com/edgegallery/community/blob/master/Test%20WG/Test%20Release/EdgeGallery%20R0.9%20Test%20%20Report%20%2Emd)

*Known Vulnerabilities in Used Modules*

The following vulnerabilities exist in the third-party open source components of edgegallelry V0.9, which need to be fixed by users themselves:


- Appstore:

| Component | Version | CVE |
|---|---|---|
| netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| log4j (indirect dependency) | 1.2.17 | CVE-2019-17571 |
| spring-jdbc (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-core (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258 |


-Developer:

| Component | Version | CVE |
|---|---|---|
| netty-transport (indirect dependency) | 4.1.36.Final | CVE-2019-20444, CVE-2019-20445, CVE-2020-11612, CVE-2019-16869 |
| spring-beans (indirect dependency) | 5.1.8.RELEASE | CVE-2020-5398 |
| spring-security-config (indirect dependency) | 5.1.5.RELEASE | CVE-2018-1258, CVE-2020-5398 |
| spring-security-core | 5.3.4.RELEASE | CVE-2018-1258 |
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |

 
- User-mgmt:

| Component | Version | CVE |
|---|---|---|
| rxnetty (indirect dependency) | 0.4.9 | CVE-2015-2156 |
| netty-tcnative-boringssl-static (indirect dependency) | 2.0.31.Final | CVE-2015-2156 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |
| lodash | 4.17.20 | NPM-1065, NPM-557, NPM-7823 |
| minimatch | 3.0.4 | NPM-118 |


- Website-gateway:

| Component | Version | CVE |
|---|---|---|
| log4j | 1.2.17 | CVE-2019-17571 |
| spring-security-core | 5.2.6.RELEASE | CVE-2018-1258 |


- MECM:
 
| Component | Version | CVE |
|---|---|---|
| lodash | 4.17.13 | CVE-2020-8203 |
| minimatch | 3.0.4 | NPM-118 |


**Upgrade Notes**

N/A

**Deprecation Notes**

N/A

**Other**

 After the review of the security working group, the problem sheet of plugins warehouse [i1xa0n](https://gitee.com/OSDT/dashboard/programs/114640/issues?issue_Id=i1xa0n) will be repaired in the form of patch after the release of version V0.9. Please refer to the security working group [minutes of meeting](https://gitee.com/edgegallery/community/blob/master/Security%20WG/Meetings/Meeting%20Minutes%2030-09-2020%2Emd) for details.