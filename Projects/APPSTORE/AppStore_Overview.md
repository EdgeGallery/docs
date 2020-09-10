*   [APP STORE](#APP STORE)
    *   [架构说明](#架构说明)
    *   [部署视图](#部署视图)
    *   [特性描述](#特性描述)
        *   [应用上传](#应用上传) 
        *   [应用下载](#应用下载) 

AppStore是开发者发布和上线App应用的市场，由Developer平台开发的边缘应用，经过测试可以直接分享到AppStore应用商店。AppStore分为前后台两个部分，[appstore-be][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[appstore-fe][2]是前台部分，提供界面展示。


## 架构说明
![](https://images.gitee.com/uploads/images/2020/0709/154041_a4c3a9ba_5504908.png)

1. appstore-fe：开发者平台前台框架，使用VUE开发。

2. appstore-be：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/）

3. appstore DB：后台依赖Postgres数据库。appstore-fe：开发者平台前台框架，使用VUE开发。

## 部署视图
![](https://images.gitee.com/uploads/images/2020/0709/154053_b41b4a97_5504908.png)
以上部署视图是按照K8S部署设计的， 在实际部署过程中，可以直接在虚拟机或者docker容器中启动各自的服务，部署过程中需要有一下几点注意：

- appstore-fe，appstore-be，DB Service都需要注册到ServiceCenter中，有关ServiceCenter的使用方法请参考：https://servicecomb.apache.org/cn/
- 推荐使用Chrome浏览器
## 特性描述

### 应用上传
App上传，为应用开发者提供展示平台，将开发者所开发的边缘应用通过AppStore对外展示，提升影响力。

### 应用下载
App下载，主要为MECM系统提供应用列表，并通过边缘节点完成应用的生命周期管理。


[1]: https://gitee.com/edgegallery/appstore-be "appstore-be"
[2]: https://gitee.com/edgegallery/appstore-fe "appstore-fe"