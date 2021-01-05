User Overview
=============

## 简介

User Management模块是为EdgeGallery项目提供用户管理的基本能力，包括用户注册/登录/权限认证等功能。为AppStore/开发者平台/MECM提供统一的用户鉴权和认证服务。

## 部署关系

![](/uploads/images/2020/user-mgmt/user-mgmt-overview.PNG)

User-mgmt模块主要包含四个模块：
- Portal：提供登录/登出的界面操作
- Auth-server：提供JWT服务，用于API接口访问的token生成
- User-mgmt：提供用户账号管理，例如获取/更改用户信息，密码找回等服务；
- SMS：提供短信验证服务。



## User-mgmt和其他模块之间的关系

User-mgmt是EdgeGallery的用户管理模块：
- 用户首先通过User Management登录到EdgeGallery平台
- User Management会给登录成功的用户签发AccessToken，用于后台API接口的访问，token默认超时时间1小时，token携带以下数据：
    - userId: 登录用户ID
    - enableSms：是否开启短信服务
    - ssoSessionId：全局SessionId，用户单点登录
    - userName：用户名

有关单点登录的详细实现过程，请参考章节《特性设计-单点登录》





