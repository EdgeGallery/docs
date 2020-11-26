## 如何使用Postmen做接口测试

### User-mgmt接口调用逻辑

- 1 首先通过 /login 接口获取XSRF-TOKEN
    - 由于增加了guest访客用户，在未登录情况下