How to contribute
==========================

This section provides details on how to participate/contribute to the LCM controller project. 

## Build local development environment

This section will guide developers to build LCM controller module locally and help developers to quickly understand and
 develop code 

The local startup of LCM controller depends on：
```
- DataBase
```
In order to build a local environment, the final startup sequence is DataBase -> LCMController

### DataBase

1. Download and install postgres 12.3 database 

2. Set login name and password, such as lcmcontroller

3. Create a database named lcmcontrollerdb

![](/uploads/images/2020/0924/lcmcontroller-db.png "lcmcontroller-db.png")

### LCM contorller

1. Download LCM controller code

2. Configure the runtime environment variables (using GO Land as an example)

![](/uploads/images/2020/0924/lcm-controller-contribution.png "lcm-controller-contribution.png")

3. Update certificates path in app.conf

![](/uploads/images/2020/0924/mepm-applcm-ssl.png "mepm-applcm-ssl.png")

4. Run main to start LCM controller 
