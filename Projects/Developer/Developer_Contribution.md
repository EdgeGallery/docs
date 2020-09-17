Deveoper Contribution
----
## 简介

本文将指导用户如何在本地搭建developer-be和developer-fe模块，从而帮助开发者快速理解、开发代码。

其中developer-be的本地启动依赖于：
```
- Service Center
- DataBase
- UserManagement
```
其中developer-fe的本地启动依赖于:
```
- WebsiteGateway
- UserManagement
- developer-be
```
所以为了搭建本地开发环境，最终的启动顺序为 Service Center -> DataBase -> UserManagement -> developer-be -> WebsiteGateway(developer-fe)

## 流程详解

- ### Service Center

1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

![输入图片说明](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2、解压后运行 start-service-center.bat  和  start-frontend.bat

![输入图片说明](/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg")