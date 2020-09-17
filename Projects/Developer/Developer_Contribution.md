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

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2、解压后运行 start-service-center.bat  和  start-frontend.bat

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg")

- ### DataBase

1、下载、安装、启动 Postgresql 最新版本

2、设置登录名和密码，例如 postgresql/root

3、创建名为developerdb的数据库

![输入图片说明](https://images.gitee.com/uploads/images/2020/0917/113411_59204055_5504908.png "developer-db.png")

4、根据[developer部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/developer/templates/developer-be/developer-be-configmap.yaml) 中的数据库语句创建表结构

![输入图片说明](https://images.gitee.com/uploads/images/2020/0917/113700_4dc810bf_5504908.png "bushu.png")

5、创建名为usermgmtdb的数据库

6、根据[usermgmt部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构