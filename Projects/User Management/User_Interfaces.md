User Interfaces
=============
- [User Interfaces](#appstore-interfaces)
- [User-mgmt-Server](#appStore-server)
  - [1. AUTH](#1-AUTH)
    - [1.1 登录](#11-登录)
    - [1.2 登出](#12-登出)
  - [2. USER-MGMT](#2-USER-MGMT)
    - [2.1 注册用户](#21-注册用户)
    - [2.2 找回密码](#22-找回密码)
    - [2.3 校验重复用户](#23-校验重复用户)
    - [2.4 查询用户](#24-查询用户)
    - [2.5 删除用户](#25-删除用户)
    - [2.6 修改用户](#26-修改用户)
  - [3. IDENTITY](#3-IDENTITY)
    - [3.1 获取短信验证码](#31-获取短信验证码)

## 1. AUTH

### 1.1 登录

登录系统

```
Resource URI: /auth/login
Method: POST
```

| Name    | Definition |type   | Required| Describe |
| ------- | ---------- |-------|---------| ---------|
| username | 用户名 |body|是| |
| password | 密码 |body|是| |

Example response:
```
response 200 OK
```

### 1.2 登出

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

### 1.3 查询当前登录用户

查询当前登录的用户信息，返回用户基本信息和用户权限。

```
Resource URI: /auth/login-info
Method: GET
```

Example response:
```json
response 200 OK
{
    "username": "TestUser1",
    "company": "company",
    "gender": "male",
    "telephone": "13812345678",
    "userId": "37423702-051a-46b4-bf2b-f190759cc0b8",
    "permissions": [
        {
            "platform": "APPSTORE",
            "role": "GUEST"
        }
    ]
}
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
| company | 公司 |body|是|  |
| gender | 性别 |body|是|  |
| telephone | 电话号码 |body|是 | 11位有效数字，必须以1开头。如果未开启短信校验功能，只校验电话号码格式；如果开启短信校验功能，会给该号码发送验证码。|
| verificationCode | 验证码 |body|否 | 如果开启短信校验功能，必须输入|

Example request:
```json
{
  "username": "TestUser1",
  "company": "company",
  "gender": "male",
  "telephone": "13812345678",
  "password": "123.qwe",
  "verificationCode": "123456"
}
```

Example response:
```json
response 201 OK
{
  "username": "TestUser1",
  "company": "company",
  "gender": "male",
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

### 2.2 找回密码

使用已经注册的手机号，通过短信验证码的方式重置密码。该接口需要开启短线功能才能访问。

```
Resource URI: /password
Method: PUT
```

| Name          | Definition |type   | Required| Describe |
| ------------- | ---------- |-------|---------| -------- |
| telephone | 电话号码 |body|是| 已经注册过的手机号码 |
| newPassword | 密码 |body|是| 必须满足复杂度要求，必须是数字/字母/特数字符的组合，长度在6~18个字符之间  |
| verificationCode | 验证码 |body|是| 6位有效数字 |

Example request:
```json
{
  "telephone": "13812345678",
  "newPassword": "123.qwe",
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
Resource URI: /action/uniqueness
Method: POST
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| username | 用户名 |body|是|  必须是字母或者字母和数字的组合，必须以字母开头，长度在6~30个字符之间 |
| telephone | 电话号码 |body|是|  11位有效数字，必须以1开头。如果未开启短信校验功能，只校验电话号码格式；如果开启短信校验功能，会给该号码发送验证码。 |

Example request:
```json
{
  "username": "TestUser1",
  "telephone": "13812345678"
}
```

Example response:
```json
response 200 OK
{
    "username": true or false,
    "password": true or false
}
```

### 2.4 查询用户

用户管理员查询所有的用户信息

```
Resource URI: /v1/users
Method: GET
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |


Example request:
```json
{
  "username": "TestUser1",
  "telephone": "13812345678"
}
```

Example response:
```json
response 200 OK
[
  {
    "username": "TestUser1",
    "company": "company",
    "gender": "male",
    "telephone": "13812345678",
    "userId": "37423702-051a-46b4-bf2b-f190759cc0b8",
    "permissions": [
      {
        "platform": "APPSTORE",
        "role": "GUEST"
      }
    ]
  }
]

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


### 2.6 修改用户

用户管理员可以根据用户ID修改用户信息，返回修改后的信息。

```
Resource URI: /v1/users/{userId}
Method: PUT
Role: APPSTORE_ADMIN or DEVELOPER_ADMIN or MECM_ADMIN or LAB_ADMIN or ATP_ADMIN
```

| Name      | Definition |type   | Required|Describe |
| --------- | ---------- |-------|---------|-------- |
| userId    | 用户ID      | path  | 是      |uuid     |

Example request:
```json
{
  "username": "TestUser1",
  "company": "company",
  "gender": "male",
  "telephone": "13812345678",
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
{
  "username": "TestUser1",
  "company": "company",
  "gender": "male",
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


## 3 IDENTITY 

### 3.1 获取短信验证码

发送验证码到指定的手机号上，发送成功返回200，发送失败返回417。

```
Resource URI: /v1/identity/sms
Method: POST
```

| Name          | Definition |type   | Required|Describe |
| ------------- | ---------- |-------|---------|-------- |
| telephone | 电话号码 |body|是|11位有效数字，必须以1开头。如果未开启短信校验功能，只校验电话号码格式；如果开启短信校验功能，会给该号码发送验证码。 |


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