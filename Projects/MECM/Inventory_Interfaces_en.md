Inventory Interfaces
==============
The document is for the Inventory project, there are three parts of interfaces in the project.

### Get All Application LCM records

Retrieves all application LCM records

```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "applcmIp": "string",
    "applcmPort": "string",
    "userName": "string",
    "applcmName": "string"
  }
]
```

### Add Applcm Record
Adds new application LCM record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|applcmIp|applcmIp|body|yes|Valid URL|15|
|applcmPort|applcmPort|body|yes|Valid Port|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "applcmIp": "string",
  "applcmPort": "string",
  "userName": "string",
  "applcmName": "string"
}
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Delete All Applcm Record
Deletes all application LCM Records.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get Application LCM Record
Retrieves application LCM Record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms/{applcm_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|applcm_ip|applcm ip|path |yes|Valid IP Address|15|
|tenant_id|tenant identifier|path |yes|Valid UUID|64|

Example response:
```
200 OK
{
  "applcmIp": "string",
  "applcmPort": "string",
  "userName": "string",
  "applcmName": "string"
}
```

### Update Application LCM Record
Updates existing application LCM record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms/{applcm_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|applcm_ip|applcm IP|path |yes|Valid IP Address|15|
|tenant_id |tenant identifier|path |yes|Valid UUID|64|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appstoreIp": "string",
  "appstorePort": "string",
  "userName": "string",
  "applcmName": "string"
}
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```

### Delete Application LCM Record
Deletes application LCM record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/applcms/{applcm_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|applcm_ip |applcm ip|path |yes|Valid IP Address|15|
|tenant_id |tenant identifier|path |yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get All Application Records 
Retrieves all application store records
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|

Example response:
```
200 OK
  {
    {
      "appstoreIp": "string",
      "appstoreName": "string",
      "appstorePort": "string",
      "producer": "string",
      "uri": "string",
      "userName": "string"
    }
  }
```

### Add Application Store Record
Adds new application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appstoreIp|appstoreIp|body|yes|Valid IP Address|15|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|uri|uri|body|yes|Valid UUID|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appstoreIp": "string",
  "appstoreName": "string",
  "appstorePort": "string",
  "producer": "string",
  "uri": "string",
  "userName": "string"
}
```
Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Delete All Application Records
Deletes all application stores records
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id |tenant identifier|path   |yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get Application Stores Record
Retrieves application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores/{appstore_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access_token|header |yes|Jwt token|
|appstore_ip |appstore IP|path |yes|Valid IP Address|15|
|tenant_id |tenant identifier|path |yes|Valid UUID|64|

Example response:
```
200 OK
  {
    "appstoreIp" : "string"   
    "appstorePort" : "string"   
    "uri" : "string"
    "userName" : "string"   
    "appstoreName" : "string" 
    "producer" : "string"
  }
```

### Update App Store Record
Updates existing application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores/{appstore_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstore_ip|appstore IP|path|yes|Valid IP Address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appstoreIp|appstoreIp|body|yes|Valid IP Address|15|
|appstoreName|appstoreName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|appstorePort|appstorePort|body|yes|Valid Port|5|
|producer|producer|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|uri|uri|body|yes|Valid UUID|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appstoreIp": "string",
  "appstoreName": "string",
  "appstorePort": "string",
  "producer": "string",
  "uri": "string",
  "userName": "string"
}
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```

### Deletes Application Record
Deletes application store record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/appstores/{appstore_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appstore_ip|appstore IP|path|yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Get All MEC Host Records

Retrieves all MEC host records

```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64 characters|

Example response:
```
200 OK
[
 {
       "mechostIp": "string",
       "mechostName": "string",
       "zipCode": "string",
       "city": "string",
       "address": "string",
       "affinity": "string",
       "userName": "string",
       "edgerepoName": null,
       "edgerepoIp": "string",
       "edgerepoPort": "string",
       "edgerepoUsername": "string",
       "applcmIp": "string",
       "hwcapabilities": [
           {
               "hwType": "string",
               "hwVendor": "string",
               "hwModel": "string"
           },
           {
               "hwType": "string",
               "hwVendor": "string",
               "hwModel": "string"
           }
       ]
   }
]
```

### Add MEC Host Record
Adds new MEC host record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|mechost_ip|mechost IP|path|yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|address|address|body|yes|Valid IP address|255|
|affinity|affinity|body|yes|AlphaNumeric, special characters allowed are hypen,underscore and comma|128|
|applcmIp|applcmIp|body|yes|Valid IP address|15|
|city|city|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgeName|edgeName|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgerepoIp|edgerepoIp|body|yes|Valid IP address|255|
|edgerepoUsername|edgerepoUsername|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|mechostIp|mechostIp|body|yes|Valid IP address|15|
|mechostName|mechostName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|zipCode|zipCode|body|yes|Alpha, special characters allowed are hypen and underscore|128| 
|hwcapabilities|hardwareCapabilities|body|No|AlphaNumeric characters allowed|128|
|hwType|hardwareType|body|No|AlphaNumeric characters allowed|128|
|hwVendor|hardwareVendor|body|No|AlphaNumeric characters allowed|128|
|hwModel|hardwareModel|body|No|AlphaNumeric characters allowed|128|

Example request body:
```
[
  {
      "mechostIp": "string",
      "mechostName": "string",
      "zipCode": "string",
      "city": "string",
      "address": "string",
      "affinity": "string",
      "userName": "string",
      "edgerepoName": null,
      "edgerepoIp": "string",
      "edgerepoPort": "string",
      "edgerepoUsername": "string",
      "applcmIp": "string",
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
]
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Delete All MEC Host Records
Deletes all application stores records
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id |tenant identifier|path   |yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```
### Get MEC Host Record

Retrieves MEC host records

```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|

```
200 OK
{
      "mechostIp": "string",
      "mechostName": "string",
      "zipCode": "string",
      "city": "string",
      "address": "string",
      "affinity": "string",
      "userName": "string",
      "edgerepoName": null,
      "edgerepoIp": "string",
      "edgerepoPort": "string",
      "edgerepoUsername": "string",
      "applcmIp": "string",
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
```
### Update MEC Host Record
Updates existing MEC host record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|mechost_ip|mechost IP|path|yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|address|address|body|yes|Valid IP address|255|
|affinity|affinity|body|yes|AlphaNumeric, special characters allowed are hypen,underscore and comma|128|
|applcmIp|applcmIp|body|yes|Valid IP address|15|
|city|city|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgeName|edgeName|body|yes|AlphaNumeric, special characters allowed are slash and space|128|
|edgerepoIp|edgerepoIp|body|yes|Valid IP address|255|
|edgerepoUsername|edgerepoUsername|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|mechostIp|mechostIp|body|yes|Valid IP address|15|
|mechostName|mechostName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|userName|userName|body|yes|AlphaNumeric, special characters allowed are hypen and underscore|128|
|zipCode|zipCode|body|yes|Alpha, special characters allowed are hypen and underscore|128|
|hwcapabilities|hardwareCapabilities|body|No|AlphaNumeric characters allowed|128|
|hwType|hardwareType|body|No|AlphaNumeric characters allowed|128|
|hwVendor|hardwareVendor|body|No|AlphaNumeric characters allowed|128|
|hwModel|hardwareModel|body|No|AlphaNumeric characters allowed|128|

Example request body:
```
{
      "mechostIp": "string",
      "mechostName": "string",
      "zipCode": "string",
      "city": "string",
      "address": "string",
      "affinity": "string",
      "userName": "string",
      "edgerepoName": null,
      "edgerepoIp": "string",
      "edgerepoPort": "string",
      "edgerepoUsername": "string",
      "applcmIp": "string",
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```
### Delete MEC Host Record
Deletes application stores record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost IP|path |yes|Valid IP Address|15|
|tenant_id |tenant identifier|path   |yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Add Application record
Adds new application record. 
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/apps
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token|access token|header|yes|Jwt token|
|appInstanceId |appInstance id|body |yes|Valid UUID|64|
|tenant_id |tenant identifier|path|yes|Valid UUID|64|
|mechost_ip |mechost ip|path|yes|Valid IP Address|15|
|appName |appName|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|
|capabilities |capabilities|body|yes|capabilities |10|
|packageId |packageId|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|64|
|status |status|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appInstanceId": "string",
  "appName": "string",
  "capabilities": [
    "string"
  ],
  "packageId": "string",
  "status": "string"
}
```

Example response:
```
200 OK
[
  {
    "Saved"
  }
]
```

### Update Application record
Updates Application record. 
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/apps/{app_id}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|appInstanceId |appInstance id|body |yes|Valid UUID|64|
|tenant_id |tenant identifier|path|yes|Valid UUID|64|
|mechost_ip |mechost ip|path|yes|Valid IP Address|15|
|appName |appName|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|
|capabilities |capabilities|body|yes|capabilities |10|
|packageId |packageId|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|64|
|status |status|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appInstanceId": "string",
  "appName": "string",
  "capabilities": [
    "string"
  ],
  "packageId": "string",
  "status": "string"
}
```

Example response:
```
200 OK
[
  {
    "Updated"
  }
]
```

### Delete Application record
Delete application record
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/apps/{app_id}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|app_id|application id|path|yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Retrieves MEC host record
Retrieves MEC host record for specific capabilities
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/capabilities
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|capabilities |capabilities|path|yes|capabilities |10|

Example response:
```
200 OK
{
      "hwcapabilities": [
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          },
          {
              "hwType": "string",
              "hwVendor": "string",
              "hwModel": "string"
          }
      ]
  }
```

### Retrieves MEC application record
Retrieves applications matching capability in a specific MEC host record.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/capabilities/{capability_type}/applications
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost_ip|path |yes|Valid IP address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|capabilities |capabilities|path|yes|capabilities |10|
|capabilityType |capability type|path|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example response:
```
200 OK
{
      "apps": [
          {
              "appInstanceId": "string",
              "appName": "string",
              "packageId": "string"
              "capabilities": [
                  "string"
              ],
              "status": "Created"
      ]
  }
```

### Upload K8s Configuration File
Upload K8s configuration file to applcm

```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/k8sconfig
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|file|file|formData|yes|
|mechost_ip|mechost IP|path|yes|Valid IP Address|15|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|

Example response:
```
200 OK
  [
    "response": {}
  ]
```

### Delete K8s Configuration File
Deletes K8s configuration file from applcm
```
Resource URI: /inventory/v1/tenants/{tenant_id}/mechosts/{mechost_ip}/k8sconfig
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|mechost_ip |mechost IP|path |yes|Valid IP Address|15|
|tenant_id |tenant identifier|path   |yes|Valid UUID|64|

Example response:
```
200 OK
[
  {
    "Deleted"
  }
]
```

### Queries liveness & readiness
Retrieves data for liveness & readiness
```
Resource URI: /inventory/v1/health
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|

Example response:
```
200 OK
```

### Add application rule
Adds a new application rule manager record entry into the Inventory.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/apprulemanagers
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appRulePort|appRulePort|body|yes|Valid Port Number|5|
|appRuleIp|appRuleIp|body|yes|Valid IP Address|15|
|appRuleName|appRuleName|body|yes|AlphaNumeric,special characters allowed are hypen and underscore|128|
|userName|userName|body|no|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appRuleIp": "string",
  "appRulePort": "string",
  "userName": "string",
  "appRuleName": "string"
}
```

Example response:
```
200 OK
{
    "Saved"
}
```

### Update application rule
Updates an exiting application rule manager record in the Inventory matching the given tenant ID &
appRuleManager IP.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/apprulemanagers/{app_rule_manager_ip}
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|app_rule_manager_ip|app rule manager IP|path|yes|Valid IP Address|15|
|appRulePort|appRulePort|body|yes|Valid Port Number|5|
|appRuleIp|appRuleIp|body|yes|Valid IP Address|15|
|userName|userName|body|no|AlphaNumeric,special characters allowed are hypen and underscore|128|

Example request body:
```
{
  "appRuleIp": "string",
  "appRulePort": "string",
  "userName": "string",
  "appRuleName": "string"
}
```

Example response:
```
200 OK
{
    "Updated"
}
```

### Get all application rule manager records
Retrieves all application rule manager records .
```
Resource URI: /inventory/v1/tenants/{tenant_id}/apprulemanagers
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|


Example response:
```
200 OK
[
  {
    "appRuleIp": "string",
    "appRulePort": "string",
    "userName": "string",
    "appRuleName": "string"
  }
]
```

### Get specific application rule manager record
 Retrieves a specific application rule manager record in the Inventory matching the given tenant ID &
 app rule manager IP
```
Resource URI: /inventory/v1/tenants/{tenant_id}/apprulemanagers/{app_rule_manager_ip}
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|app_rule_manager_ip|app rule manager IP|path|yes|Valid IP Address|15|


Example response:
```
200 OK
{
  "appRuleIp": "string",
  "appRulePort": "string",
  "userName": "string",
  "appRuleName": "string"
}
```

### Delete all application rule manager records
Deletes all records for a given tenant
```
Resource URI: /inventory/v1/tenants/{tenant_id}/apprulemanagers
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|


Example response:
```
200 OK
{
    "Deleted"
}
```

### Delete application rule manager record
Delete a specific application rule manager record in the Inventory matching the given tenant ID
& app rule manager IP.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/apprulemanagers/{app_rule_manager_ip}
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|app_rule_manager_ip|app rule manager IP|path|yes|Valid IP Address|15|

Example response:
```
200 OK
{
    "Deleted"
}
```

### Add APPDRule record to Inventory.
Adds a new APPDRule record entry into the Inventory.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: POST
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example request body:
```
{
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
  "appSupportMp1": true,
  "appName": "abcd"
}
```

Example response:
```
200 OK
{
    "Saved"
}
```

### Update APPDRule record to Inventory.
Updates a existing APPDRule record entry into the Inventory matching the given tenant ID & app instance ID.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: PUT
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example request body:
```
{
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
  "appSupportMp1": true,
  "appName": "abcd"
}
```

Example response:
```
200 OK
{
    "Updated"
}
```

### Get APPDRule record to Inventory.
Retrieves appDRule records for given tenant ID and app instance ID.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: GET
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example response body:
```
200 OK
{
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
  "appSupportMp1": true,
  "appName": "abcd"
}
```

### Delete APPDRule record .
Deletes appDRule records for a given tenant and app instance.
```
Resource URI: /inventory/v1/tenants/{tenant_id}/app_instances/{app_instance_id}/appd_configuration
Method: DELETE
```

|Name|Definition|type|Required|Allowed|Max Length|
|---|---|---|---|---|---|
|access_token |access token|header |yes|Jwt token|
|tenant_id|tenant identifier|path|yes|Valid UUID|64|
|appInstanceIds|application instance id|path|yes|Valid UUID|64|


Example response body:
```
200 OK
{
"DELETED"
}
```

### Inventory Open Api Swagger

* Please refer [INVENTORY_OPEN_API](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_APIs/inventory-swagger-openapi.yaml)