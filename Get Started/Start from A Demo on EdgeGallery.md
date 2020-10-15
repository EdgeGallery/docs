# EdgeGallery界面一览
-------------------
开发者平台：<br>
![](/uploads/images/2020/0927/developer_home_page.png "开发者平台.png")<br>

应用商城：<br>
![](/uploads/images/2020/0927/appstore_home_page.png "应用商城.png")<br>

MEC管理平台：<br>
![](/uploads/images/2020/0927/mecm_home_page.png "MECM管理平台.png")<br>

# APP开发流程
-------------------
![](/uploads/images/2020/0927/development_flow.png "开发流程图.png")<br>

# Demo介绍
-------------------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

## 登录EdgeGallery开发者平台
https://daily.developer.edgegallery.org/<br><br>
## 开发准备
* 新建一个项目<br>
![](/uploads/images/2020/0927/create_project.png "新建项目.png")
* 选择依赖的平台能力，勾选“人脸识别”<br>
![](/uploads/images/2020/0927/create_project_select_service.png "选择依赖的平台能力.png")
* 选择对应能力版本<br>
![](/uploads/images/2020/0927/create_project_select_service_version.png "选择平台能力版本.png")<br><br>
## 开发
* 下载依赖的插件-pythonPlugin，并导入到IDE<br>
![](/uploads/images/2020/0927/download_plugin.png "下载插件.png")
* 执行插件，会自动生成示例代码<br>
![](/uploads/images/2020/0927/execute_plugin.png "执行插件生成示例代码.png")
* 编写APP代码<br>
* 构建docker image<br><br>
## 部署测试
* 回到EdgeGallery开发者平台上传image<br>
![](/uploads/images/2020/0927/104313_61e531ce_7625241.png "屏幕截图.png")
* 配置依赖参数<br>
![](/uploads/images/2020/0927/104414_78804337_7625241.png "屏幕截图.png")
* 选择部署节点<br>
![](/uploads/images/2020/0927/155738_1363e060_7625241.png "屏幕截图.png")<br>
部署成功后可以使用对应的URL进行应用测试。<br>
![](/uploads/images/2020/0927/104720_351d5a45_7625241.png "屏幕截图.png")<br><br>
## 应用发布
点击“测试完成”按钮，选择是否发布应用到APPStore、是否发布应用API能力到EdgeGallery生态系统<br>
![](/uploads/images/2020/0927/111041_c5004536_7625241.png "屏幕截图.png")<br>
访问APPStore：https://daily.appstore.edgegallery.org/，可以找到发布的应用。<br>
![](/uploads/images/2020/0927/111833_bb36fd2b_7625241.png "屏幕截图.png")<br><br>
## 应用部署管理
访问MECM：https://daily.mecm.edgegallery.org/<br>
![](/uploads/images/2020/0927/112141_2f32426e_7625241.png "屏幕截图.png")<br>
* 分发应用到边缘节点<br>
![](/uploads/images/2020/0927/161230_821e2b70_7625241.png "屏幕截图.png")
* 应用部署<br>
![](/uploads/images/2020/0927/161426_0814bb76_7625241.png "屏幕截图.png")<br>
![](/uploads/images/2020/0927/161505_1d05c04b_7625241.png "屏幕截图.png")<br><br><br>

详细信息可参考：
[视频](https://gitee.com/edgegallery/community/blob/master/TSC/Release/v0.9/EdgeGallery%20Demo%20Recording.mp4)


