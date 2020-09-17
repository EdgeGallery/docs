AppStore Overview
=================

AppStore是开发者发布和上线App应用的市场，由Developer平台开发的边缘应用，经过测试可以直接分享到AppStore应用商店。AppStore分为前后台两个部分，[appstore-be][1]是后台部分，提供主要功能接口供前台或其他三方系统调用，[appstore-fe][2]是前台部分，提供界面展示。


## 架构说明
![](/uploads/images/2020/0709/154041_a4c3a9ba_5504908.png)

1. appstore-fe：开发者平台前台框架，使用VUE开发。

2. appstore-be：开发者平台后台框架，使用SpringBoot+ServiceComb开发。（有关ServiceComb请参考这里：https://servicecomb.apache.org/cn/）

3. appstore DB：后台依赖Postgres数据库。

## 部署视图
![](/uploads/images/2020/0709/154053_b41b4a97_5504908.png)

以上部署视图是按照K8S部署设计的， 在实际部署过程中，可以直接在虚拟机或者docker容器中启动各自的服务，部署过程中需要有一下几点注意：

- appstore-fe和appstore-be都需要注册到ServiceCenter中
- 推荐使用Chrome浏览器

## 特性描述
详细特性描述请参考[《AppStore_Features》](/Projects/APPSTORE/AppStore_Features.md)

## 接口文档
详细的接口文档请参考[《AppStore_Interfaces》](/Projects/APPSTORE/Appstore_Interfaces.md)

## 操作指导
EdgeGallery为用户提供了可用的AppStore环境，操作指导请参考[《AppStore_Guide》](/Projects/APPSTORE/AppStore_Guide.md)

## 搭建本地开发环境
AppStore提供了指导文档，帮助用户搭建本地开发环境，方便用户进行本地调试。详情请参考[《AppStore_Setting Up Local Development Environment.md》](/Projects/APPSTORE/AppStore_Setting%20Up%20Local%20Development%20Environment.md)

## 其他
AppStore还提供了其他文档以供参考：
- 数据库设计文档[《AppStore_DataBase_Design》](/Projects/APPSTORE/AppStore_DataBase_Design.md)
- 三方件依赖清单[《AppStore_Dependency》](/Projects/APPSTORE/AppStore_Dependency.md)

[1]: https://gitee.com/edgegallery/appstore-be "appstore-be"
[2]: https://gitee.com/edgegallery/appstore-fe "appstore-fe"