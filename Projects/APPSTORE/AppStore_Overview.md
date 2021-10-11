概述
=================

AppStore是开发者发布和上线App应用的边缘应用市场，由Developer平台开发的边缘应用，经过ATP测试后可以直接发布到AppStore应用商店。
用户也可以在AppStore直接上传边缘应用，经过ATP测试后可以发布到AppStore，对外展示。

AppStore分为前后台两个部分，[AppStore BE][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[AppStore FE][2]是前台部分，提供界面展示。


## 代码架构

![](/uploads/images/2021/1009/appstore/app_structure.png)

1. AppStore FE：开发者平台前台框架，使用VUE开发。

2. AppStore BE：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/）

3. AppStore DB：后台依赖Postgres数据库。

[1]: https://gitee.com/edgegallery/appstore-be "AppStore BE"
[2]: https://gitee.com/edgegallery/appstore-fe "AppStore FE"

