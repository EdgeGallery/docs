��          �               ,  P   -  �   ~  	  |     �  g   �  V   �  I   R     �  	   �  	   �     �  ]   �  E   +  
   q     |  �   �  �    U   �  �   �    �      
  g   
  V   u
  I   �
       	     	   '     1  Z   G  E   �  
   �     �  |   	   ![](/uploads/images/2020/0924/mecm-applcm-diagram.png "mecm-applcm-diagram.png") Characteristic design LcmController is mainly responsible to provide northbound API's to upload config, remove config, instantiate, terminate , and query an application. It also provides APIs to query mep capabilities and kpi information from prometheus Instantiate API is responsible to deploy an application in edge node. As part of Instantiate API lcmcontroller will send request to MEP about ak sk configuration and will create a kubernetes secret for ak sk values and which can be referred by deployed application. Instantiate: Query API is responsible to get the statistics of pod details such as cpu, disk and memory information. Query KPI API is responsible to get the statistics of node details by using prometheus Query MEP API is responsible to get mep capabilities from mep server node Query: QueryKPI: QueryMEP: Remove Configuration: Remove configuration API is responsible to remove the kube configuration file from edge node. Terminate API is responsible to delete an application from edge node. Terminate: Upload Configuration: Upload configuration API is responsible to upload the kube configuration file into edge node to communicate with kubernetes cluster. Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-04-12 10:35+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 ! [](/uploads/images/2020/0924/mecm - applcm-diagram.png " mecm-applcm-diagram.png ") Characteristic design LcmController is mainly responsible to provide normal north API's to upload config, remove config, instantiate, terminate, and query an application. It also provides APIs to query mep capabilities and kpi information from prometheus Instantiate API is responsible to deploy an application in edge node. As part of Instantiate API lcmcontroller will send request to MEP about ak sk configuration and will create a kubernetes secret for ak values and which can be preferred by deployed application. Instantiate: Query API is responsible to get the statistics of pod details such as cpu, disk and memory information. Query KPI API is responsible to get the statistics of node details by using prometheus Query MEP API is responsible to get mep capabilities from mep server node Query: QueryKPI: QueryMEP: Remove Configuration: Remove configuration API is responsible to remove the cube configuration filefromedgenode. Terminate API is responsible to delete an application from edge node. Terminate: Upload Configuration: Upload configuration API is responsible to upload the cube configuration fileintoedgenodetocommunicatewithkubernetescluster. 