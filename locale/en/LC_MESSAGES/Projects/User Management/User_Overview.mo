��          �               |  :   }  C   �     �  +        A  �   Z  �   �     �  '   �  /     *   3  ^   ^  %   �  $   �  3        <     S  X   h  ;   �     �       �    :   �  N   �      '  7   H  '   �  �   �    a	     x
  0   �
  6   �
  8   �
  �   '  +   �  2   �  3        @     ]  l   p  E   �     #     0   ![](/uploads/images/2020/user-mgmt/user-mgmt-overview.PNG) Auth-server：提供JWT服务，用于API接口访问的token生成 Mail: 提供邮箱服务 Portal：提供登录/登出的界面操作 SMS：提供短信服务 User Management会给登录成功的用户签发AccessToken，用于后台API接口的访问，token默认超时时间1小时，token携带以下数据： User Management模块是为EdgeGallery项目提供用户管理的基本能力，包括用户注册/登录/权限认证等功能。为AppStore/开发者平台/MECM/ATP/Lab提供统一的用户鉴权和认证服务。 User Overview User-mgmt和其他模块之间的关系 User-mgmt是EdgeGallery的用户管理模块： User-mgmt模块主要包含四个模块： User-mgmt：提供用户帐号管理，包括获取/修改用户信息、密码找回等功能 enableMail：是否开启邮箱服务 enableSms：是否开启短信服务 ssoSessionId：全局SessionId，用户单点登录 userId: 登录用户ID userName：用户名 有关单点登录的详细实现过程，请参考章节《特性设计-单点登录》 用户首先通过User Management登录到EdgeGallery平台 简介 部署关系 Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-05-26 17:32+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
 ![](/uploads/images/2020/user-mgmt/user-mgmt-overview.PNG) Auth-server: Provide JWT service for token generation for API interface access Mail: Provides a mailbox service Portal: Provide an interface operation for login/logout SMS: Provision of Short Message Service User Management will issue AccessToken for the successful login of the user for the background API interface, the token default timeout is 1 hour, the token carries the following data: The User Management module provides the basic capabilities of user management for the EdgeGallery project, including user registration/login/authority authentication.Provide unified user authentication and certification services for the AppStore/Developer Platform/MECM/ATP/Lab. User Overview Relationship between User-mgmt and other modules User-mgmt is a user management module for EdgeGallery: The User-mgmt module consists primarily of four modules: User-mgmt: provides user account number management, including the ability to acquire/modify user information, password recovery, etc. enableMail: Whether to open mailbox service enableSms: Whether to open a short message service ssoSessionId: global SessionId, user single sign-on userId: Register the user ID userName: username For detailed implementation of single sign-on, please refer to the section < Feature Design-Single sign-on > Users first login to the EdgeGallery platform through User Management Introduction Deployment Relationship 