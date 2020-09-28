EdgeGallery界面一览
-------------------
开发者平台：<br>
![开发者平台](https://images.gitee.com/uploads/images/2020/0927/153611_db1f101d_7625241.png "屏幕截图.png")<br>

应用商城：<br>
![应用商城](https://images.gitee.com/uploads/images/2020/0927/153633_8db14480_7625241.png "屏幕截图.png")<br>

MEC管理平台：<br>
![MEC管理平台](https://images.gitee.com/uploads/images/2020/0927/153647_d078c1c2_7625241.png "屏幕截图.png")<br>

APP开发流程
-------------------
![开发流程](https://images.gitee.com/uploads/images/2020/0927/155444_5586d113_7625241.png "屏幕截图.png")<br>

Demo
-------------------
基于EdgeGallery的定位服务开发，展示如何基于EdgeGallery开发者平台进行边缘应用开发<br>
* 定位服务应用作为服务消费者依赖EdgeGallery平台的“人脸识别服务”<br>
* 定位服务应用作为服务供应者发布“定位服务”，对外提供生态API，其他服务可以消费“定位服务”<br>

**登录EdgeGallery开发者平台**<br>
https://daily.developer.edgegallery.org/<br><br>
**开发准备**<br>
* 新建一个项目<br>
![新建项目](https://images.gitee.com/uploads/images/2020/0927/164937_44bad0e1_7625241.png "屏幕截图.png")
* 选择依赖的平台能力，勾选“人脸识别”<br>
![选择平台能力](https://images.gitee.com/uploads/images/2020/0927/165038_8a49d2c2_7625241.png "屏幕截图.png")
* 选择对应能力版本<br>
![能力详情](https://images.gitee.com/uploads/images/2020/0927/170533_cd17b611_7625241.png "屏幕截图.png")
* 创建完成后可以测试“人脸识别”服务API<br>
选择协议类型为“https”，在“upload”API中上传一个人脸图片，然后点击“Execute”，在结果中查看识别结果。<br>
![输入图片说明](https://images.gitee.com/uploads/images/2020/0927/172222_95378115_7625241.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2020/0927/172311_0bf298a0_7625241.png "屏幕截图.png")<br><br>
**开发**<br>
* 下载依赖的插件-pythonPlugin，并导入到IDE<br>
![插件](https://images.gitee.com/uploads/images/2020/0927/180131_b43bd374_7625241.png "屏幕截图.png")
* 执行插件，会自动生成示例代码<br>
![插件运行](https://images.gitee.com/uploads/images/2020/0928/103403_fc10b6a9_7625241.png "屏幕截图.png")
* 编写APP代码<br>
* 构建docker image<br><br>
**测试**<br>
* 回到EdgeGallery开发者平台上传image<br>
![上传image](https://images.gitee.com/uploads/images/2020/0928/104313_61e531ce_7625241.png "屏幕截图.png")
* 配置依赖参数<br>
![配置依赖参数](https://images.gitee.com/uploads/images/2020/0928/104414_78804337_7625241.png "屏幕截图.png")
* 选择部署节点<br>
![选择部署节点](https://images.gitee.com/uploads/images/2020/0928/104544_0e90c7e9_7625241.png "屏幕截图.png")
* 部署测试<br>
部署成功后可以使用对应的URL进行应用测试。<br>
![部署测试](https://images.gitee.com/uploads/images/2020/0928/104720_351d5a45_7625241.png "屏幕截图.png")<br><br>
**应用发布**<br>
点击“测试完成”按钮，选择是否发布应用到APPStore、是否发布应用API能力到EdgeGallery生态系统<br>
![应用发布](https://images.gitee.com/uploads/images/2020/0928/111041_c5004536_7625241.png "屏幕截图.png")


