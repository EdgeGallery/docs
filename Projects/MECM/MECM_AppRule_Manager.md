MECM App Rule Manager Interfaces
==============
The document is for the MECM App Rule Manager Interfaces project .

### Queries liveness & readiness
Retrieves data for liveness & readiness

```
Resource URI: /apprulemgr/v1/health
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
Resource URI:  /apprulemgr/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
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
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
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
  "appDNSRule": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": int,
      "state": "string"
    }
  ],
  "appSupportMp1": bool,
  "appName": "string"

```

Example response:
```
200 OK
{
  "taskId":"string",
  "appInstanceId":"string",
  "configResult":"string",
  "configPhase":"string",
  "detailed":"string"
}
```

### Update AppRule Config
Updates the existing app rule
```
Resource URI: /apprulemgr/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
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
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
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
  "appDNSRule": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": int,
      "state": "string"
    }
  ],
  "appSupportMp1": bool,
  "appName": "string"

```

Example response:
```
200 OK
{
  "taskId":"string",
  "appInstanceId":"string",
  "configResult":"string",
  "configPhase":"string",
  "detailed":"string"
}
```

### Get AppRule Config
Queries the existing app rule
```
Resource URI: /apprulemgr/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
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

 "appTrafficRule": [
    {
      "trafficRuleId": "string",
      "filterType": "string",
      "priority": int,
      "trafficFilter": [
        {
          "srcAddress": [
            "string"
          ],
          "dstAddress": [
            "string"
          ],
          "srcPort": [
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
  "appDNSRule": [
    {
      "dnsRuleId": "string",
      "domainName": "string",
      "ipAddressType": "string",
      "ipAddress": "string",
      "ttl": int,
      "state": "string"
    }
  ],
  "appSupportMp1": bool,
  "appName": "string"

```

### Delete AppRule Config
Delete the existing app rule
```
Resource URI: /apprulemgr/v1/tenants/{tenantId}/app_instances/{appInstanceId}/appd_configuration
Method: DELETE
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
 "response" :
  {
   "apprule_task_id" : "string"
  }
}
