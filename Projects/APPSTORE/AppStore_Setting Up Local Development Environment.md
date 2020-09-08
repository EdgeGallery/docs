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

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/145609_130f04c9_7625245.png "屏幕截图.png")

2、解压后运行 start-service-center.bat  和  start-frontend.bat

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/145614_e28a01c3_7625245.png "屏幕截图.png")

- ### DataBase

1、下载、安装、启动 Postgresql 12.2

2、设置登录名和密码，例如 postgresql/root

3、创建名为appstoredb的数据库

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/145939_2e4b19a9_7625245.png "屏幕截图.png")

4、根据[appstore部署文件](https://gitee.com/EdgeGallery_group/helm-charts/blob/master/appstore/templates/appstore-be/appstore-be-configmap.yaml) 中的数据库语句创建表结构

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/145954_0d140810_7625245.png "屏幕截图.png")

5、创建名为usermgmtdb的数据库

6、根据[usermgmt部署文件](https://gitee.com/EdgeGallery_group/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构

- ### UserManagement

1、下载user-mgmt-be代码和user-mgmt-fe代码

2、安装node.js和npm，进入user-mgmt-fe文件夹，运行`npm install`和`npm run build`

3、在user-mgmt-be的src/main/resources/文件夹中创建static文件夹

4、将user-mgmt-fe编译出的dist文件夹中的内容拷贝到user-mgmt-be的static文件夹中

5、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/150502_27fbe6c2_7625245.png "屏幕截图.png")

6、运行MainServer函数，启动UserManagement

- ### AppStore-be

1、下载appstore-be代码

2、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/150641_895a31a0_7625245.png "屏幕截图.png")

3、运行MainServer函数，启动appstore-be

- ### AppStore-fe

1、下载appstore-fe代码

2、进入appstore-fe文件夹，运行`npm install`和`npm run build`

3、下载website-gateway代码

4、在website-gateway的src/main/resources/文件夹中创建static文件夹

5、将appstore-fe编译出的dist文件夹中的内容拷贝到website-gateway的static文件夹中

6、修改website-gateway中/src/main/resources/application.yaml 文件内的`server.port`为`8080`

7、在编译器（此处以IDEA为例）中配置GatewayApplication的运行时环境变量

![输入图片说明](https://images.gitee.com/uploads/images/2020/0908/150934_a4743ec2_7625245.png "屏幕截图.png")

8、运行GatewayApplication启动WebsiteGateway与AppStore-fe，浏览器访问http://127.0.0.1:8080/ 即可访问到AppStore首页



