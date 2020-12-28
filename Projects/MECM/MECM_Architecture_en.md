Architecture
==============


![.](/uploads/images/2020/0924/mecm-architecture.png "mecm-architecture.png")

## APM
 Application package manager enables edgegallery to distribute/on-board applications to edge repositories by
  downloading application packages from appstore. 
  
### API Handler

* Provides northbound interfaces for application package on-boarding and management.     

### Manager

* Responsible for obtaining application packages from appstore and on-boarding.     
  
### Distributor

* Responsible for distributing application package to the designated edge nodes.

### Edge Repository Enablement Guide

* Please refer [Edge Repository Enablement Guide](Edge_Repository_Enablement_Guide.md)
  
## APPO
 Appo orchestrates application deployment by executing specified process and automated sequence of tasks, rules and
  policies while maintaining life cycle state.

### API Handler

* Provides northbound interfaces for application LCM operations.     

### BPMN Execution Engine

* The BPMN execution engine executes application lifecycle management related process flows.        

The BPMN process can be designed through the CAMUNDA Modeler tool, as shown in the figure：

## LCM controller
 LCM controller enables edgegallery to deploy and run applications on multiple infrastructure environments (ex. VM, K8s
  etc...) by selecting appropriate plugin adapter. 

### API Handler
 Provides northbound interfaces for application LCM operations.

### Resource Service
 Resource service communicates with K8s plugin to perform LCM operation on K8s environment.

## K8s Plugin
 K8s plugin is responsible for interaction with kubernetes infra for LCM operations.
 
### API Handler: 
 Provides north bound interfaces for K8s plugin.

### K8s Adapter:

 K8s Adapter communicates with Kuberenetes API server to perform LCM operation on K8s environment.

## App Rule Manager

The APP Rule Manager sends configuration request to the MEP. It includes the traffic rules and DNS to be configured.

### API Handler: 
Provides north bound interfaces for app rule manager

### Rule Manager:
Sends app rule configuration request to MEP

## Deployment view

The deployment view shown is based on k8s deployment. MECM modules supports deployment on virtual
 machine or docker container to start respective service.
 
