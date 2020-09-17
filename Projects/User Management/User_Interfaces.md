User Interfaces
=============
- [User Interfaces](#appstore-interfaces)
- [User-mgmt-Server](#appStore-server)
  - [1. AUTH](#1-AUTH)
    - [1.1 登出](#11-登出)
    - [1.2 登录](#12-登录)
  - [2. USER-MGMT](#2-USER-MGMT)
    - [2.1 注册用户](#21-注册用户)
    - [2.2 找回密码](#22-找回密码)
    - [2.3 校验重复用户](#23-校验重复用户)
  - [3. IDENTITY](#3-IDENTITY)
    - [3.1 获取短信验证码](#31-获取短信验证码)

## 1. AUTH

### 1.1 登出

登出系统

```
Resource URI: /auth/logout
Method: GET
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| name | app name. |request param|no|


Example response:
```
200 OK
Succeed
```

### 1.2 登录

登录系统

```
Resource URI: /auth/login
Method: POST
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| username | 用户名 |form data|是|
| password | 密码 |form data|是|

Example response:
```
response 200 OK
```

## 2 USER-MGMT

### 2.1 注册用户

注册用户接口，注册成功返回200，并返回已经注册成功的用户信息；接口数据不全返回400。

```
Resource URI: /v1/users
Method: POST
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| username | 用户名 |body|是|
| password | 密码 |body|是|
| company | 公司 |body|是|
| gender | 性别 |body|是|
| telephone | 电话号码 |body|是。如果未开启短信校验功能，只校验电话号码格式；如果开启短信校验功能，会给该号码发送验证码。|
| verificationCode | 验证码 |body|否。如果开启短信校验功能，必须输入|

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

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| telephone | 电话号码 |body|是|
| newPassword | 密码 |body|是|
| verificationCode | 验证码 |body|是|

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

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| username | 用户名 |body|是|
| telephone | 电话号码 |body|是|

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


## 3 IDENTITY 

### 3.1 获取短信验证码

发送验证码到指定的手机号上，发送成功返回200，发送失败返回417。

```
Resource URI: /v1/identity/sms
Method: POST
```

| Name          | Definition |type   | Required|
| ------------- | ------------- |------------|------------|
| telephone | 电话号码 |body|是|


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