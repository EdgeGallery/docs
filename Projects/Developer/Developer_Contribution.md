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

![输入图片说明](https://images.gitee.com/uploads/images/2020/0917/141631_0f92f2de_5504908.png "dev-db.png")

4、根据[developer部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/developer/templates/developer-be/developer-be-configmap.yaml) 中的数据库语句创建表结构

![输入图片说明](https://images.gitee.com/uploads/images/2020/0917/141811_dfeec2eb_5504908.png "dev-sql.png")

5、创建名为usermgmtdb的数据库

6、根据[usermgmt部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构

- ### UserManagement

1、下载user-mgmt-be代码和user-mgmt-fe代码

2、安装node.js和npm，进入user-mgmt-fe文件夹，运行`npm install`和`npm run build`

3、在user-mgmt-be的src/main/resources/文件夹中创建static文件夹

4、将user-mgmt-fe编译出的dist文件夹中的内容拷贝到user-mgmt-be的static文件夹中

5、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量

![输入图片说明](https://images.gitee.com/uploads/images/2020/0917/150744_df40e73d_5504908.png "user-env.png")

6、运行MainServer函数，启动UserManagement