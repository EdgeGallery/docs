Characteristic design
LcmController is mainly responsible to provide northbound API's to upload config, remove config, instantiate, terminate
, and query an application. It also provides APIs to query mep capabilities and kpi information from prometheus


![](/uploads/images/2020/0924/mecm-applcm-diagram.png "mecm-applcm-diagram.png") 

Upload Configuration:
 Upload configuration API is responsible to upload the kube configuration file into edge node to communicate with
 kubernetes cluster.
 
Remove Configuration:
 Remove configuration API is responsible to remove the kube configuration file from edge node.
 
Instantiate:
 Instantiate API is responsible to deploy an application in edge node.
 
Terminate:
 Terminate API is responsible to delete an application from edge node.

Query:
 Query API is responsible to get the statistics of pod details such as cpu, disk and memory information.

QueryKPI:
 Query KPI API is responsible to get the statistics of node details by using prometheus
 
QueryMEP:
 Query MEP API is responsible to get mep capabilities from mep server node
