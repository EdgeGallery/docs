## 简介
本文将指导用户如何在本地搭建AppStore-be和AppStore-fe模块，从而帮助开发者快速理解、开发代码。

其中AppStore-be的本地启动依赖于：
```
- Service Center
- DataBase
- UserManagement
```
其中AppStore-fe的本地启动依赖于:
```
- WebsiteGateway
- UserManagement
- AppStore-be
```
所以为了搭建本地开发环境，最终的启动顺序为 Service Center -> DataBase -> UserManagement -> AppStore-be -> WebsiteGateway(AppStore-fe)

## 流程详解
- ### Service Center
1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

2、解压后运行 start-service-center.bat  和  start-frontend.bat


