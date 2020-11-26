## 如何使用Postmen做接口测试

### User-mgmt接口调用逻辑

- 1 首先通过 /login 接口获取XSRF-TOKEN
    - 由于增加了guest访客用户，在未登录情况下直接使用 POST /login 接口，会跳转到 GET /，然后默认使用guest/guest登录
- 2 将XSRF-TOKEN的值复制到header的 X-XSRF-TOKEN内
- 3 再次使用POST /login 登录，用户名/密码： admin/admin，将返回200登录成功，并且Cookies被刷新
- 4 使用GET /auth/login-info 查看当前登录的用户是否是admin
- 5 访问其他接口时，需要在header中带上step 3 返回的XSRF-TOKEN。
    ```
     Note：不要使用step1 中第一次得到的XSRF-TOKEN
    ```