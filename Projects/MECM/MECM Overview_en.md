## Overview
MECM (multi access edge compute manager) provides orchestration and life cycle management of application in
 edgegallery architecture. MECM provides various features including application on-boarding, application orchestration by selecting
  appropriate edge based on deployment strategy, application life cycle management, homing and placement of application 
  based on analytics and policies, application/edge resource monitoring and provides unified topology view.
 
## Architecture
![.](/uploads/images/2020/0924/mecm-architecture.png "mecm-architecture.png")

## Description
## APM
 Application package manager enables edgegallery to distribute/on-board applications to edge repositories by
  downloading application packages form appstore. 
## APPO
 Application orchestrator enables edgegallery to orchestrate application deployment based on deployment strategy.
## Inventory
 Inventory provides configuration store for external system registration and also maintains resource information and
  topology view.
## LCM controller
 LCM contoller enables edgegallery to deploy and run applications on multiple infrastructure environments (ex. VM, K8s
  etc...) by selecting appropriate plugins. 
## K8s Plugin
 K8s plugin is responsible for interaction with kubernetes infra for LCM operations. 

## Deployment view
![.](/uploads/images/2020/0924/mecm-deployment-overview.png "mecm-deployment-overview.png")

The deployment view shown is based on k8s deployment. MECM modules supports deployment on virtual
 machine or docker container to start respective service.
