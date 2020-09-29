How to contribute
==========================

This section provides details on how to participate/contribute to the application orchestrator project. 

## Build local development environment

This section will guide developers to build Appo module locally and help developers to quickly understand and develop
 code 

The local startup of Appo depends on：
```
- DataBase
```
In order to build a local environment, the final startup sequence is DataBase -> Appo

### DataBase

1. Download and install postgres 12.3 database 

2. Set login name and password, such as appo

3. Create a database named appodb

![](/uploads/images/2020/0924/appodb.png "appodb.png")

### Application orchestrator

1. Download Appo(application orchestrator) code

2. Configure the runtime environment variables (using IDEA as an example)

![](/uploads/images/2020/0924/appo-contribution.png "appo-contribution.png")

3. Update key-store and trust-store path in application.yaml

![](/uploads/images/2020/0924/meo-ssl.png "meo-ssl.png")

4. Run AppOrchestratorApplication to start application orchestrator
