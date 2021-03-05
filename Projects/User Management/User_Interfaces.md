User Interfaces
=============
- [User Interfaces](#appstore-interfaces)
- [User-mgmt-Server](#appStore-server)
  - [1. AUTH](#1-AUTH)
    - [1.1 登录](#11-登录)
    - [1.2 获取当前登录用户信息](#12-获取当前登录用户信息)
    - [1.3 登出](#13-登出)
  - [2. USER-MGMT](#2-USER-MGMT)
    - [2.1 注册用户](#21-注册用户)
    - [2.2 修改密码（个人修改密码 & 找回密码）](#22-修改密码)
    - [2.3 校验重复用户](#23-校验重复用户)
    - [2.4 查询用户列表](#24-查询用户列表)
    - [2.5 删除用户](#25-删除用户)
    - [2.6 修改用户个人信息](#26-修改用户个人信息)
    - [2.7 停用用户](#27-停用用户)
    - [2.8 启用用户](#28-启用用户)
    - [2.9 设置用户角色](#29-设置用户角色)
  - [3. IDENTITY](#3-IDENTITY)
    - [3.1 获取短信验证码](#31-获取短信验证码)
    - [3.2 获取邮件验证码](#32-获取邮件验证码)

## 1. AUTH

### 1.1 登录

登录系统

```
Resource URI: /login
Method: POST
```

| Name    | Definition |type   | Required| Describe |
| ------- | ---------- |-------|---------| ---------|
| username | 用户名/邮箱/手机号 |body|是| |
| password | 密码 |body|是| |

Example response:
```
response 200 OK
```

### 1.2 获取当前登录用户信息

用户登录成功后，通过此接口获取当前登录用户的信息。

```
Resource URI: auth/login-info
Method: GET
```

Example response:
```
response 200 OK
{
  "username": "TestUser1",
  "mailAddress": "test@edgegallery.org",
  "telephone": "13812345678",
  "createTime":"2021-02-24 04:39:23.640688",
  "allowed": true,
  "userId": "37423702-051a-46b4-bf2b-f190759cc0b8",
  "permissions": [
    {
      "platform": "APPSTORE",
      "role": "GUEST"
    }
  ]
}
```

### 1.3 登出

登出系统

```
Resource URI: /auth/logout
Method: GET
```

Example response:
```
200 OK
Succeed
```


## 2 USER-MGMT

### 2.1 注册用户

注册用户接口，注册成功返回200，并返回已经注册成功的用户信息；接口数据不全返回400。

```
Resource URI: /v1/users
Method: POST
```

| Name     | Definition |type   | Required| Describe |
| -------- | -----------|-------|---------| ---------|
| username | 用户名 |body|是| 必须是字母或者字母和数字的组合，必须以字母开头，长度在6~30个字符之间 |
| password | 密码 |body|是| 必须满足复杂度要求，必须是数字/字母/特数字符的组合，长度在6~18个字符之间 |
| mailAddress | 邮箱地址 |body|否| 如果填写，必须符合邮箱地址的格式要求 |
| telephone | 手机号码 |body|否 | 如果填写，必须为11位有效数字，且以1开头 |

Example request:
```json
{
  "username": "TestUser1",
  "mailAddress": "test@edgegallery.org",
  "telephone": "13812345678",
  "password": "123.qwe"
}
```

Example response:
```json
response 201 OK
{
  "username": "TestUser1",
  "mailAddress": "test@edgegallery.org",
  "telephone": "13812345678",
  "userId": "37423702-051a-46b4-bf2b-f190759cc0b8",
  "permissions": [
    {
      "platform": "APPSTORE",
      "role": "GUEST"
    }
  ]
}

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 500 INTERNAL ERROR
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.2 修改密码（个人修改密码 & 找回密码）

1. 用户在个人中心通过原密码验证方式修改个人密码。
2. 如果用户注册时提供了真实的邮箱地址或手机号（也可以在个人中心填写这两项信息），可以通过邮箱或手机验证码的方式重置密码。需要开启邮件服务或短信服务才能使用。

```
Resource URI: /v1/users/password
Method: PUT
```

| Name          | Definition |type   | Required| Describe |
| ------------- | ---------- |-------|---------| -------- |
| type | 修改密码的类型 |body|是| 1--原密码验证修改; 2--密码找回 |
| newPassword | 修改后的新密码 |body|是| 必须满足复杂度要求，必须是数字/字母/特数字符的组合，长度在6~18个字符之间  |
| userId | 用户ID |body|否| 当type=1时必填 |
| oldPassword | 原密码 |body|否| 当type=1时必填 |
| telephone | 手机号码 |body|否| 当type=2时，且需要通过手机号找回时，填写已经注册过的手机号码。与mailAddress有效性互斥 |
| mailAddress | 邮箱地址 |body|否| 当type=2时，且需要通过邮箱找回时，填写已经注册过的邮箱地址。与telephone有效性互斥 |
| verificationCode | 验证码 |body|否| 6位有效数字。当type=2时必填 |

Example request:
```json
{
  "type": 2,
  "newPassword": "123.qwe",
  "userId": "",
  "oldPassword": "",
  "telephone": "",
  "mailAddress": "test@edgegallery.org",
  "verificationCode": "123456"
}
```

Example response:
```json
response 200 OK

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 500 INTERNAL ERROR
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.3 校验重复用户

判断用户名或手机号是否已经注册过，不允许重复注册。

```
Resource URI: /v1/users/action/uniqueness
Method: POST
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| username | 用户名 |body|是|  必须是字母或者字母和数字的组合，必须以字母开头，长度在6~30个字符之间 |
| mailAddress | 邮箱地址 |body|否| 如果填写，必须符合邮箱地址的格式要求 |
| telephone | 手机号码 |body|否 | 如果填写，必须为11位有效数字，且以1开头|

Example request:
```json
{
  "username": "TestUser1",
  "mailAddress": "test@edgegallery.org",
  "telephone": "13812345678"
}
```

Example response:
```json
response 200 OK
{
    "username": true or false,
    "mailAddress": true or false,
    "telephone": true or false
}
```

### 2.4 查询用户列表

用户管理员查询用户列表

```
Resource URI: /v1/users/list
Method: POST
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
User: admin
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| username | 用户名 |body|否|用于模糊查询条件的用户名关键字 |
| mailAddress| 邮箱地址 |body|否|用于模糊查询条件的邮箱地址关键字 |
| telephone| 电话号码 |body|否|用于模糊查询条件的电话号码关键字 |
| role| 角色 |body|是|ALL--全部;ADMIN--管理员;TENANT--租户;GUEST--访客 |
| status| 状态 |body|是|-1--全部;0--停用;1--启用 |
| createTimeBegin| 创建时间(即注册时间)范围--起始 |body|否|起始时间，格式：2021-1-21 |
| createTimeEnd| 创建时间(即注册时间)范围--终止 |body|否|终止时间，格式：2021-2-1 |
| offset| 查询起始位置 |body|是|分页控制参数，表示查询起始位置 |
| limit| 查询记录数 |body|是|分页控制参数，表示每页查询记录数 |
| sortBy|排序字段 |body|否|用于排序的字段名。USERNAME--按用户名排序;CREATETIME--按创建(注册)时间排序 |
| sortOrder|排序顺序 |body|否|排序顺序。ASC--升序;DESC--降序 |


Example request:
```json
{
  "username": "",
  "mailAddress": "",
  "telephone": "",
  "role": "",
  "status": -1,
  "createTimeBegin": "2021-1-21",
  "createTimeEnd": "2021-2-1",
  "queryCtrl": {
    "offset": 0,
    "limit": 10,
    "sortBy": "USERNAME",
    "sortOrder": "DESC"
  }
}
```

Example response:
```json
response 200 OK
{
  "totalCount": 20,
  "userList": [
    {
      "username": "TestUser1",
      "mailAddress": "test@edgegallery.org",
      "telephone": "13812345678",
      "userId": "37423702-051a-46b4-bf2b-f190759cc0b8",
      "permissions": [
        {
          "platform": "APPSTORE",
          "role": "GUEST"
        }
      ],
      "allowed": true,
      "createTime": "2021-1-21 10:24:45"
    }
  ]
}

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 500 INTERNAL SERVER ERROR
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.5 删除用户

用户管理员可以根据用户ID删除任何用户

```
Resource URI: /v1/users/{userId}
Method: DELETE
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| userId    | 用户ID      | path  | 是      |uuid     |

Example request:
```json
```

Example response:
```json
response 200 OK

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.6 修改用户个人信息

用户可以修改个人信息，返回修改后的信息。

```
Resource URI: /v1/users/{userId}
Method: PUT
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| userId    | 用户ID      | path  | 是      |uuid     |
| username | 用户名 |body|是|  必须是字母或者字母和数字的组合，必须以字母开头，长度在6~30个字符之间 |
| mailAddress | 邮箱地址 |body|否| 如果填写，必须符合邮箱地址的格式要求 |
| telephone | 手机号码 |body|否 | 如果填写，必须为11位有效数字，且以1开头|

Example request:
```json
{
  "username": "TestUser1",
  "mailAddress": "test@edgegallery.org",
  "telephone": "13812345678"
}
```

Example response:
```json
response 200 OK
{
  "username": "TestUser1",
  "mailAddress": "test@edgegallery.org",
  "telephone": "13812345678",
  "userId": "37423702-051a-46b4-bf2b-f190759cc0b8",
  "permissions": [
    {
      "platform": "APPSTORE",
      "role": "GUEST"
    }
  ]
}

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.7 停用用户

用户管理员可以根据用户ID停用用户，其中用户ID为非内置用户的用户ID。用户停用后将无法登录。

```
Resource URI: /v1/users/status/{userId}/disallow
Method: PUT
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
User: admin
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| userId    | 用户ID      | path  | 是      |uuid     |

Example request:
```json
```

Example response:
```json
response 200 OK

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.8 启用用户

用户管理员可以根据用户ID启用用户，其中用户ID为非内置用户的用户ID。

```
Resource URI: /v1/users/status/{userId}/disallow
Method: PUT
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
User: admin
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| userId    | 用户ID      | path  | 是      |uuid     |

Example request:
```json
```

Example response:
```json
response 200 OK

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

### 2.9 设置用户角色

用户管理员可以根据用户ID设置其所属角色和可访问平台。

```
Resource URI: /v1/users/settings/{userId}
Method: PUT
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
User: admin
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| userId    | 用户ID      | path  | 是      | uuid     |
| platform  | 可访问平台      | body  | 是      | 用户可访问的平台    |
| role| 角色      | body  | 是      | 用户所属角色    |

Example request:
```json
{
  "permissions": [
    {
      "platform": "APPSTORE",
      "role": "GUEST"
    }
  ]
}
```

Example response:
```json
response 200 OK

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 403 FORBIDDEN
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```

## 3 IDENTITY 

### 3.1 获取短信验证码

发送验证码到指定的手机号上，发送成功返回200，发送失败返回417。

```
Resource URI: /v1/identity/sms
Method: POST
```

| Name          | Definition |type   | Required|Describe |
| ------------- | ---------- |-------|---------|-------- |
| telephone | 电话号码 |body|是|11位有效数字，必须以1开头 |


Example request:
```json
{
  "telephone": "15191881159"
}
```

Example response:
```json
response 200 OK

response 417 Expectation Failed
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

```

### 3.2 获取邮件验证码

发送验证码到指定的邮箱，发送成功返回200，发送失败返回417

```
Resource URI: /v1/identity/mail
Method: POST
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| mailAddress    | 邮箱地址      | body  | 是      |用以接收验证码的邮箱地址     |

Example request:
```json
{
  "mailAddress": "test@edgegallery.org"
}
```

Example response:
```json
response 200 OK

response 400 Bad Request
{
  "code": 0,
  "message": "string",
  "detail": "string"
}

response 417 Expectation Failed
{
  "code": 0,
  "message": "string",
  "detail": "string"
}
```