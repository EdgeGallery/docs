Architecture
==============


![.](/uploads/images/2020/0924/mecm-architecture.png "mecm-architecture.png")

## APM
 Application package manager enables edgegallery to distribute/on-board applications to edge repositories by
  downloading application packages from appstore. 
  
![.](/uploads/images/2020/0924/mecm_apm_architecture.png "mecm_apm_architecture.png")

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

### API Handler

* Provides northbound interfaces for application LCM operations.     

### BPMN Execution Engine

* The BPMN execution engine executes application lifecycle management related process flows.        

The BPMN process can be designed through the CAMUNDA Modeler tool, as shown in the figure：

![.](/uploads/images/2020/0924/mecm_appo_process_flow.png "mecm_appo_process_flow.png")

## LCM controller
 LCM controller enables edgegallery to deploy and run applications on multiple infrastructure environments (ex. VM, K8s
  etc...) by selecting appropriate plugin adapter. 

![.](/uploads/images/2020/0924/mecm-applcm-diagram.png "mecm-applcm-diagram.png") 

### API Handler
 Provides northbound interfaces for application LCM operations.

### K8s Plugin adapter
 K8s plugin adapter communicates with K8s plugin to perform LCM operation on K8s environment.

### K8s Plugin
 K8s plugin is responsible for interaction with kubernetes infra for LCM operations.


## Deployment view
![.](/uploads/images/2020/0924/mecm-deployment-overview.png "mecm-deployment-overview.png")

The deployment view shown is based on k8s deployment. MECM modules supports deployment on virtual
 machine or docker container to start respective service.
