Application Orchestrator Interfaces
==============
The document is for the Application Orchestrator project, there are two parts of interfaces in the project.

### Get All Application Instances

Retrieves application instances information

```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instance_infos
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
     "appInstanceId": "string",
     "appPackageId": "string",
     "appName": "string",
     "appId": "string",
     "appDescriptor": "string",
     "mecHost": "string",
     "applcmHost": "string",
     "operationalStatus": "string",
     "operationInfo":"string"
  }
]
```

### Get Application Instance
Retrieves application instance information
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instance_infos/{appInstance_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appInstance_id|application instance id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|


Example response:
```
200 OK
  {
     "appInstanceId": "string",
     "appPackageId": "string",
     "appName": "string",
     "appId": "string",
     "appDescriptor": "string",
     "mecHost": "string",
     "applcmHost": "string",
     "operationalStatus": "string",
     "operationInfo":"string"
  }
```

### Create AppInstance 
Creates App Instance
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appInstanceDescription|appInstanceDescription|RequestPart|yes|Valid UUID|64|
|appName|appName|RequestPart|yes|Alphanumeric characters,special characters are hypen and underscore|128|
|appPackageId|appPackageId|RequestPart|yes|Alphanumeric in lower case|64|
|appId|appId|RequestPart|yes|Alphanumeric in lower case|64|
|mecHost|mecHost|RequestPart |yes|Valid IP Address|15|
|hwcapabilities|hardwareCapabilities|body|No|AlphaNumeric characters allowed|128|
|tenant_id |tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
  "appInstanceDescription": "string",
  "appName": "string",
  "appPackageId": "string",
  "appId": "string",
  "hwCapabilities": [
      "string"
    ],
  "mecHost": "string"
}

```

Example response:

```
202 Request Accepted
[
  {
    "app_instance_id":"string"
  }
]
```

### Get App Instance Information 
Retrieves application instance information
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/{app_instance_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|app_instance_id|application instance id|header|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
     "appInstanceId": "string",
     "appPackageId": "string",
     "appName": "string",
     "appId": "string",
     "appDescriptor": "string",
     "mecHost": "string",
     "applcmHost": "string",
     "operationalStatus": "string",
     "operationInfo":"string"
  }
```

### Instantiate Application
Instantiate application instance.
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/{app_instance_id}
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|app_instance_id |application instance id|path   |yes|Valid UUID|64|
|tenant_id|tenant id|path |yes|Valid UUID|64|
|parameters|key value pair|body |No|Valid String||

Example request body:

```
{
    "parameters": { 
        "mepIp"          : "mep ip",
        "mepPort"        : "mep port",
        "ak"             : "ak",
        "sk"             : "sk" ,
        "..."            : "..."
    }
}
```

Example response:

```
202 Request Accepted
  {
    "response": {}
  }
```

### Delete Application Instance
Terminates application instance.
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/{app_instance_id}
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access_token|header |yes|Jwt token|
|app_instance_id |application instance id|path |yes|Valid UUID|64|
|tenant_id |tenant id|path |yes|Valid UUID|64|

Example response:

```
202 Request Accepted
  {
    "response": {}
  }
```

### Get App Instance Information based in App package ID 
Retrieves application instance information based on package ID
```
Resource URI: /appo/v1/tenants/{tenant_id}/apps/{app_id}/packages/{app_package_id}/status
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|app_id|application id|header|yes|Alphanumeric in lower case|64|
|app_package_id|application package id|header|yes|Alphanumeric in lower case|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
  "data": [
    {
      "appInstanceId": "e87c728c-a552-447b-84ca-782b6c065add",
      "appName": "face_recognition",
      "appDescriptor": "face_recognition",
      "mecHost": "1.1.1.1",
      "mepmHost": "1.1.1.1",
      "operationalStatus": "Created"
    }
  ],
  "retCode": 200,
  "params": [],
  "message": ""
}
```

### Get Query Kpi
Retrieves edge host performance statistics
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/kpi
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|


Example response:
```
200 OK
  [
    "response": "{
    "pods ":[{
    "podstatus":"String","
    "podname":"String",
    "containers":[{
    "containername": "String",
    "metricsusage":{
    "cpuusage" : "String",
    "memusage" : "String",
    "diskusage" : "String"}}]}"
  ]
```

### Get Mep Capabilities
Retrieves edge host performance statistics
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/mep_capabilities
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|


Example response:
```
200 OK
  [
   {
     "capabilityId": "string",
     "capabilityName": "string",
     "status": "string",
     "version": "string",
      "consumers": [
        {
          "applicationInstanceId": "string"
        },
        {
          "applicationInstanceId": "string"
        },
      ]
   },
   {
     "capabilityId": "string",
     "capabilityName": "string",
     "status": "string",
     "version": "string",
      "consumers": [
        {
          "applicationInstanceId": "string"
        }
      ]
   }
  ]
```

### Get Mep Capability
Retrieves edge host performance statistics based on capability id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/mep_capabilities/{capability_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|capability_id|capability_id|path|yes|Alphanumeric characters,special characters are hypen and underscore|128|

Example response:
```
200 OK
   {
     "capabilityId": "string",
     "capabilityName": "string",
     "status": "string",
     "version": "string",
      "consumers": [
        {
          "applicationInstanceId": "string"
        },
        {
          "applicationInstanceId": "string"
        },
      ]
   }
```

### Create Batch
Batch create application instances.
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/batch_create
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant id|path |yes|Valid UUID|64|
|appName|appName|RequestPart|yes|Alphanumeric characters,special characters are hypen and underscore|128|
|appInstanceDescription|appInstanceDescription|RequestPart|yes|Valid UUID|64|
|appPackageId|appPackageId|RequestPart|yes|Alphanumeric in lower case|64|
|appId|appId|RequestPart|yes|Alphanumeric in lower case|64|
|mecHost|mecHost|RequestPart |yes|Valid IP Address|15|
|hwcapabilities|hardwareCapabilities|body|No|AlphaNumeric characters allowed|128|

Example request body:
```
{
  "appPackageId": "string",
  "appName": "string",
  "appInstanceDescription": "string",
  "appId": "string",
  "hwCapabilities": [
     "string"
   ],
   "mecHost": [
     "string"
   ]
}

```

Example response:

```
202 Accepted
  {
    "response": [
            {
              "applicationInstanceId": "string",
              "host": "string",
              "status": "string"
            },
            {
              "applicationInstanceId": "string",
              "host": "string",
              "status": "string"
            }
          ]
  }
```

### Batch instantiate
Batch instantiate application instances.
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/batch_instantiate
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant id|path |yes|Valid UUID|64|
|instantiationParameters|array of key value pair|body |No|Valid string||

Example request body:
```
{
    "instantiationParameters": [
        {  
          "appInstanceId": "d2134a3b-85e7-4bf6-b030-14c71219188a",
          "parameters": {  
                          "mepIp"          : "mep ip",
                          "mepPort"        : "mep port",
                          "ak"             : "ak",
                          "sk"             : "sk",  
                          "..."            : "..."
          }
        }
    ]
}

```

Example response:

```
202 Accepted
  {
    "response": [
            {
              "applicationInstanceId": "string",
              "host": "string",
              "status": "string"
            },
            {
              "applicationInstanceId": "string",
              "host": "string",
              "status": "string"
            }
          ]
  }
```

### Batch terminate
Batch terminates application instances.
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/batch_terminate
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant id|path |yes|Valid UUID|64|
|appInstanceIds|application instance id|body|yes|Valid UUID|64|

Example request body:
```
{
 "appInstanceIds" : ["string","string"]
}

```

Example response:

```
202 Accepted
  {
    "response": [
            {
              "applicationInstanceId": "string",
              "host": "string",
              "status": "string"
            },
            {
              "applicationInstanceId": "string",
              "host": "string",
              "status": "string"
            }
          ]
  }
```

### Batch Query
Batch Query information
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instance_infos/{appInstance_ids}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appInstance_ids|application instance id|header|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|


Example response:
```
200 OK
  {
     "appInstanceId": "string",
     "appPackageId": "string",
     "appName": "string",
     "appId": "string",
     "appDescriptor": "string",
     "mecHost": "string",
     "applcmHost": "string",
     "operationalStatus": "string",
     "operationInfo":"string"
  }
```

### Queries liveness & readiness
Retrieves data for liveness & readiness
```
Resource URI: /appo/v1/health
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```

### Create AppRule Config
Configures the app rule
```
Resource URI:  /appo/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appInstance_id|application instance id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|

Example request body:
```
 "appTrafficRule": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": int,
      "action": "DROP",
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "tag": [
             "string"
          ],
          "srcTunnelAddress": [
             "string"
          ],
          "dstTunnelAddress": [
             "string"
          ],
          "srcTunnelPort": [
             "string"
          ],
           "dstTunnelPort": [
              "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
            "string"
          ],
          "qCI": int,
          "dSCP": int,
          "tC": int
        }
      ],
      "action": "string",
      "state": "string"
    }
  ],
    "dstInterface": [
      {
       "interfaceType": "string",
       "tunnelInfo": 
         {
           "tunnelType": "string",
           "tunnelDstAddress": "string",
           "tunnelSrcAddress": "string",
           "tunnelSpecificData": "string"
         },
           "srcMacAddress": "string",
           "dstMacAddress": "string",
           "dstIpAddress": "string"
           }
     ],
    "appDNSRule": [
     {
       "dnsRuleId": "string",
       "domainName": "string",
       "ipAddressType": "string",
       "ipAddress": "string",
       "ttl": int,
     }
  ],
  "appSupportMp1": bool,
  "appName": "string"

```

Example response:
```
200 OK
{
  "response": 
    {
       "apprule_task_id": "string"
    }
}
```

### Update AppRule Config
Update the app rule
```
Resource URI:  /appo/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
Method: PUT
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appInstance_id|application instance id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|

Example request body:
```
 "appTrafficRule": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": int,
      "action": "DROP",
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "tag": [
             "string"
          ],
          "srcTunnelAddress": [
             "string"
          ],
          "dstTunnelAddress": [
             "string"
          ],
          "srcTunnelPort": [
             "string"
          ],
           "dstTunnelPort": [
              "string"
          ],
          "dstPort": [
            "string"
          ],
          "protocol": [
            "string"
          ],
          "qCI": int,
          "dSCP": int,
          "tC": int
        }
      ],
      "action": "string",
      "state": "string"
    }
  ],
    "dstInterface": [
      {
       "interfaceType": "string",
       "tunnelInfo": 
         {
           "tunnelType": "string",
           "tunnelDstAddress": "string",
           "tunnelSrcAddress": "string",
           "tunnelSpecificData": "string"
         },
           "srcMacAddress": "string",
           "dstMacAddress": "string",
           "dstIpAddress": "string"
           }
     ],
    "appDNSRule": [
     {
       "dnsRuleId": "string",
       "domainName": "string",
       "ipAddressType": "string",
       "ipAddress": "string",
       "ttl": int,
     }
  ],
  "appSupportMp1": bool,
  "appName": "string"

```

Example response:
```
202 OK
{
  "response": 
    {
       "apprule_task_id": "string"
    }
}
```

### Delete AppRule Config
Deletes the existing app rule
```
Resource URI:  /appo/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appInstance_id|application instance id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|

Example request body:
```
{
  "appTrafficRule": ["string", "string"],
  "appDNSRule": ["string", "string"]
}

```
Example response:
```
202 Accepted
{
  "response": 
    {
       "apprule_task_id": "string"
    }
}
```

### Get AppRule Config Status
Queries app rule config status
```
Resource URI: /appo/v1/tenants/{{tenant-id}}/apprule_task_infos/{apprule_task_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|appInstance_id|application instance id|path|yes|Valid UUID|64|
|tenant_id|tenant id|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|

Example Response body:
```
200 OK 

{
  "response":
    {
        "taskId": "string",
        "appInstanceId": "string",
        "detailed": "string",
        "configResult": "string"
    }
}

```

### Synchronizes application instance info from edge
Synchronizes application instance info from all edge
```
Resource URI: /appo/v1/tenants/{{tenant-id}}/app_instance_infos/sync
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access_token|header|yes|Jwt token|
|tenant_id|tenant id|path|yes|Valid UUID|64|

Example Response body:
```
200 OK 

{
    "appInstanceUpdatedRecs": [
        {
            "appInstanceId": "e921ce54-82c8-4532-b5c6-8516cf75f7a6",
            "createTime": "2021-03-12T07:59:55.695956Z",
            "mecHost": "119.8.53.3",
            "deployType": "helm",
            "tenantId": "e921ce54-82c8-4532-b5c6-8516cf75f7a6",
            "appPackageId": "",
            "appName": "",
            "origin": "mepm",
            "syncStatus": false
        }
    ]
}

```
### Create flavor
Create flavor
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/flavors
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
    "name": "test_flavor",
    "vcpus": 2,
    "ram": 1024,
    "disk": 88888,
    "swap": 10,
    "extraSpecs": {
        "EG": "true"
    }
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "create flavor success",
    "params": null
}
```
### Query flavor
Query flavor
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/flavors
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {
		"name": "test_flavor",
		"vcpus": 2,
        "ram": 1024,
        "disk": 10,
        "swap": "10",
        "extraSpecs": {
		    "EG": "true"
		}},
    "retCode": 0,
    "message": "Query flavor success",
    "params": null
}
```
### Query flavor by id
Query flavor by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/flavors/{flavor_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|flavor_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {
		"name": "test_flavor",
		"vcpus": 2,
        "ram": 1024,
        "disk": 10,
        "swap": "10",
        "extraSpecs": {
		    "EG": "true"
		}},
    "retCode": 0,
    "message": "Query flavor success",
    "params": null
}
```
### Delete flavor by id
Delete flavor by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/flavors/{flavor_id}
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|flavor_id|flavor_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete flavor success",
    "params": null
}
```
### Create networks
Create networks
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/networks
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
    "name": "sample_network",
    "shared": true,
    subnet": {
            "name": "subnetA",
            "enableDhcp": true,
            "gatewayIp": "192.168.xxx.1",
            "cidr": "10.0.0.0/24",
            "allocationPools": [
                {
                    "start": "192.168.xxx.5",
                    "end": "192.168.xxx.25"
                }
            ]
        }
        
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "Create networks success",
    "params": null
}
```
### Query flavor
Query flavor
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/networks
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": [{
            "id": "0884b5fb-ea5c-4951-9c54-256f4fc38996",
            "name": "mec_network_n6",
            "shared": true,
            "external": false,
            "status": "ACTIVE",
            "adminState": true,
            "availabilityZones": [
                "nova"
            ],
            "subnets": [
                {
                    "cidr": "192.168.225.0/24",
                    "name": "shared-subnet"
                },
                {
                    "cidr": "111.11.11.0/24",
                    "name": "test111"
                }
            ]
        },
        {
            "id": "1e15cba8-979f-4fb8-bb56-e16a0ebabf54",
            "name": "test6666",
            "shared": false,
            "external": false,
            "status": "ACTIVE",
            "adminState": true,
            "availabilityZones": [
                "nova"
            ],
            "subnets": [
                {
                    "cidr": "192.168.4.0/24",
                    "name": "test6666"
                }
            ]
        }
    ]},
    "retCode": 0,
    "message": "Query networks success",
    "params": null
}
```
### Query flavor by id
Query flavor by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/networks/{network_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|network_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": [{
            "id": "0884b5fb-ea5c-4951-9c54-256f4fc38996",
            "name": "mec_network_n6",
            "shared": true,
            "external": false,
            "status": "ACTIVE",
            "adminState": true,
            "availabilityZones": [
                "nova"
            ],
            "subnets": [
                {
                    "cidr": "192.168.225.0/24",
                    "name": "shared-subnet"
                },
                {
                    "cidr": "111.11.11.0/24",
                    "name": "test111"
                }
            ]
        },
        {
            "id": "1e15cba8-979f-4fb8-bb56-e16a0ebabf54",
            "name": "test6666",
            "shared": false,
            "external": false,
            "status": "ACTIVE",
            "adminState": true,
            "availabilityZones": [
                "nova"
            ],
            "subnets": [
                {
                    "cidr": "192.168.4.0/24",
                    "name": "test6666"
                }
            ]
        }
    ]},
    "retCode": 0,
    "message": "Query networks success",
    "params": null
}
```
### Delete network by id
Delete network by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/networks/{network_id}
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|network_id|network_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete network success",
    "params": null
}
```
### Create servers
Create servers
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/servers
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
    "server" : {
        "name": "vmTest",
        "flavor": "0e12087a-7c87-476a-8f84-7398e991cecc",
        "image" : "cec3aab9-5991-4893-befe-4775ddf79de6",
        "imageRef" : "70a599e0-31e7-49b7-b260-868f441e862b",
        "availabilityZone": "us-west",
        "user_data" : "IyEvYmluL2Jhc2gKL2Jpbi9zdQplY2hvICJJIGFtIGluIHlvdSEiCg==",
        "configDrive": "true",
        "securityGroups": [
            {
                "name": "default"
            }
        ],
		"netWorks": [
            {
                "network": "0884b5fb-ea5c-4951-9c54-256f4fc38991",
				"fixedIp": "192.168.xx.19"
            },
			{
                "network": "241aee72-de67-4c95-bdaa-e63f12fbd183",
				"fixedIp": "192.168.xx.19"
            },
			{
                "network": "446aa035-f737-45db-9834-83c7a5f94046",
				"fixedIp": "192.168.xxx.19"
            }
        ]
    }
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "Create server success",
    "params": null
}
```
### Query servers
Query servers
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/servers
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {
	"servers": [
        {
            "OS-DCF:diskConfig": "AUTO",
            "OS-EXT-AZ:availability_zone": "nova",
            "OS-EXT-SRV-ATTR:host": "compute",
            "OS-EXT-SRV-ATTR:hostname": "new-server-test",
            "OS-EXT-SRV-ATTR:hypervisor_hostname": "fake-mini",
            "OS-EXT-SRV-ATTR:instance_name": "instance-00000001",
            "OS-EXT-SRV-ATTR:kernel_id": "",
            "OS-EXT-SRV-ATTR:launch_index": 0,
            "OS-EXT-SRV-ATTR:ramdisk_id": "",
            "OS-EXT-SRV-ATTR:reservation_id": "r-l0i0clt2",
            "OS-EXT-SRV-ATTR:root_device_name": "/dev/sda",
            "OS-EXT-SRV-ATTR:user_data": "IyEvYmluL2Jhc2gKL2Jpbi9zdQplY2hvICJJIGFtIGluIHlvdSEiCg==",
            "OS-EXT-STS:power_state": 1,
            "OS-EXT-STS:task_state": null,
            "OS-EXT-STS:vm_state": "active",
            "OS-SRV-USG:launched_at": "2019-04-23T15:19:15.317839",
            "OS-SRV-USG:terminated_at": null,
            "accessIPv4": "1.2.3.4",
            "accessIPv6": "80fe::",
            "addresses": {
                "private": [
                    {
                        "OS-EXT-IPS-MAC:mac_addr": "00:0c:29:0d:11:74",
                        "OS-EXT-IPS:type": "fixed",
                        "addr": "192.168.1.30",
                        "version": 4
                    }
                ]
            },
            "config_drive": "",
            "created": "2019-04-23T15:19:14Z",
            "description": null,
            "flavor": {
                "disk": 1,
                "ephemeral": 0,
                "extra_specs": {},
                "original_name": "m1.tiny",
                "ram": 512,
                "swap": 0,
                "vcpus": 1
            },
            "hostId": "2091634baaccdc4c5a1d57069c833e402921df696b7f970791b12ec6",
            "host_status": "UP",
            "id": "2ce4c5b3-2866-4972-93ce-77a2ea46a7f9",
            "image": {
                "id": "70a599e0-31e7-49b7-b260-868f441e862b",
            },
            "key_name": null,
            
            "locked": true,
            "locked_reason": "I don't want to work",
            "metadata": {
                "My Server Name": "Apache1"
            },
            "name": "new-server-test",
            "os-extended-volumes:volumes_attached": [],
            "progress": 0,
            "security_groups": [
                {
                    "name": "default"
                }
            ],
            "status": "ACTIVE",
            "tags": [],
            "tenant_id": "6f70656e737461636b20342065766572",
            "trusted_image_certificates": null,
            "updated": "2019-04-23T15:19:15Z",
            "user_id": "admin"
        }
    ]},
    "retCode": 0,
    "message": "Query servers success",
    "params": null
}
```
### Query server by id
Query server by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/servers/{server_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|server_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {"server": {
        "OS-DCF:diskConfig": "AUTO",
        "OS-EXT-AZ:availability_zone": "nova",
        "OS-EXT-SRV-ATTR:host": "compute",
        "OS-EXT-SRV-ATTR:hostname": "new-server-test",
        "OS-EXT-SRV-ATTR:hypervisor_hostname": "fake-mini",
        "OS-EXT-SRV-ATTR:instance_name": "instance-00000001",
        "OS-EXT-SRV-ATTR:kernel_id": "",
        "OS-EXT-SRV-ATTR:launch_index": 0,
        "OS-EXT-SRV-ATTR:ramdisk_id": "",
        "OS-EXT-SRV-ATTR:reservation_id": "r-t61j9da6",
        "OS-EXT-SRV-ATTR:root_device_name": "/dev/sda",
        "OS-EXT-SRV-ATTR:user_data": "IyEvYmluL2Jhc2gKL2Jpbi9zdQplY2hvICJJIGFtIGluIHlvdSEiCg==",
        "OS-EXT-STS:power_state": 1,
        "OS-EXT-STS:task_state": null,
        "OS-EXT-STS:vm_state": "active",
        "OS-SRV-USG:launched_at": "2019-04-23T15:19:10.855016",
        "OS-SRV-USG:terminated_at": null,
        "accessIPv4": "1.2.3.4",
        "accessIPv6": "80fe::",
        "addresses": {
            "private": [
                {
                    "OS-EXT-IPS-MAC:mac_addr": "00:0c:29:0d:11:74",
                    "OS-EXT-IPS:type": "fixed",
                    "addr": "192.168.1.30",
                    "version": 4
                }
            ]
        },
        "config_drive": "",
        "created": "2019-04-23T15:19:09Z",
        "description": null,
        "flavor": {
            "disk": 1,
            "ephemeral": 0,
            "extra_specs": {},
            "original_name": "m1.tiny",
            "ram": 512,
            "swap": 0,
            "vcpus": 1
        },
        "hostId": "2091634baaccdc4c5a1d57069c833e402921df696b7f970791b12ec6",
        "host_status": "UP",
        "id": "0e12087a-7c87-476a-8f84-7398e991cecc",
        "image": {
            "id": "70a599e0-31e7-49b7-b260-868f441e862b",
        },
        "key_name": null,
        
        "locked": true,
        "locked_reason": "I don't want to work",
        "metadata": {
            "My Server Name": "Apache1"
        },
        "name": "new-server-test",
        "os-extended-volumes:volumes_attached": [],
        "progress": 0,
        "security_groups": [
            {
                "name": "default"
            }
        ],
        "server_groups": [],
        "status": "ACTIVE",
        "tags": [],
        "tenant_id": "6f70656e737461636b20342065766572",
        "trusted_image_certificates": null,
        "updated": "2019-04-23T15:19:11Z",
        "user_id": "admin"
    }},
    "retCode": 0,
    "message": "Query servers success",
    "params": null
}
```
### Operate servers
Operate servers
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/servers/{server_id}
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|server_id|tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
    "action" : "" ### reboot/createImage/pause(数据保留到内存)/unpause(after pause)/suspend(数据保留到磁盘)/resume(after suspend)/stop(关机)/start(after stop)/createConsole
    ### if action reboot, need add params like "HARD" or "SOFT" , if action createImage need add params name and metadata
	"reboot" : " " 
	"createImage : { 
	    "name": "vmsnap",
		"metadata": { }
	} 
}
```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "Operate server success",
    "params": null
}
```
### Delete servers by serverId
Delete servers by serverId
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/servers/{server_id}
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|server_id|server_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete server success",
    "params": null
}
```
### Create images
Create images
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/images
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
    name: "test_image",
    containerFormat: "",
    diskFormat: "",
    minRam: 1,
    minDisk: 10,
    properties: { }
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "create image success",
    "params": null
}
```
### Import image
Import image
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/images/{image_id}
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|image_id|image_id|path|yes|Valid UUID|64|

Example request body:
```
{
    resourceUri: "example",       
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "import image success",
    "params": null
}
```
### Query images
Query images
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/images/
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
```
Example response:
```
200 OK
{
    "images": [
        {
            "status": "active",
            "name": "cirros-0.3.2-x86_64-disk",
            "tags": [],
            "container_format": "bare",
            "created_at": "2014-11-07T17:07:06Z",
            "disk_format": "qcow2",
            "updated_at": "2014-11-07T17:19:09Z",
            "visibility": "public",
            "self": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27",
            "min_disk": 0,
            "protected": false,
            "id": "1bea47ed-f6a9-463b-b423-14b9cca9ad27",
            "file": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27/file",
            "checksum": "64d7c1cd2b6f60c92c14662941cb7913",
            "os_hash_algo": "sha512",
            "os_hash_value": "073b4523583784fbe01daff81eba092a262ec37ba6d04dd3f52e4cd5c93eb8258af44881345ecda0e49f3d8cc6d2df6b050ff3e72681d723234aff9d17d0cf09",
            "os_hidden": false,
            "owner": "5ef70662f8b34079a6eddb8da9d75fe8",
            "size": 13167616,
            "min_ram": 0,
            "schema": "/v2/schemas/image",
            "virtual_size": null
        }
    ],
    "schema": "/v2/schemas/images",
    "first": "/v2/images"
}
```
### Query images by id
Query images by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/images/{image_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|image_id|image_id|path|yes|Valid UUID|64|
```
Example response:
```
200 OK
{
    "status": "active",
    "name": "cirros-0.3.2-x86_64-disk",
    "tags": [],
    "container_format": "bare",
    "created_at": "2014-05-05T17:15:10Z",
    "disk_format": "qcow2",
    "updated_at": "2014-05-05T17:15:11Z",
    "visibility": "public",
    "self": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27",
    "min_disk": 0,
    "protected": false,
    "id": "1bea47ed-f6a9-463b-b423-14b9cca9ad27",
    "file": "/v2/images/1bea47ed-f6a9-463b-b423-14b9cca9ad27/file",
    "checksum": "64d7c1cd2b6f60c92c14662941cb7913",
    "os_hash_algo": "sha512",
    "os_hash_value": "073b4523583784fbe01daff81eba092a262ec37ba6d04dd3f52e4cd5c93eb8258af44881345ecda0e49f3d8cc6d2df6b050ff3e72681d723234aff9d17d0cf09",
    "os_hidden": false,
    "owner": "5ef70662f8b34079a6eddb8da9d75fe8",
    "size": 13167616,
    "min_ram": 0,
    "schema": "/v2/schemas/image",
    "virtual_size": null
}
```
### Delete image by id
Delete image by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/images/{image_id}
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|image_id|image_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete image success",
    "params": null
}
```
### Create securityGroups
Create securityGroups
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
    "name": "new-webservers",
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "create securityGroup success",
    "params": null
}
```
### Query securityGroups
Query securityGroups
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {"securityGroup": [
        {
            "description": "default",
            "id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "name": "default",
            "securityGroupRule": [
                {
                    "direction": "egress",
                    "ethertype": "IPv6",
                    "id": "3c0e45ff-adaf-4124-b083-bf390e5482ff",
                    "port_range_max": null,
                    "port_range_min": null,
                    "protocol": null,
                    "remote_group_id": null,
                    "remote_ip_prefix": null,
                    "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
                    "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "revision_number": 1,
                    "tags": ["tag1,tag2"],
                    "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
                    "created_at": "2018-03-19T19:16:56Z",
                    "updated_at": "2018-03-19T19:16:56Z",
                    "description": ""
                }
            ],
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 8,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tags": ["tag1,tag2"],
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "stateful": true,
            "shared": false
        }
    ]},
    "retCode": 0,
    "message": "Query securityGroups success",
    "params": null
}
```

### Query securityGroup by securityGroupId
Query securityGroup by securityGroupId
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups/{security_group_id}
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|security_group_id|security_group_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {"securityGroup": {
        "description": "default",
        "id": "85cc3048-abc3-43cc-89b3-377341426ac5",
        "name": "default",
        "securityGroupRule": [
            {
                "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747a",
		        "direction": "egress",
		        "protocol": "tcp",
                "ethertype": "IPv4",
		        "port_range_min": 80,
                "port_range_max": 90,
		        remoteIpPrefix: "",
                "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5"
            }
        ],
        "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
        "created_at": "2018-03-19T19:16:56Z",
        "updated_at": "2018-03-19T19:16:56Z",
        "revision_number": 4,
        "tags": ["tag1,tag2"],
        "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
        "stateful": true,
        "shared": false
    }},
    "retCode": 0,
    "message": "Query securityGroup success",
    "params": null
}
```
### Delete securityGroup by id
Delete securityGroup by id
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups/{security_group_id}
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|security_group_id|security_group_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete securityGroup success",
    "params": null
}
```
### Create securityGroupRules
Create securityGroupRules
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups/{security_group_id}/securityGroupRules
Method: POST
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|security_group_id|security_group_id|path|yes|Valid UUID|64|

Example request body:
```
{
        "securityGroupId": "a7734e61-b545-452d-a3cd-0189cbd9747a",
        "direction": "ingress",
        "protocol": "tcp",
        "ethertype": "IPv4",
        "port_range_min": 80,
        "port_range_max": 90,
        remoteIpPrefix: "",
        "remote_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5"
}

```
Example response:
```
200 Accepted
{
    "data": null,
    "retCode": 0,
    "message": "create securityGroupRules success",
    "params": null
}
```
### Query securityGroupRules
Query securityGroupRules
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups/{security_group_id}/securityGroupRules
Method: GET
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|security_group_id|security_group_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": {"securityGroupRule": [
        {
            "direction": "egress",
            "ethertype": "IPv6",
            "id": "3c0e45ff-adaf-4124-b083-bf390e5482ff",
            "port_range_max": null,
            "port_range_min": null,
            "protocol": null,
            "remote_group_id": null,
            "remote_ip_prefix": null,
            "security_group_id": "85cc3048-abc3-43cc-89b3-377341426ac5",
            "project_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "revision_number": 1,
            "created_at": "2018-03-19T19:16:56Z",
            "updated_at": "2018-03-19T19:16:56Z",
            "tenant_id": "e4f50856753b4dc6afee5fa6b9b6c550",
            "description": ""
        }
    ]},
    "retCode": 0,
    "message": "Query securityGroupRules success",
    "params": null
}
```
### Delete securityGroupRules by securityGroupRulesId
Delete securityGroupRules by securityGroupRulesId
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/securityGroups/{security_group_id}/securityGroupRules
Method: DELETE
```
|Name|Definition|Type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|host_ip|edge host ip|path|yes|Valid IP|15|
|tenant_id|tenant_id|path|yes|Valid UUID|64|
|security_group_id|security_group_id|path|yes|Valid UUID|64|

Example response:
```
200 OK
{
    "data": null,
    "retCode": 0,
    "message": "delete securityGroupRule success",
    "params": null
}
```
### APPO Open Api Swagger

* Please refer [APPO_OPEN_API](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_APIs/appo-swagger-openapi.yaml)
