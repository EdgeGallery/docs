如何贡献
==========================

本文将向用户展示如何参与到AppStore项目的贡献中，内容分为两个部分，将分别介绍如何搭建本地开发环境和AppStore的操作指导。

## 搭建本地开发环境

本节将指导用户如何在本地搭建AppStore-be和AppStore-fe模块，从而帮助开发者快速理解、开发代码。

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

### Service Center

1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2、解压后运行 start-service-center.bat  和  start-frontend.bat

![](/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg")

### DataBase

1、下载、安装、启动 Postgresql 12.2

2、设置登录名和密码，例如 postgresql/root

3、创建名为appstoredb的数据库

![](/uploads/images/2020/0908/153833_89c54e53_7625245.jpeg "db1.jpg")

4、根据[appstore部署文件](https://gitee.com/EdgeGallery_group/helm-charts/blob/master/appstore/templates/appstore-be/appstore-be-configmap.yaml) 中的数据库语句创建表结构

![](/uploads/images/2020/0908/153843_47080502_7625245.jpeg "db2.jpg")

5、创建名为usermgmtdb的数据库

6、根据[usermgmt部署文件](https://gitee.com/EdgeGallery_group/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构

### UserManagement

1、下载user-mgmt-be代码和user-mgmt-fe代码

2、安装node.js和npm，进入user-mgmt-fe文件夹，运行`npm install`和`npm run build`

3、在user-mgmt-be的src/main/resources/文件夹中创建static文件夹

4、将user-mgmt-fe编译出的dist文件夹中的内容拷贝到user-mgmt-be的static文件夹中

5、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量

![](/uploads/images/2020/0908/154011_896d887f_7625245.jpeg "usermgmt1.jpg")

6、运行MainServer函数，启动UserManagement

### AppStore-be

1、下载appstore-be代码

2、修改appstore-be中/src/main/resources/application.yaml 文件内的`servicecomb.rest.address`为`127.0.0.1:8099`

3、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量

![](/uploads/images/2020/0908/154023_9c49d20c_7625245.jpeg "appstore-be1.jpg")

3、运行MainServer函数，启动appstore-be

### AppStore-fe

1、下载appstore-fe代码

2、进入appstore-fe文件夹，运行`npm install`和`npm run build`

3、下载website-gateway代码

4、在website-gateway的src/main/resources/文件夹中创建static文件夹

5、将appstore-fe编译出的dist文件夹中的内容拷贝到website-gateway的static文件夹中

6、修改website-gateway中/src/main/resources/application.yaml 文件内的`server.port`为`8080`

7、在编译器（此处以IDEA为例）中配置GatewayApplication的运行时环境变量

![](/uploads/images/2020/0908/154035_12e727fc_7625245.jpeg "appstore-fe1.jpg")

8、运行GatewayApplication启动WebsiteGateway与AppStore-fe，浏览器访问http://127.0.0.1:8080/ 即可访问到AppStore首页

## 操作指导

AppStore是开发者发布和上线App应用的市场，由Developer平台开发的边缘应用，经过测试可以直接分享到AppStore应用商店。也可直接上传符合平台规范的应用包，应用包文件类型为csar。一个APP对应多个Package，使用者可直接下载APP的最新版本Package或者下载指定版本的Package。

### 登录注册
 进入网址后，注册账号，注册完成之后，登录界面
![](/uploads/images/2020/0908/163000_767c7da4_5416924.png "注册.PNG")
![](/uploads/images/2020/0908/163022_fe7cc972_5416924.png "登录.PNG")

### 商店首页
登陆成功后进入商店首页

![](/uploads/images/2020/0908/162506_099b5658_5416924.png "首页.PNG")

### 应用详情
1. 点击应用查看应用详情，详情界面展示应用版本，行业，类型等基本信息，下侧展示具体介绍，基本信息中的右侧操作中，可以鼠标点击下载按钮，下载csar包；

![](/uploads/images/2020/0908/163133_ad521f54_5416924.png "应用详情.PNG")

2. 如需对APP进行评论，可使用鼠标左键点击APP详情右侧下方的评论按钮，在弹出的评论框输入评论，设置评分，鼠标左键点击按钮后，评论提交成功。

![](/uploads/images/2020/0908/163237_9f574a3d_5416924.png "评论界面.PNG")

### 上传应用
1.上传APP，打开APP Store主界面，点击右侧上传图标，打开上传APP对话框。

![](/uploads/images/2020/0908/163449_f7591d08_5416924.png "首页上传.PNG")

2.在上传对话框中选择需要上传的APP，上传或选择系统默认提供的APP图标，选择APP行业、类型、架构，填写APP简单描述，点击确认完成上传。

![](/uploads/images/2020/0908/163540_358bd2b9_5416924.png "上传界面.PNG")

### 我的应用
1.如需查看用户所上传的所有APP 列表，在主页点击 “我的应用/My APP”。

2.删除应用可通过点击我的应用列表最右侧操作一栏的功能完成。

![](/uploads/images/2020/0908/163634_86ff98f2_5416924.png "我的应用.PNG")