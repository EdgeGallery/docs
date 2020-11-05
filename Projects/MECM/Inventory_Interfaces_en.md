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
    "userName": "string"
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
  "userName": "string"
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
    ```
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
    "address": "string",
    "affinity": "string",
    "applcmIp": "string",
    "city": "string",
    "edgeName": "string",
    "edgerepoIp": "string",
    "edgerepoPort": "string",
    "edgerepoUsername": "string",
    "mechostIp": "string",
    "mechostName": "string",
    "userName": "string",
    "zipCode": "string"
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
|hwcapabilities|hardwareCapabilities|body|yes|AlphaNumeric characters allowed|128|
|hwType|hardwareType|body|yes|AlphaNumeric characters allowed|128|
|hwVendor|hardwareVendor|body|yes|AlphaNumeric characters allowed|128|
|hwModel|hardwareModel|body|yes|AlphaNumeric characters allowed|128|

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
|hwcapabilities|hardwareCapabilities|body|yes|AlphaNumeric characters allowed|128|
|hwType|hardwareType|body|yes|AlphaNumeric characters allowed|128|
|hwVendor|hardwareVendor|body|yes|AlphaNumeric characters allowed|128|
|hwModel|hardwareModel|body|yes|AlphaNumeric characters allowed|128|

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