**PostgreSQL**是开源的对象-关系数据库服务器(ORDBMS)，在灵活的BSD许可证下发行。进一步了解PostgreSQL可以点击[这里](https://www.runoob.com/postgresql/postgresql-tutorial.html)。

| **数据库表** | **字段** | **功能** |
| --- | --- | --- |
| tbl\_plugin | pluginid,pluginname,introduction,satisfaction,  <br>codelanguage,plugintype,version,downloadcount,  <br>logofile,pluginfileuserid,uploadtime,username,  <br>pluginsize,apifile,scorecount | 存储开发者上传的插件信息，包括插件名称，类型，存储路径，大小，下载次数等。 |
| tbl\_downloadrecord | recordid,pluginid,downloaduserid,downloadusername,  <br>score,scoretype,downloadtime | 存储插件的下载记录。 |
| tbl\_testapp | appid,appname,appfile,affinity,  <br>appdesc,uploadtime,userid,logofile,  <br>appversion,type | 存储开发者上传的APP信息，包括APP的名称，类型，版本等信息。 |
| tbl\_appfuntion | functionid,funcname,funcdesc,addtime | 存储APP的类型信息，此表默认由管理员执行初始化，无需开发者平台接口去初始化。 |
| tbl\_testtask | taskid,taskno,status,begintime,  <br>endtime,appid | 存储APP测试的任务信息。 |
| tbl\_subtaskstatus | executionid,taskid,testcaseid,  <br>status,parameters | 存储APP测试子任务信息，包括所有子任务的完成状态等。 |
| tbl\_app\_project | id,name,provider,platform,type,  <br>description,status,user\_id,create\_date,  <br>last\_test\_id,version,capabilities,  <br>project\_type,icon\_file\_id,open\_capability\_id | 存储开发者创建的APP项目信息，包括APP的名称，提供者，平台，架构，版本，服务能力等信息。 |
| tbl\_openmep\_capability | group\_id,name,type,description | 存储创建APP项目时，开发者平台提供的能力以及生态提供的能力信息。 |
| tbl\_openmep\_capability\_detail | detail\_id,service,version,description,  <br>provider,group\_id,api\_file\_id | 存储创建APP项目时，开发者平台提供的能力或者生态提供的能力对应的服务信息。 |
| tbl\_project\_test\_config | test\_id,project\_id,agent\_config,  <br>image\_file\_id,app\_api\_file\_id,status,  <br>access\_url,error\_log,deploy\_date,  <br>hosts,app\_instance\_id,work\_load\_id | 存储部署APP项目时的测试配置信息，包括部署的节点信息，APP项目的文件路径等。 |
| tbl\_project\_test\_record | id,config,image\_url,status,  <br>access\_url,error\_log,project\_id,  <br>hosts | 存储部署APP项目时的测试配置信息的记录。 |
| tbl\_project\_image | id,name,version,project\_id,  <br>type,port,node\_port | 存储部署APP项目时上传的APP镜像信息。 |
| tbl\_service\_host | host\_id,name,address,architecture,  <br>status,ip,os,port\_range\_min,  <br>port\_range\_max,port,delete | 存储部署APP项目时可以选择的服务器节点信息。 |
| tbl\_uploaded\_file | file\_id,file\_nameis\_temp,  <br>user\_id,upload\_date,file\_path | 存储APP项目的API文件信息。 |
| tbl\_api\_emulator | id,user\_id,host\_id,port,  <br>workload\_id,create\_time | 存储更改APP项目的API文件中的服务器信息。 |