��    -      �              �  Q   �  Q   ?  G   �  H   �  I   "  K   l  J   �  ^        b       1   �  4   �  V     ]   Z  E   �  5   �  G   4     |  '   �  J   �  1     M   A  b   �  �   �  &   �	  T   �	  e   )
  c   �
  �   �
  1   �  T   �  ~   #     �     �     �     �     �     �  -   �  +   '  �   S     �  �   	     �  �  �  Q   $  Q   v  G   �  H     I   Y  K   �  J   �  _   :     �     �  6   �  4     m   @  _   �  M     >   \  F   �  #   �  &     J   -  5   x  M   �  f   �  �   c  %   "  k   H  g   �  m     �   �  3   E  m   y  �   �     j     s     �     �     �     �  /   �  4   �  �   %     �  �   �     �   ![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg") ![](/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg") ![](/uploads/images/2020/0917/141631_0f92f2de_5504908.png "dev-db.png") ![](/uploads/images/2020/0917/141811_dfeec2eb_5504908.png "dev-sql.png") ![](/uploads/images/2020/0917/150744_df40e73d_5504908.png "user-env.png") ![](/uploads/images/2020/0917/154506_0ed087ca_5504908.png "dev-config.png") ![](/uploads/images/2020/0917/160010_6fafc86e_5504908.png "ws-config.png") 1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/) 1、下载developer-be代码 1、下载developer-fe代码 1、下载user-mgmt-be代码和user-mgmt-fe代码 1、下载、安装、启动 Postgresql 最新版本 2、在编译器（此处以IDEA为例）中配置DeveloperApp的运行时环境变量 2、安装node.js和npm，进入user-mgmt-fe文件夹，运行`npm install`和`npm run build` 2、解压后运行 start-service-center.bat  和  start-frontend.bat 2、设置登录名和密码，例如 postgresql/root 2、进入developer-fe文件夹，运行`npm install`和`npm run build` 3、下载website-gateway代码 3、创建名为developerdb的数据库 3、在user-mgmt-be的src/main/resources/文件夹中创建static文件夹 3、运行DeveloperApp函数，启动developer-be 4、在website-gateway的src/main/resources/文件夹中创建static文件夹 4、将user-mgmt-fe编译出的dist文件夹中的内容拷贝到user-mgmt-be的static文件夹中 4、根据[developer部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/developer/templates/developer-be/developer-be-configmap.yaml) 中的数据库语句创建表结构 5、创建名为usermgmtdb的数据库 5、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量 5、将developer-fe编译出的dist文件夹中的内容拷贝到website-gateway的static文件夹中 6、修改website-gateway中/src/main/resources/application.yaml 文件内的`server.port`为`8080` 6、根据[usermgmt部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构 6、运行MainServer函数，启动UserManagement 7、在编译器（此处以IDEA为例）中配置GatewayApp的运行时环境变量 8、运行GatewayApp启动WebsiteGateway与developer-fe，浏览器访问http://127.0.0.1:8080/ 即可访问到developer首页 DataBase Deveoper Contribution Service Center UserManagement developer-be developer-fe 其中developer-be的本地启动依赖于： 其中developer-fe的本地启动依赖于: 所以为了搭建本地开发环境，最终的启动顺序为 Service Center -> DataBase -> UserManagement -> developer-be -> WebsiteGateway(developer-fe) 本地开发环境搭建 本文将指导用户如何在本地搭建developer-be和developer-fe模块，从而帮助开发者快速理解、开发代码。 流程详解 Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-05-26 17:32+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
 ![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg") ![](/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg") ![](/uploads/images/2020/0917/141631_0f92f2de_5504908.png "dev-db.png") ![](/uploads/images/2020/0917/141811_dfeec2eb_5504908.png "dev-sql.png") ![](/uploads/images/2020/0917/150744_df40e73d_5504908.png "user-env.png") ![](/uploads/images/2020/0917/154506_0ed087ca_5504908.png "dev-config.png") ![](/uploads/images/2020/0917/160010_6fafc86e_5504908.png "ws-config.png") 1.Download [Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/) 1.Download developer-be code 1.Download developer-fe code 1.download the user-mgmt-be code and user-mgmt-fe code 1.Download, install, start Postgresql latest version 2.Configure runtime environment variables for DeveloperApp in the compiler (where IDEA is used as an example) 2.install node.js and npm, enter the user-mgmt-fe folder, run `npm install` and `npm run build` 2.Run the start-service-center.bat and start-frontend.bat after decompression 2.setting the login name and password, such as postgresql/root 2.Enter the developer-fe folder, run `npm install` and `npm run build` 3.download the website-gateway code 3.Create a database called developerdb 3.create a static folder in the src/main/resources/ folder in user-mgmt-be 3.Run the DeveloperApp function to start developer-be 4.Create a static folder in the src/main/resources/ folder on website-gateway 4.copy the contents in the dist folder compiled by user-mgmt-fe into the static folder of user-mgmt-be 4.Create table structure based on database statement in [developer deployment document](https://gitee.com/edgegallery/helm-charts/blob/master/developer/developer/developer-be-configmap.yaml) 5.Create a database called usermgmtdb 5.Configure runtime environment variables for MainServer in the compiler (where IDEA is used as an example) 5.copy the contents in the dist folder compiled by developer-fe in the static folder of website-gateway 6.Modify the `server.port` in the /src/main/resources/application.yaml document in the website-gateway `8080` 6.Create table structure based on database statement in [usermgmt deployment document](https://gitee.com/edgegallery/helm-chargs/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml) 6.Run the MainServer function, start UserManagement 7.Configuring runtime environment variables for GatewayApp in the compiler (where IDEA is used as an example) 8.Run GatewayApp Launch WebiteGateway with developer-fe, browser access to http://127.0.0.1:8080/ to access the developer homepage DataBase Defoper Contribution Service Center UserManagement developer-be developer-fe Where developer-be local activation depends on: The local activation of the developer-fe depends on: So in order to build a local development environment, the final sequence is Service Center - > DataBase - > UserManagement - > developer-be - > WebiteGateway (developer-fe) Local development environment This article will guide users on how to build developer-be and developer-fe modules locally, helping developers to quickly understand, develop code. Process Long 