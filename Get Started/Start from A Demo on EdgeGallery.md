# EdgeGallery界面一览
-------------------
开发者平台：<br>
![开发者平台](https://images.gitee.com/uploads/images/2020/0927/153611_db1f101d_7625241.png "屏幕截图.png")<br>

应用商城：<br>
![应用商城](https://images.gitee.com/uploads/images/2020/0927/153633_8db14480_7625241.png "屏幕截图.png")<br>

MEC管理平台：<br>
![MEC管理平台](https://images.gitee.com/uploads/images/2020/0927/153647_d078c1c2_7625241.png "屏幕截图.png")<br>

# APP开发流程
-------------------
![开发流程](https://images.gitee.com/uploads/images/2020/0927/155444_5586d113_7625241.png "屏幕截图.png")<br>

# Demo介绍
-------------------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

## 登录EdgeGallery开发者平台
https://daily.developer.edgegallery.org/<br><br>
## 开发准备
* 新建一个项目<br>
![新建项目](https://images.gitee.com/uploads/images/2020/0927/164937_44bad0e1_7625241.png "屏幕截图.png")
* 选择依赖的平台能力，勾选“人脸识别”<br>
![选择平台能力](https://images.gitee.com/uploads/images/2020/0927/165038_8a49d2c2_7625241.png "屏幕截图.png")
* 选择对应能力版本<br>
![能力详情](https://images.gitee.com/uploads/images/2020/0927/170533_cd17b611_7625241.png "屏幕截图.png")<br><br>
## 开发
* 下载依赖的插件-pythonPlugin，并导入到IDE<br>
![插件](https://images.gitee.com/uploads/images/2020/0927/180131_b43bd374_7625241.png "屏幕截图.png")
* 执行插件，会自动生成示例代码<br>
![插件运行](https://images.gitee.com/uploads/images/2020/0928/103403_fc10b6a9_7625241.png "屏幕截图.png")
* 编写APP代码<br>
* 构建docker image<br><br>
## 部署测试
* 回到EdgeGallery开发者平台上传image<br>
![上传image](https://images.gitee.com/uploads/images/2020/0928/104313_61e531ce_7625241.png "屏幕截图.png")
* 配置依赖参数<br>
![配置依赖参数](https://images.gitee.com/uploads/images/2020/0928/104414_78804337_7625241.png "屏幕截图.png")
* 选择部署节点<br>
![选择部署节点](https://images.gitee.com/uploads/images/2020/0928/155738_1363e060_7625241.png "屏幕截图.png")<br>
部署成功后可以使用对应的URL进行应用测试。<br>
![部署测试](https://images.gitee.com/uploads/images/2020/0928/104720_351d5a45_7625241.png "屏幕截图.png")<br><br>
## 应用发布
点击“测试完成”按钮，选择是否发布应用到APPStore、是否发布应用API能力到EdgeGallery生态系统<br>
![应用发布](https://images.gitee.com/uploads/images/2020/0928/111041_c5004536_7625241.png "屏幕截图.png")<br>
访问APPStore：https://daily.appstore.edgegallery.org/，可以找到发布的应用。<br>
![应用商城](https://images.gitee.com/uploads/images/2020/0928/111833_bb36fd2b_7625241.png "屏幕截图.png")<br><br>
## 应用部署管理
访问MECM：https://daily.mecm.edgegallery.org/<br>
![MECM](https://images.gitee.com/uploads/images/2020/0928/112141_2f32426e_7625241.png "屏幕截图.png")<br>
* 分发应用到边缘节点<br>
![应用分发](https://images.gitee.com/uploads/images/2020/0928/112324_3a0ec58b_7625241.png "屏幕截图.png")
* 应用部署<br>
![应用部署1](https://images.gitee.com/uploads/images/2020/0928/112428_c52a06de_7625241.png "屏幕截图.png")<br>
![应用部署2](https://images.gitee.com/uploads/images/2020/0928/112518_2fa4ad3a_7625241.png "屏幕截图.png")<br><br><br>

详细信息可参考：
[视频](https://gitee.com/edgegallery/community/blob/master/TSC/Release/v0.9/EdgeGallery%20Demo%20Recording.mp4)


