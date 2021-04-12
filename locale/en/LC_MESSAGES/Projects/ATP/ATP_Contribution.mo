��    )      d              �  Q   �  Q   �  I   Q  K   �  J   �     2     O     `     n     �     �     �  ^   �     
     !  1   5  4   g  P   �  ]   �  E   K  5   �  A   �     	  !   )  J   K  "   �  M   �  b     �   j  &   	  T   .	  _   �	  c   �	  �   G
  1   �
  T   "  r   w     �  =  �  r   9  �  �  U   8  U   �  M   �  O   2  N   �  *   �     �               0     D     M  a   Y     �     �  7   �  5   (  m   ^  d   �  N   1  ?   �  E   �  $     !   +  K   M  !   �  N   �  g   
  �   r  &   #  l   J  f   �  t     �   �  4   S  n   �  v   �     n  T    �   �   ![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg") ![](/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg") ![](/uploads/images/2020/0917/150744_df40e73d_5504908.png "user-env.png") ![](/uploads/images/2020/0917/154506_0ed087ca_5504908.png "dev-config.png") ![](/uploads/images/2020/0917/160010_6fafc86e_5504908.png "ws-config.png") ### 本地开发环境搭建 ### 流程详解 #### DataBase #### Service Center #### UserManagement #### atp #### atp-fe 1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/) 1、下载atp-fe代码 1、下载atp代码 1、下载user-mgmt-be代码和user-mgmt-fe代码 1、下载、安装、启动 Postgresql 最新版本 2、在编译器（此处以IDEA为例）中配置atpApp的运行时环境变量 2、安装node.js和npm，进入user-mgmt-fe文件夹，运行`npm install`和`npm run build` 2、解压后运行 start-service-center.bat  和  start-frontend.bat 2、设置登录名和密码，例如 postgresql/root 2、进入atp-fe文件夹，运行`npm install`和`npm run build` 3、下载website-gateway代码 3、创建名为atpdb的数据库 3、在user-mgmt-be的src/main/resources/文件夹中创建static文件夹 3、运行atpApp函数，启动atp 4、在website-gateway的src/main/resources/文件夹中创建static文件夹 4、将user-mgmt-fe编译出的dist文件夹中的内容拷贝到user-mgmt-be的static文件夹中 4、根据[atp部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/atp/templates/atp/atp-configmap.yaml) 中的数据库语句创建表结构 5、创建名为usermgmtdb的数据库 5、在编译器（此处以IDEA为例）中配置MainServer的运行时环境变量 5、将atp-fe编译出的dist文件夹中的内容拷贝到website-gateway的static文件夹中 6、修改website-gateway中/src/main/resources/application.yaml 文件内的`server.port`为`8080` 6、根据[usermgmt部署文件](https://gitee.com/edgegallery/helm-charts/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml)中的数据库语句创建表结构 6、运行MainServer函数，启动UserManagement 7、在编译器（此处以IDEA为例）中配置GatewayApp的运行时环境变量 8、运行GatewayApp启动WebsiteGateway与atp-fe，浏览器访问http://127.0.0.1:8080/ 即可访问到atp首页 ATP Contribution 其中atp的本地启动依赖于： ``` - Service Center - DataBase - UserManagement ``` 其中atp-fe的本地启动依赖于: ``` - WebsiteGateway - UserManagement - atp ``` 所以为了搭建本地开发环境，最终的启动顺序为 Service Center -> DataBase -> UserManagement -> atp -> WebsiteGateway(atp-fe) 本文将指导用户如何在本地搭建atp和atp-fe模块，从而帮助开发者快速理解、开发代码。 Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-04-12 10:35+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 ! [](/uploads/images/2020/0908/153700_b069cf5f_7625245 .jpeg " service center1.jpg ") ! [](/uploads/images/2020/0908/153735_4dafd335_7625245 .jpeg " service center2.jpg ") ! [](/uploads/images/2020/0917/150744_df40e73d_5504908 .png " user-env.png ") ! [](/uploads/images/2020/0917/154506_0ed087ca_5504908 .png " dev-config.png ") ! [](/uploads/images/2020/0917/160010_6fafc86e_5504908 .png " ws-config.png ") ### Local Development Environment Building ### Workflow Long #### DataBase #### Service Center #### UserManagement #### atp #### atp-fe 1, Download [Service Center] (http://servicecomb.apache.org/cn/release/service-center-downloads/) 1. Download the atp-fe code 1, download the atp code 1, download the user-mgmt-be code and user-mgmt-fe code 1, Download, install, start Postgresql latest version 2, configuring the runtime environment variable for atpApp in the compiler (where IDEA is used as an example) 2, install node.js and npm, enter the user-mgmt-fe folder, run ` npm install ` and ` npm run build ` 2. Run the start-service-center.bat and start-frontend.bat after decompression 2, setting the login name and password, such as postgresql/root 2, enter the atp-fe folder, run ` npm install ` and ` npm run build ` 3, download the website-gateway code 3. Create a database called atpdb 3, create a static folder in the src/main/resources/ folder in user-mgmt-be 3, run atpApp function, start atp 4. Create a static folder in the src/main/resources/ folder on website-gateway 4. copy the contents in the dist folder compiled by user-mgmt-fe into the static folder of user-mgmt-be 4. Create table structure based on database statement in [atp deployment document] (https: //gitee.com/edgegallery/helm-charts/blob/master/atp/templates/atp/atp-configmap.yaml) 5. Create a database called usermgmtdb 5. Configure runtime environment variables for MainServer in the compiler (where IDEA is used as an example) 5. copy the contents in the dist folder compiled by the atp-fe to the static folder of website-gateway 6. Modify the ` server.port ` in the /src/main/resources/application.yaml document in the website-gateway ` ` 8080 ` 6. Create table structure based on database statement in [usermgmt deployment document] (https: //gitee.com/edgegallery/helm - chargs/blob/master/user-mgmt/templates/user-mgmt-configmap.yaml) 6, Run the MainServer function, start UserManagement 7. Configuring runtime environment variables for GatewayApp in the compiler (where IDEA is used as an example) 8. Run GatewayApp Launch WebiteGateway and atp-fe, browser access to http://127.0.0.1:8080/ to access the atp homepage ATP Contribution Local activation of the atp is dependent on: ` ` ` - Service Center-DataBase-UserManagement ` ` Local activation of atp-fe depends on: ` ` ` WebiteGateway-UserManagement-atp ` ` ` so in order to build a local development environment, the final start order is Service Center - > DataBase - > UserManagement - > atp - > WebiteGateway (atp-fe) This article will guide users on how to build the atp and atp-fe modules locally, helping developers to quickly understand, develop code. 