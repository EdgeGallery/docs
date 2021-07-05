## 数据库设计

### tbl\_tenant 租户表

记录所有的租户信息
| **字段** | **类型** | **主键** | **描述** |
| --- | --- | --- | --- |
|tenantid | string | key | 主键 |
|username | string | -| 注册时的用户名，需要唯一性。[5-29]个字符之间  |
|password | string |- | 注册时设置的密码，注册时需要满足密码复杂度要求，满足数字/字母/特殊字符 至少两种以上的组合，[6-18]个字符之间。数据库中的密码使用PBKDF2加盐值后存储 |
|company | string |- | 用户公司名称 |
|telephonenumber | string | -| 用户手机号码，用于找回密码时短信验证用户身份，必须满足11位有效数字|
|mailaddress | string | -| 用户邮箱地址，用于找回密码时邮箱验证用户身份，必须为有效的邮箱格式|
|gender| string |- | 用户性别|
|isallowed| boolean |- | 帐号是否允许登录|
|createtime| timestamp|- | 创建时间（即注册时间）|
|modifytime| timestamp|- | 修改时间|
|pweffecttime| timestamp|- | 密码生效时间|

初始值：
```
               tenantid               |    username    |                                     password                                     | company | telephonenumber | mailaddress | gender | isallowed | createtime | modifytime | pweffecttime
--------------------------------------+----------------+----------------------------------------------------------------------------------+---------+-----------------+--------+-----------
 de3565b1-a7c2-42b9-b281-3f032af29ff7 | guest          | 59756fda85ebddee6024d5cc0e6edcde3226693257a9c1eb662c56426b8a4f232b3d56c321adbd91 | company | 13800000000     | 13800000000@edgegallery.org | 1      | t | 初始数据入库时间(now函数值) | 初始数据入库时间(now函数值) | NULL
 39937079-99fe-4cd8-881f-04ca8c4fe09d | admin          | 472645ad1af0101adaa6769cc865fec3b29fedeba6dc912900a59b1364b7a6bb17bb9a0575854547 | company | 13800000001     | 13800000001@edgegallery.org | 1      | t | 初始数据入库时间(now函数值) | 初始数据入库时间(now函数值) | 初始数据入库时间(now函数值)往前推10年的时间

The default password for the guest account is：guest
The default password for the admin account is：Admin@321
对于admin用户，首次登录后会强制修改默认密码。
对于非guest用户，密码超过90天后过期，登录时会强制修改密码。
```

### tbl\_role 用户角色表

配置支持的平台的和用户角色，该表在启动时初始化，不支持动态添加
| 字段 | 类型 |主键 | 描述 |
|---|---|---|---|
|id | string | key | 主键 |
|platform | string |- | 支持的平台  |
|role | string |- | 支持的角色定义 |

初始值：
```sql
 id | platform  |  role
----+-----------+--------
  1 | APPSTORE  | GUEST
  2 | APPSTORE  | TENANT
  3 | APPSTORE  | ADMIN
  4 | DEVELOPER | GUEST
  5 | DEVELOPER | TENANT
  6 | DEVELOPER | ADMIN
  7 | MECM      | GUEST
  8 | MECM      | TENANT
  9 | MECM      | ADMIN
  10 | ATP      | GUEST
  11 | ATP      | TENANT
  12 | ATP      | ADMIN
  13 | LAB      | GUEST
  14 | LAB      | TENANT
  15 | LAB      | ADMIN
```
说明：
  - APPSTORE：应用仓库平台
  - DEVELOPER：应用开发集成平台
  - MECM：MEC管理平台
  - ATP：应用认证测试平台
  - LAB：实验室管理平台


### tbl\_tenant\_role 关系表

用于描述租户和角色的关系
| 字段 | 类型 |主键 | 描述 |
|---|---|---|---|
|tenantid | string | | 租户ID |
|roleid | string | | 角色ID  |

初始值：
```
               tenantid               | roleid 
--------------------------------------+--------
 de3565b1-a7c2-42b9-b281-3f032af29ff7 |      1
 de3565b1-a7c2-42b9-b281-3f032af29ff7 |      4
 de3565b1-a7c2-42b9-b281-3f032af29ff7 |      7
 de3565b1-a7c2-42b9-b281-3f032af29ff7 |     10
 de3565b1-a7c2-42b9-b281-3f032af29ff7 |     13
 39937079-99fe-4cd8-881f-04ca8c4fe09d |      3
 39937079-99fe-4cd8-881f-04ca8c4fe09d |      6
 39937079-99fe-4cd8-881f-04ca8c4fe09d |      9
 39937079-99fe-4cd8-881f-04ca8c4fe09d |     12
 39937079-99fe-4cd8-881f-04ca8c4fe09d |     15

Contrast with the initialization data of tbl_tenant,
de3565b1-a7c2-42b9-b281-3f032af29ff7It is a guest user and has the GUEST role of each platform by default;
39937079-99fe-4cd8-881f-04ca8c4fe09dIt is an admin user and has the ADMIN role of each platform by default;
```
