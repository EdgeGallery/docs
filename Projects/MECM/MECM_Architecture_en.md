Architecture
==============


![.](/uploads/images/2021/cor2020/mecm-architecture-v1.5_en.png "mecm-architecture-v1.5_en.png")


## Application Package Manager
 Application Package Manager(APM) enables edgegallery to distribute/on-board applications to edge repositories by
  downloading application packages from appstore. 
  
  
## Application Orchestrator
 Application Orchestrator(APPO) is mainly responsible for MEC application orchestration by requesting for life cycle
  management of MEC application on the edge host by executing specified workflow while maintaining the life cycle state.
  Orchestration workflows are modeled using Camunda modeler tool and workflows are executed by camunda engine. 


## Inventory
 Inventory provides realtime view of deployed applications on the edge hosts and applications configurations. Inventory
  is also used for external system registrations.

## North
 North provides interface to obtain the host list and application distribution deployment. At present, it mainly helps   
  the Appstore implement the subscription function.

## LCM Controller
 LCM Controller is responsible MEC application life cycle management operations by sending requests to appropriate
  pluggable plugin adapters based on the infrastructure.
  
  
## K8s Plugin
 K8s Plugin is responsible for MEC application life cycle management operations on kubernetes infrastructure. K8s plugin
  use helm
  client to perform application life cycle management operations.

 
## App Rule Manager
 APP Rule Manager is responsible for configuring application rules by sending application rule configurations to MEP.
  Application rule configurations includes the traffic rules and DNS to be configured.


## Deployment view
![.](/uploads/images/2021/cor2020/mecm-deployment-overview-v1.5_en.png "mecm-deployment-overview-v1.5_en.png")

The deployment view shown is based on k8s deployment. MECM modules supports deployment on virtual
 machine or docker container to start respective service.
 
