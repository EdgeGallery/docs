How to contribute
==========================

This section provides details on how to participate/contribute to the k8s plugin project. 

## Build local development environment

This section will guide developers to build k8s plugin module locally and help developers to quickly understand and
 develop code 

The local startup of k8s plugin depends on：
```
- DataBase
```
In order to build a local environment, the final startup sequence is DataBase -> K8sPlugin

### DataBase

1. Download and install postgres 12.3 database 

2. Set login name and password, such as k8splugin

3. Create a database named k8splugindb

![](/uploads/images/2020/0924/k8sPlugin-db.png "k8sPlugin-db.png")

### K8s plugin

1. Download k8s plugin code

2. Configure the runtime environment variables (using GO Land as an example)

![](/uploads/images/2020/0924/k8sPlugin-contribution.png "k8sPlugin-contribution.png")

3. Update certificates path in app.conf

![](/uploads/images/2020/0924/mepm-applcm-ssl.png "mepm-applcm-ssl.png")

4. Run main to start k8s plugin 
