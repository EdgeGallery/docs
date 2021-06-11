Developer Overview
============


提供开源开发者统一入口，包括开发流程、开发工具、开放的API能力、集成测试验证，开发者交流论坛等,使开发者更加方便快捷的开发应用并集成到edgegallery平台。Developer分为前后台两个部分，developere-be是后台部分，提供主要功能接口供前台或其他三方系统调用，developer-fe是前台部分，提供界面展示。
*   [架构设计](#id-开发者平台（DeveloperPortal）-架构设计)
*   [部署视图](#id-开发者平台（DeveloperPortal）-部署视图)

架构设计
----

![](/uploads/images/2021/cor2020/150137_dd5a244e_5504908.png "架构设计.png")

1.  Developer-fe：开发者平台前台框架，使用VUE开发。
    
2.  Developer-be：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：[https://servicecomb.apache.org/cn/](https://servicecomb.apache.org/cn/)）
    
3.  Developer DB：后台依赖Postgres数据库。
    

部署视图
----

![](/uploads/images/2021/cor2020/150201_343f1fd8_5504908.png "部署视图.png")

以上部署视图是按照K8S部署设计的， 在实际部署过程中，可以直接在虚拟机或者docker容器中启动各自的服务，部署过程中需要有以下几点注意：

*   Developer-fe，Developer-be需要注册到ServiceCenter中，有关ServiceCenter的使用方法请参考：[https://servicecomb.apache.org/cn/](https://servicecomb.apache.org/cn/)
    
*   推荐使用Chrome浏览器


