## Overview
MECM (multi access edge compute manager) provides orchestration and life cycle management of application in
 edgegallery architecture. MECM provides various features including application on-boarding, application orchestration by selecting
  appropriate edge based on deployment strategy, application life cycle management, homing and placement of application 
  based on analytics and policies, application/edge resource monitoring and provides unified topology view.
 
## Architecture
![.](/uploads/images/2020/0924/mecm-architecture.png "mecm-architecture.png")

## MECM Components
## APM
 Application package manager enables edgegallery to distribute/on-board applications to edge repositories by
  downloading application packages from appstore. 
  
![.](/uploads/images/2020/0924/mecm_apm_architecture.png "mecm_apm_architecture.png")

## APM Components
### API Handler

* Provides northbound interfaces for application package on-boarding and management.     

### Manager

* Responsible for obtaining application packages from appstore and on-boarding.     
  
### Distributor

* Responsible for distributing application package to the designated edge nodes.
  
## APPO
 Appo orchestrates application deployment by executing specified process and automated sequence of tasks, rules and
  policies while maintaining life cycle state.

![.](/uploads/images/2020/0924/mecm_appo_architecture.png "mecm_appo_architecture.png")

## Appo Components
### API Handler

* Provides northbound interfaces for application LCM operations.     

### BPMN Execution Engine

* The BPMN execution engine executes application lifecycle management related process flows.        

The BPMN process can be designed through the CAMUNDA Modeler tool, as shown in the figure：

![.](/uploads/images/2020/0924/mecm_appo_process_flow.png "mecm_appo_process_flow.png")

## Inventory
 Inventory provides configuration store for external system registration and also maintains resource information and
  topology view.

## LCM controller
 LCM controller enables edgegallery to deploy and run applications on multiple infrastructure environments (ex. VM, K8s
  etc...) by selecting appropriate plugins. 
## K8s Plugin
 K8s plugin is responsible for interaction with kubernetes infra for LCM operations.

![.](/uploads/images/2020/0924/mecm-applcm-diagram.png "mecm-applcm-diagram.png") 

## Deployment view
![.](/uploads/images/2020/0924/mecm-deployment-overview.png "mecm-deployment-overview.png")

The deployment view shown is based on k8s deployment. MECM modules supports deployment on virtual
 machine or docker container to start respective service.
