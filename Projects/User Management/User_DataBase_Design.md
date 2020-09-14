# 数据库设计

## tbl\_tenant 租户表
记录所有的租户信息
| 字段 | 类型 | 主键 | 描述 |
|---|---|---|---|
|tenantid | string | key | 主键 |
|username | string | -| 注册时的用户名，需要唯一性。[5-29]个字符之间  |
|password | string |- | 注册时设置的密码，注册时需要满足密码复杂度要求，满足数字/字母/特殊字符 至少两种以上的组合，[6-18]个字符之间。数据库中的密码使用PBKDF2加盐值后存储 |
|company | string |- | 用户公司名称 |
|telephonenumber | string | -| 用户手机号码，用于重置密码时短信验证用户身份，必须满足11位有效数字|
|gender| string |- | 用户性别|

## tbl\_tole 用户角色表
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
```

## tbl\_tenant\_role 关系表
用于描述租户和角色的关系
| 字段 | 类型 |主键 | 描述 |
|---|---|---|---|
|tenantid | string | | 租户ID |
|roleid | string | | 角色ID  |
