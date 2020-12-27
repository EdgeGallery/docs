## 数据库设计

### tbl\_tenant 租户表

记录所有的租户信息

| **字段** | **类型** | **主键** | **描述** |
| --- | --- | --- | --- |
|tenantid | string | key | 主键 |
|username | string | -| 注册时的用户名，需要唯一性。[5-29]个字符之间  |
|password | string |- | 注册时设置的密码，注册时需要满足密码复杂度要求，满足数字/字母/特殊字符 至少两种以上的组合，[6-18]个字符之间。数据库中的密码使用PBKDF2加盐值后存储 |
|company | string |- | 用户公司名称 |
|telephonenumber | string | -| 用户手机号码，用于重置密码时短信验证用户身份，必须满足11位有效数字|
|gender| string |- | 用户性别|
|isallowed| boolean |- | 账号是否有效（预留字段，暂未使用）|

初始值：
```
               tenantid               |    username    |                                     password                                     | company | telephonenumber | gender | isallowed 
--------------------------------------+----------------+----------------------------------------------------------------------------------+---------+-----------------+--------+-----------
 de3565b1-a7c2-42b9-b281-3f032af29ff7 | guest          | 59756fda85ebddee6024d5cc0e6edcde3226693257a9c1eb662c56426b8a4f232b3d56c321adbd91 | company | 13800000000     | 1      | t
 39937079-99fe-4cd8-881f-04ca8c4fe09d | admin          | 472645ad1af0101adaa6769cc865fec3b29fedeba6dc912900a59b1364b7a6bb17bb9a0575854547 | company | 13800000001     | 1      | t

guest账号的默认密码是：guest
admin账号的默认密码是：admin
请部署前修改默认密码
```

### tbl\_tole 用户角色表

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

对照tbl_tenant的初始化数据，de3565b1-a7c2-42b9-b281-3f032af29ff7是guest用户，默认拥有各平台的GUEST角色；
39937079-99fe-4cd8-881f-04ca8c4fe09d是admin用户，默认用户各平台的ADMIN角色；
```