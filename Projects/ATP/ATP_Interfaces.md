atp Interfaces
==============
- [atp Interfaces](#atp-interfaces)
  - [1. Task](#1-task)
    - [1.1 POST create test task](#11-create-test-task)
    - [1.2 GET pre-check app package](#12-precheck-app-check)
    - [1.3 POST run test task](#13-run-test-task)
	- [1.4 GET get task list](#14-get-task-list)
	- [1.5 GET batch query task](#15-batch-query-task)
	- [1.6 GET get one task](#16-get-one-task)
	- [1.7 GET download test report](#17-download-test-report)
  - [2. Test case](#2-test-case)
       - [2.1 GET query all test cases](#21-query-all-test-cases)	
 

## 1. Task
Test task for application package
### 1.1 POST create test task 
create test task for application package.
```
Resource URI: /edgegallery/atp/v1/tasks
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|file|file|requestpart|yes|
|isRun|isRun|requestparam|yes|

Example response:
```
200 OK
{
     "id":"",
     "appName":"",
     "appVersion":"",
     "status":"created",
     "createTime":"",
     "endTime":"",
     "providerId":"",
     "packagePath":"",
     "user":{
         "userId"："",
         "userName":""
     }
    "testCaseDetail": {
          "virusScanningTest": [{
             "virusScan": {
                  "result": "",
                  "reason": ""
              }
          }],
          "complianceTest": [{
              "SourcePath": {
                  "result": "",
                  "reason": ""
              },
              "ToscaFile": {
                  "result": "",
                  "reason": ""
              }
          }],
          "sandboxTest": [{
              "UnInstantiate": {
                  "result": "",
                  "reason": ""
              }
          }]
      }
}
```

### 1.2 GET precheck app package
pre check app package info, return the dependency app of package.
```
Resource URI: /edgegallery/atp/v1/tasks/{taskId}/action
```

|Name|Definition|type|Required|
|-------------| -------------|------------|------------|
|taskId|taskId|path param|yes|

Example response:
```
200 OK
{
    {
      "dependency":{
          "appName1":"1.0",
          "appName2":"2.0"
      }
    }
}
```

### 1.3 POST run test task 
Run test task by taskId
```
Resource URI: /edgegallery/atp/v1/tasks/{taskId}/action/run
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|taskId|taskId|path param|yes|

Example response:
```
200 OK
{
     "id":"",
     "appName":"",
     "appVersion":"",
     "status":"failed",
     "createTime":"",
     "endTime":"",
     "providerId":"",
     "packagePath":"",
     "user":{
         "userId"："",
         "userName":""
     }
    "testCaseDetail": {
          "virusScanningTest": [{
             "virusScan": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "complianceTest": [{
              "SourcePath": {
                  "result": "success",
                  "reason": ""
              },
              "ToscaFile": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "sandboxTest": [{
              "UnInstantiate": {
                  "result": "failed",
                  "reason": "inner exception, please check the log."
              }
          }]
      }
}
```

### 1.4 GET get task list 
download one plugin
```
Resource URI: /edgegallery/atp/v1/tasks
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|appName|appName|query param|no|
|status|status|query param|no|
|appVersion|appVersion|query param|no|
|providerId|providerId|query param|no|

Example response:
```
200 OK
[{
     "id":"",
     "appName":"",
     "appVersion":"",
     "status":"failed",
     "createTime":"",
     "endTime":"",
     "providerId":"",
     "packagePath":"",
     "user":{
         "userId"："",
         "userName":""
     }
    "testCaseDetail": {
          "virusScanningTest": [{
             "virusScan": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "complianceTest": [{
              "SourcePath": {
                  "result": "success",
                  "reason": ""
              },
              "ToscaFile": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "sandboxTest": [{
              "UnInstantiate": {
                  "result": "failed",
                  "reason": "inner exception, please check the log."
              }
          }]
      }
}]
```

### 1.5 GET batch query task
batch query task
```
Resource URI: /edgegallery/atp/v1/tasks/batch
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|taskIdList|taskIdList|request param|yes|

Example response:
```
200 OK
[{
     "id":"",
     "appName":"",
     "appVersion":"",
     "status":"failed",
     "createTime":"",
     "endTime":"",
     "providerId":"",
     "packagePath":"",
     "user":{
         "userId"："",
         "userName":""
     }
    "testCaseDetail": {
          "virusScanningTest": [{
             "virusScan": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "complianceTest": [{
              "SourcePath": {
                  "result": "success",
                  "reason": ""
              },
              "ToscaFile": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "sandboxTest": [{
              "UnInstantiate": {
                  "result": "failed",
                  "reason": "inner exception, please check the log."
              }
          }]
      }
}]
```
### 1.6 GET get one task
get task by taskId
```
Resource URI: /edgegallery/atp/v1/tasks/{taskId}
```

|Name| Definition|type|Required|
|-------------|-------------|------------|------------|
|taskId|taskId|path param|yes|

Example response:
```
200 OK
{
     "id":"",
     "appName":"",
     "appVersion":"",
     "status":"failed",
     "createTime":"",
     "endTime":"",
     "providerId":"",
     "packagePath":"",
     "user":{
         "userId"："",
         "userName":""
     }
    "testCaseDetail": {
          "virusScanningTest": [{
             "virusScan": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "complianceTest": [{
              "SourcePath": {
                  "result": "success",
                  "reason": ""
              },
              "ToscaFile": {
                  "result": "success",
                  "reason": ""
              }
          }],
          "sandboxTest": [{
              "UnInstantiate": {
                  "result": "failed",
                  "reason": "inner exception, please check the log."
              }
          }]
      }
}
```
### 1.7 GET download test report
download test report
```
Resource URI: /edgegallery/atp/v1/tasks/{taskId}/action/download
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|taskId|taskId|path param|yes|

Example response:
```
binary output
```
## 2. Test case
test cases of csar package
### 2.1 GET query all test cases 
query all test cases
```
Resource URI: /edgegallery/atp/v1/testcases
```

|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|type|type|query param|no|

Example response:
```
200 OK
[{
    "id":"id",
    "name":"name",
    "type":"type",
    "className":"classPath",
    "description":"description"
}]