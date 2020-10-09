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
  "response": {}
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
  [
    "response": {}
  ]
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
|appdId|appdId|RequestPart|yes|Alphanumeric in lower case|64|
|mecHost|mecHost|RequestPart |yes|Valid IP Address|15|
|tenant_id |tenant_id|path|yes|Valid UUID|64|

Example request body:
```
{
  "appInstanceDescription": "string",
  "appName": "string",
  "appPackageId": "string",
  "appdId": "string",
  "mecHost": "string"
}

```

Example response:
```
200 OK
  {
    "response": {}
  }
```

```
201 Request Accepted
  {
    "response": {}
  }
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
    "response": {}
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
200 OK
  {
    "response": {}
  }
```
```
201 Request Accepted
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
200 OK
  {
    "response": {}
  }
```

```
200 Request Accepted
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
    "response": {}
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
    "response": {}
  ]
```