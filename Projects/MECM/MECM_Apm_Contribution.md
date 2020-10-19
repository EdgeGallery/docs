How to contribute
==========================

This section provides details on how to participate/contribute to the APM(Application package manager) project. 

## Build local development environment

This section will guide developers to build APM module locally and help developers to quickly understand and
 develop
 code 

The local startup of APM depends on：
```
- DataBase
```
In order to build a local environment, the final startup sequence is DataBase -> APM

### DataBase

1. Download and install postgres 12.3 database 

2. Set login name and password, such as apm

3. Create a database named apmdb

![](/uploads/images/2020/0924/apm-db.png "apm-db.png")

### Application package manager

1. Download [APM Code](https://gitee.com/edgegallery/mecm-apm/)

2. Configure the runtime environment variables (using IDEA as an example)

![](/uploads/images/2020/0924/apm.png "apm.png")

3. Update key-store and trust-store path in application.yaml

![](/uploads/images/2020/0924/key-store.png "key-store.png")

4. Run ApmApplication to start APM
