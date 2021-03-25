如何贡献
==========================

本文将向用户展示如何参与到AppStore项目的贡献中，内容分为两个部分，将分别介绍如何搭建本地开发环境和AppStore的操作指导。

## 搭建本地开发环境-Release 1.0

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

4、创建名为usermgmtdb的数据库

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

6、修改website-gateway中/src/main/resources/application.yaml 文件内的`server.port`为`8080`(与usermgmt启动时填写的`OAUTH_APPSTORE_CLIENT_URL`变量中的端口保持一致)

7、在编译器（此处以IDEA为例）中配置GatewayApplication的运行时环境变量

![](/uploads/images/2020/0908/154035_12e727fc_7625245.jpeg "appstore-fe1.jpg")

8、运行GatewayApplication启动WebsiteGateway与AppStore-fe，浏览器访问http://127.0.0.1:8080/ 即可访问到AppStore首页

## 操作指导

AppStore是开发者发布和上线App应用的市场，由Developer平台开发的边缘应用，经过测试可以直接分享到AppStore应用商店。也可直接上传符合平台规范的应用包，应用包文件类型为csar。一个APP对应多个Package，使用者可直接下载APP的最新版本Package或者下载指定版本的Package。

### 登录应用平台
 进入网址后，默认为guest用户，可以查看信息。如果要进行更多操作（如上传应用）还需注册账号，注册完成，使用该账户登录之后便可进入应用平台首页：
![](/uploads/images/2021/appstore/guest.png "1.1")
![](/uploads/images/2021/appstore/register_user.png "1.2")
![](/uploads/images/2021/appstore/login.png "1.3")
![](/uploads/images/2021/appstore/login_appstore.png "1.4")


### 查看应用
1. 点击应用查看应用详情，详情界面展示应用版本，行业，类型等基本信息，下侧展示具体介绍，基本信息中的右侧操作中，右侧下载按钮有权限设置，只能下载自己上传的包，管理员用户可以下载所有发布的包和自己上传的包。
2. 如需对APP进行评论，可以在评论区输入评论，设置评分，鼠标左键点击按钮后，评论提交成功。
![](/uploads/images/2021/appstore/app_detail.png "2.1")
![](/uploads/images/2021/appstore/comment.png "2.2")
![](/uploads/images/2021/appstore/comments.png "2.3")


### 发布应用
1.上传APP，打开APP Store主界面，点击右侧上传图标，打开上传APP对话框。在上传对话框中选择需要上传的APP，上传或选择系统默认提供的APP图标，选择APP行业、类型、架构，填写APP简单描述，点击确认完成上传。
![](/uploads/images/2021/appstore/upload.png "3.1")

2.应用上传后，会自动跳转至我的应用界面下，上传的应用需要经过平台的atp测试之后才可以发布到仓库。我的应用下是上传的包的基本信息，表格右侧为基本操作，点击测试按钮，会开始创建测试任务，页面为嵌套的atp测试页面，点击开始测试按钮，解析包的依赖，可以看到具体的测试用例有多少条，点击确定后开始测试，页面为测试进展页面，可以返回到我的应用页面，等待测完成
![](/uploads/images/2021/appstore/totest.png "3.2")
![](/uploads/images/2021/appstore/test_task.png "3.3")
![](/uploads/images/2021/appstore/test_success.png "3.4")

3.我的应用中测试状态为Test_success（即测试成功）时才能发布应用，点击右侧的发布按钮，发布成功后，在首页可以看到你上传的应用。
![](/uploads/images/2021/appstore/topublish.png "3.5")

![](/uploads/images/2021/appstore/published.png "3.6")


### 共享应用
1.应用共享导航下分为外部应用仓库管理、应用推广、应用拉取、消息中心和操作分析；
![](/uploads/images/2021/appstore/app_share.png "4.1")

2.外部应用仓库管理页面，可以添加、修改和删除仓库。
![](/uploads/images/2021/appstore/third_appstores.png "4.2")

3.点击应用共享主菜单下的应用推送菜单查看可推送的应用信息，选择需要推送给运营商或者第三方的应用，打开应用推送操作对话框。点击推送操作对话框左下角执行按钮，触发推送任务，然后查看应用推送到运营商或者第三方的结果。
![](/uploads/images/2021/appstore/topush.png "4.3")
![](/uploads/images/2021/appstore/pushed.png "4.4")

4.点击应用共享主菜单下的应用拉取菜单查看各个外部仓库可拉取的应用信息，选择需要拉取的应用可进行批量拉取。
![](/uploads/images/2021/appstore/topull.png "4.5")
![](/uploads/images/2021/appstore/pulled.png "4.6")

5.点击应用共享主菜单下的消息中心菜单，查看通知信息，可以接受来自不同运营商需要推送的APP信息。通过单击消息中心右侧面板右上角的接收按钮可以拉取（下载）该应用的信息，拉取成功的APP可以在APP推送界面查看，点击删除按钮则删除该条消息，双击可查看消息详情。
![](/uploads/images/2021/appstore/messages.png "4.7")
![](/uploads/images/2021/appstore/message_detail.png "4.8")

6.应用推送成功后切换到右边操作分析tab，在操作分析界面查看对应的信息，同时操作分析界面可以查看不同操作如：拉取、下载、通知、推送等类型的消息。
![](/uploads/images/2021/appstore/operations.png "4.9")


