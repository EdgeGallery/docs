Application Orchestrator Interfaces
==============
The document is for the Application Orchestrator project, there are two parts of interfaces in the project.

### Get All Application Instances

Retrieves application instances information

```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instance_infos
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appInstanceDescription|appInstanceDescription|RequestPart|yes|Valid UUID|64|
|appName|appName|RequestPart|yes|Alphanumeric characters,special characters are hypen and underscore|128|
|appPackageId|appPackageId|RequestPart|yes|Alphanumeric in lower case|64|
|appId|appId|RequestPart|yes|Alphanumeric in lower case|64|
|mecHost|mecHost|RequestPart |yes|Valid IP Address|15|
|tenant_id |tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
  "appInstanceDescription": "string",
  "appName": "string",
  "appPackageId": "string",
  "appId": "string",
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|app_instance_id |application instance id|path   |yes|Valid UUID|64|
|tenant_id|tenant id|path |yes|Valid UUID|64|

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

|Name|Definition|type|Required|Allowed|Max Length|
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

### Get Query Kpi
Retrieves edge host performance statistics
```
Resource URI: /appo/v1/tenants/{tenant_id}/hosts/{host_ip}/kpi
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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
  "mecHost": "string",
  "hwcapabilities": "string"
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

|Name|Definition|type|Required|Allowed|Max Length|
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

### Batch terminate
Batch terminates application instances.
```
Resource URI: /appo/v1/tenants/{tenant_id}/app_instances/batch_terminate
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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

|Name|Definition|type|Required|Allowed|Max Length|
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
Resource URI: /appo/v1/tenants/{{tenant-id}}/apprule_task_infos/9ab2eb45-8a35-41bc-a319-bc9305cc494b
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
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

### APPO Open Api Swagger

* Please refer [APPO_OPEN_API](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_APIs/appo-swagger-openapi.yaml)