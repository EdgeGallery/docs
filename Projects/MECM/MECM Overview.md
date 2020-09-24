## Overview
MECM (multi access edge compute manager) provides orchestration and life cycle management of application in
 edgegallery architecture. MECM provides various features including application on-boarding, application orchestration by selecting
  appropriate edge based on deployment strategy, application life cycle management, homing and placement of application 
  based on analytics and policies, application/edge resource monitoring and provides unified topology view.
 
## Architecture
![.](/uploads/images/2020/0924/mecm-architecture.png "mecm-architecture.png")

## Description
## APM
 Application package manager downloads application packages from app store and provides application on-boarding and management functionality.
## APPO
 Application orchestrator provides application orchestration functionality while maintaining the overall view of the
  application
## Inventory
 Inventory provides configuration store for external systems and also maintains resource information and topology view.
## LCM controller
 LCM contoller provides life cycle management of applications. 

## Deployment view
![.](/uploads/images/2020/0924/mecm-deployment-overview.png "mecm-deployment-overview.png")

The deployment view shown is based on k8s deployment. MECM modules supports deployment on virtual
 machine or docker container to start respective service.
