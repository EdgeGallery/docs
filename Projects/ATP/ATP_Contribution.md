ATP Contribution
============

## 搭建本地开发环境

本文将指导用户如何在本地搭建atp和atp-fe模块，从而帮助开发者快速理解、开发代码。

其中atp的本地启动依赖于：
```
- Service Center
- DataBase
- UserManagement
```
其中atp-fe的本地启动依赖于:
```
- WebsiteGateway
- UserManagement
- atp
```
所以为了搭建本地开发环境，最终的启动顺序为 Service Center -> DataBase -> UserManagement -> atp -> WebsiteGateway(atp-fe)


### Service Center

1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

![](/uploads/images/2021/cor2020/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2、解压后运行 start-service-center.bat  和  start-frontend.bat

![](/uploads/images/2021/cor2020/153735_4dafd335_7625245.jpeg "service center2.jpg")

### DataBase

1、下载、安装、启动 Postgresql 最新版本

2、设置登录名和密码，例如 postgresql/root

3、创建名为atpdb的数据库

4、根据[atp部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/atp/templates/atp/atp-configmap.yaml) 中的数据库语句创建表结构

5、创建名为usermgmtdb的数据库

6、根据[usermgmt部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构

### UserManagement

1、下载user-mgmt-be代码和user-mgmt-fe代码

2、安装node.js和npm，进入user-mgmt-fe文件夹，运行`npm install`和`npm run build`

3、在user-mgmt-be的src/main/resources/文件夹中创建static文件夹

4、将user-mgmt-fe编译出的dist文件夹中的内容拷贝到user-mgmt-be的static文件夹中

5、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量

![](/uploads/images/2021/cor2020/150744_df40e73d_5504908.png "user-env.png")

6、运行MainServer函数，启动UserManagement

### atp

1、下载atp代码

2、在编译器（此处以IDEA为例）中配置atpApp的运行时环境变量

![](/uploads/images/2021/cor2020/154506_0ed087ca_5504908.png "dev-config.png")

3、运行atpApp函数，启动atp

### atp-fe

1、下载atp-fe代码

2、进入atp-fe文件夹，运行`npm install`和`npm run build`

3、下载website-gateway代码

4、在website-gateway的src/main/resources/文件夹中创建static文件夹

5、将atp-fe编译出的dist文件夹中的内容拷贝到website-gateway的static文件夹中

6、修改website-gateway中/src/main/resources/application.yaml 文件内的`server.port`为`8080`

7、在编译器（此处以IDEA为例）中配置GatewayApp的运行时环境变量

![](/uploads/images/2021/cor2020/160010_6fafc86e_5504908.png "ws-config.png")

8、运行GatewayApp启动WebsiteGateway与atp-fe，浏览器访问http://127.0.0.1:8080/ 即可访问到atp首页
