概述
=================

应用测试服务对于应用包，提供了检测的功能，只有通过了应用测试服务的测试用例，才能将应用包发布到应用商城中。
目前应用测试服务主要包含三大类测试用例：病毒扫描、遵从性测试和沙箱测试。
应用测试服务分为前后台两个部分，[atp][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[atp-fe][2]是前台部分，提供界面展示。


## 架构说明

1. atp-fe：开发者平台前台框架，使用VUE开发。

2. atp：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/）

3. atp DB：后台依赖Postgres数据库。

## 部署视图
![](/uploads/images/2020/0709/154053_b41b4a97_5504908.png)

以上部署视图是按照K8S部署设计的， 在实际部署过程中，可以直接在虚拟机或者docker容器中启动各自的服务，部署过程中需要有一下几点注意：

- appstore-fe和appstore-be都需要注册到ServiceCenter中
- 推荐使用Chrome浏览器


[1]: https://gitee.com/edgegallery/atp "atp"
[2]: https://gitee.com/edgegallery/atp-fe "atp-fe"