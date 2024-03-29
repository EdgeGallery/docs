## 特性设计

- [用户注册](#用户注册)
- [单点登录](#单点登录)
- [用户中心](#用户中心)
- [密码找回](#密码找回)
- [访客登录](#访客登录)
- [用户列表管理](#用户列表管理)
- [邮箱验证](#邮箱验证)

**Feature Info**
| **特性名称** | **特性描述** | **设计约束** |
| --- | --- | --- |
| [用户注册](#用户注册) | 提供用户注册功能。注册时除提供必须的用户名外，还可以选择提供邮箱地址。建议填写邮箱地址，便于忘记密码后找回密码时进行验证。 | 注册时提供的用户名、邮箱地址必须是唯一的，如果已存在，则无法成功注册。为了方便用户注册，当前不对邮箱地址进行验证。|
| [单点登录](#单点登录) | 可以通过用户名、邮箱地址登录各应用平台Portal。EdgeGallery采取单点登录方式（Single Sign On），即多个应用平台共用一个登录认证平台，一次登录就可以访问互相信任的其他应用系统。 | 目前单点登录系统适用于开发者平台（Developer Portal）、应用仓库（Application Store）、管理系统（MEC Manager）、应用测试认证平台（ATP Portal）。 |
| [用户中心](#用户中心) | 用户登录到各应用平台后，可以通过“我的帐号”进入用户中心。在用户中心可以查看/修改个人信息、修改密码。 | 目前不支持修改用户名，只能修改邮箱地址。 |
| [密码找回](#密码找回) | 如果用户注册时提供了真实有效的邮箱地址（或者在用户中心修改个人信息时提供），当忘记密码时可以通过邮箱地址重置密码以完成密码找回。通过邮箱地址找回密码时需要进行邮箱验证，验证通过后才可以重置密码。 | 只有当EdgeGallery平台开启了邮箱服务才可以通过邮箱地址找回密码 |
| [访客登录](#访客登录) | 访客是系统内置的一个GUEST账号，访问首页时自动登录。在访客登录时，用户可以查看系统的大部分功能，但是不能在系统中进行创建/删除/修改登录操作。 | 访客的默认用户名和密码是guest/guest，部署时如需修改密码请通过登录数据库修改，如果想停用GUEST账号，请从数据库中直接删除。 |
| [用户列表管理](#用户列表管理) | 用户管理模块默认内置admin用户，该用户作为系统的超级管理员。为该用户提供一个统一的用户列表管理功能，可以查询用户、启用/停用用户、设置用户角色权限。 | 当停用用户后，用户将无法登录；无法设置已停用用户的角色权限。 |
| [邮箱验证](#邮箱验证) | 系统提供向已注册邮箱地址发送验证码的服务，用来对邮箱进行验证。| 只有当EdgeGallery平台开启了邮箱服务才可以向邮箱发送验证码 |

### 用户注册

用户注册时，除提供必须的用户名外，还可以选择提供邮箱地址。建议填写邮箱地址，便于忘记密码后找回密码时进行验证。

注册时系统会进行以下校验：
1. 用户名必须大于6位，同时会校验用户名是否已经被注册。
2. 如果提供了邮箱地址，校验其是否符合格式要求的邮箱地址，同时会校验邮箱地址是否已经被注册。
3. 图形数字验证码
    
![用户注册处理时序图](/uploads/images/2021/usermgmt/Sequence_Register.png "Sequence_Register.png")

### 单点登录

单点登录系统是基于ServiceComb、Spring Security、Oauth2、JWT、Vue等技术实现，采用OAuth2协议的授权码模式（authorization code）。MECM、AppStore、Developer、Atp应用平台作为客户端，与认证服务器user-mgmt-be进行交互，实现单点登陆与单点注销功能。使用Cookie+Session机制实现用户认证鉴权和超时退出功能，使用JWT存储用户基本信息，减轻认证服务器压力。

这里以MECM和AppStore两个应用平台作为客户端为例来说明单点登录和单点注销的处理时序。

![单点登录时序图](/uploads/images/2021/usermgmt/Sequence_SingleSignOn.png "Sequence_SingleSignOn.png")

![单点注销时序图](/uploads/images/2021/usermgmt/Sequence_SingleSignOut.png "Sequence_SingleSignOut.png")

### 用户中心

用户登录到各应用平台后，可以通过“我的帐号”进入用户中心。

在用户中心，用户可以查看/修改个人信息、修改密码。

目前不支持修改用户名，只能修改邮箱地址。


### 密码找回

#### 通过邮箱地址找回密码

用户忘记密码后通过邮箱地址找回密码的主要交互处理：

1.  用户输入邮箱地址，完成图形数字验证，然后请求获取验证码。系统判断邮箱地址是否已注册，如果已注册，则发送验证码到邮箱。如果没有注册，提示用户邮箱地址不存在。
2.  用户输入收到的验证码和新密码，修改成功后，返回登录界面。

![根据邮箱地址找回密码处理时序图](/uploads/images/2021/usermgmt/Sequence_RetrievePwByMail.png "Sequence_RetrievePwByMail.png")

### 访客登录

访客是系统内置的一个GUEST账号，访问首页时自动登录。

在访客登录时，用户可以查看系统的大部分功能，但是不能在系统中进行创建/删除/修改登录操作。 

访客的默认用户名和密码是guest/guest，部署时如需修改密码请通过登录数据库修改，如果想停用GUEST账号，请从数据库中直接删除。

### 用户列表管理

用户管理模块默认内置admin用户，该用户作为系统的超级管理员。

系统为该用户提供一个统一的用户列表管理功能，可以查询用户、启用/停用用户、设置用户角色权限。

```
(1) When the user is disabled, the user will not be able to log in.
(2) The role permissions of disabled users cannot be set.
```

### 邮箱验证

对邮箱地址进行验证时需要发送验证码到邮箱，需要开启邮箱服务。

开启邮箱服务需要修改user-mgmt下的配置文件application.properties：

[mail.enabled=true]   //邮箱服务开关，默认false

[spring.mail.host=]  //邮箱服务器

[spring.mail.port=]  //邮箱服务器发送邮件的端口

[spring.mail.username=]  //邮件发件人

[spring.mail.password=]  //发件人授权码


### 界面设计

- [用户注册界面](#用户注册界面)
- [用户登录界面](#用户登录界面)
- [忘记密码后找回密码界面](#忘记密码后找回密码界面)
- [用户中心界面](#用户中心界面)
- [用户列表管理界面](#用户列表管理界面)

#### 用户注册界面

![](/uploads/images/2021/usermgmt/UI_Register.png "UI_Register.png")

#### 用户登录界面

![](/uploads/images/2021/usermgmt/UI_Login.png "UI_Login.png")

#### 忘记密码后找回密码界面

![](/uploads/images/2021/usermgmt/UI_RetrievePwByMail-1.png "UI_RetrievePwByMail-1.png")

![](/uploads/images/2021/usermgmt/UI_RetrievePwByMail-2.png "UI_RetrievePwByMail-2.png")


#### 用户中心界面

（1）主界面

![](/uploads/images/2021/usermgmt/UI_AccountCenter.png "UI_AccountCenter.png")

（2）修改密码

![](/uploads/images/2021/usermgmt/UI_AccountCenter_ModifyPw.png "UI_AccountCenter_ModifyPw.png")

#### 用户列表管理界面

（1）主界面

![](/uploads/images/2021/usermgmt/UI_UserList.png "UI_UserList.png")

（2）设置用户角色

![](/uploads/images/2021/usermgmt/UI_UserList_Setting.png "UI_UserList_Setting.png")

