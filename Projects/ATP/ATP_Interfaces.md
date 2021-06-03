atp Interfaces
==============
- [atp Interfaces](#atp-interfaces)
  - [1. Task](#1-task)
    - [1.1 POST create test task](#11-create-test-task)
    - [1.2 POST run test task](#12-run-test-task)
    - [1.3 GET get task list](#13-get-task-list)
    - [1.4 GET get one task](#14-get-one-task)
    - [1.5 PUT modify test case status](#15-modify-test-case-status)
    - [1.6 POST batch delete test tasks](#16-batch-delete-test-tasks)
    - [1.7 GET get test tasks analysis](#15-get-test-tasks-analysis)
  - [2. Test case](#2-test-case)
       - [2.1 GET query all test cases](#21-query-all-test-cases)	
       - [2.2 POST create test case](#22-create-test-case) 
       - [2.3 PUT update test case](#23-update-test-case)
       - [2.4 DELETE delete test case](#24-delete-test-case)
       - [2.5 GET query one test case](#25-query-one-test-case)
       - [2.6 GET download test case](#25-download-test-case)
  - [3. Test scenario](#2-test-scenario)
       - [3.1 GET query all test scenarios](#21-query-all-test-scenarios)	
       - [3.2 POST create test scenarios](#22-create-test-scenarios) 
       - [3.3 PUT update test scenarios](#23-update-test-scenarios)
       - [3.4 DELETE delete test scenarios](#24-delete-test-scenarios)
       - [3.5 GET query one test case](#25-query-one-test-case)
       - [3.6 GET query all test cases under one scneario](#25-query-all-test-cases-under-one-scneario)
  - [4. Test suite](#2-test-suite)
       - [4.1 GET query all test suites](#21-query-all-test-suites)	
       - [4.2 POST create test suite](#22-create-test-suite) 
       - [4.3 PUT update test suite](#23-update-test-suite)
       - [4.4 DELETE delete test suite](#24-delete-test-suite)
       - [4.5 GET query one test suite](#25-query-one-test-suite)
  - [5. Contribution](#2-contribution)
       - [5.1 GET query all contributions](#21-query-all-test-contributions)	
       - [5.2 POST create contribution](#22-create-contribution)
  - [6. File](#2-file)
       - [6.1 GET query one file](#21-query-one-file)	 
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

Example response:
```
200 OK
{
   "id":"",
   "packagePath”:"",
   "appName":"",
   "appVersion":"",
   "providerId”:"",
   "status":"",
   "createTime":123456789,
   "user":{
       "userId"："",
       "userName":""
   }
}

```

### 1.2 POST run test task 
Run test task by taskId
```
Resource URI: /edgegallery/atp/v1/tasks/{taskId}/action/run
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|taskId|taskId|path param|yes|
|scenarioIdList|scenarioIdList|request param|yes|

Example response:
```
200 OK
{
  "id": "8ac6e62d-1d20-4193-942e-ece6deff5e4e",
  "appName": "monitor-service",
  "appVersion": "1.0",
  "status": "running",
  "createTime": "2021-03-01T02:42:29.306+0000",
  "endTime": "2021-03-01T02:43:03.943+0000",
  "user": {
    "userId": "4eed814b-5d29-4e4c-ba73-51fc6db4ed86",
    "userName": "atp"
  },
  "providerId": "Huawei",
  "testScenarios": [
    {
      "id": "e71718a5-864a-49e5-855a-5805a5e9f97d",
      "nameCh": "中国联通",
      "nameEn": "China Unicom Scenario",
      "label": "China Unicom",
      "testSuites": [
        {
          "id": "6d04da1b-1f36-4295-920a-8074f7f9d942",
          "nameCh": "沙箱测试",
          "nameEn": "Sandbox Test",
          "testCases": [
            {
              "id": "4d203173-5555-4f62-aabb-8ebcec357f87",
              "nameCh": "应用实例化",
              "nameEn": "Application Instantiation",
              "descriptionCh": "将应用包部署到边缘节点",
              "descriptionEn": "Instantiate application and its dependency application on one edge host",
              "type": "automatic",
              "result": "failed",
              "reason": "host ip is empty"
            }
          ]
        }
      ]	 	
    }
  ] 
}

```

### 1.3 GET get task list 
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
  "id": "8ac6e62d-1d20-4193-942e-ece6deff5e4e",
  "appName": "monitor-service",
  "appVersion": "1.0",
  "status": "running",
  "createTime": "2021-03-01T02:42:29.306+0000",
  "endTime": "2021-03-01T02:43:03.943+0000",
  "user": {
    "userId": "4eed814b-5d29-4e4c-ba73-51fc6db4ed86",
    "userName": "atp"
  },
  "providerId": "Huawei",
  "testScenarios": [
    {
      "id": "e71718a5-864a-49e5-855a-5805a5e9f97d",
      "nameCh": "中国联通",
      "nameEn": "China Unicom Scenario",
      "label": "China Unicom",
      "testSuites": [
        {
          "id": "6d04da1b-1f36-4295-920a-8074f7f9d942",
          "nameCh": "沙箱测试",
          "nameEn": "Sandbox Test",
          "testCases": [
            {
              "id": "4d203173-5555-4f62-aabb-8ebcec357f87",
              "nameCh": "应用实例化",
              "nameEn": "Application Instantiation",
              "descriptionCh": "将应用包部署到边缘节点",
              "descriptionEn": "Instantiate application and its dependency application on one edge host",
              "type": "automatic",
              "result": "failed",
              "reason": "host ip is empty"
            }
          ]
        }
      ]	 	
    }
  ] 
}]
```

### 1.4 GET get one task
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
  "id": "8ac6e62d-1d20-4193-942e-ece6deff5e4e",
  "appName": "monitor-service",
  "appVersion": "1.0",
  "status": "running",
  "createTime": "2021-03-01T02:42:29.306+0000",
  "endTime": "2021-03-01T02:43:03.943+0000",
  "user": {
    "userId": "4eed814b-5d29-4e4c-ba73-51fc6db4ed86",
    "userName": "atp"
  },
  "providerId": "Huawei",
  "testScenarios": [
    {
      "id": "e71718a5-864a-49e5-855a-5805a5e9f97d",
      "nameCh": "中国联通",
      "nameEn": "China Unicom Scenario",
      "label": "China Unicom",
      "testSuites": [
        {
          "id": "6d04da1b-1f36-4295-920a-8074f7f9d942",
          "nameCh": "沙箱测试",
          "nameEn": "Sandbox Test",
          "testCases": [
            {
              "id": "4d203173-5555-4f62-aabb-8ebcec357f87",
              "nameCh": "应用实例化",
              "nameEn": "Application Instantiation",
              "descriptionCh": "将应用包部署到边缘节点",
              "descriptionEn": "Instantiate application and its dependency application on one edge host",
              "type": "automatic",
              "result": "failed",
              "reason": "host ip is empty"
            }
          ]
        }
      ]	 	
    }
  ] 
}

```
### 1.5 PUT modify test case status
modify manual test case status
```
Resource URI: edgegallery/atp/v1/tasks/{taskId}/testcase
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|taskId|taskId|path param|yes|

Example request:
```
[{
      "testScenarioId":"",
      "testSuiteId":"",
      "testCaseId":"",
      "result":"" ,
      "reason":""
}]
```

Example response:
```
true
```
### 1.6 POST  batch delete test tasks
batch delete test tasks
```
Resource URI: edgegallery/atp/v1/tasks/batch_delete
```

Example request:
```
{
  "taskIds":["id1","id2"]
}

```

Example response:
```
{
   "failed":["id3"]
}

```
### 1.7 GET get test tasks analysis
get test tasks analysis
```
Resource URI: edgegallery/atp/v1/tasks/action/analysize
```

Example response:
```
200 OK
 {
   "total":426,
   "currentMonth":11,
   "oneMonthAgo":111,
   "twoMonthAgo":12,
   "threeMonthAgo":13,
   "fourMonthAgo":14,
   "fiveMonthAgo":15
}
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
|name|name|query param|no|
|locale|locale|query param|no|
|testSuiteIdList|testSuiteIdList|query param|no|

Example response:
```
200 OK
[{
  "id": "4d203173-9999-4f62-aabb-8ebcec357f87",
  "nameCh": "APPD文件目录校验",
  "nameEn": "APPD File Dir Validation",
  "type": "automatic",
  "descriptionCh": "根目录下必须包含APPD文件目录",
  "descriptionEn": "Root directory must contain APPD file dir",
  "hashCode": "",
  "codeLanguage": "java",
  "expectResultCh": "根目录下存在APPD文件目录",
  "expectResultEn": "Root directory contains APPD file dir",
  "testStepCh": "1.打开csar包 2.校验根目录下存在APPD目录",
  "testStepEn": "1.open csar package 2.validate root directory contains APPD directory",
  "testSuiteIdList": [
    "522684bd-d6df-4b47-aab8-b43f1b4c19c0"
  ]
}]

```

### 2.2 POST create test case 
create test case
```
Resource URI: /edgegallery/atp/v1/testcases
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|nameCh|nameCh|request param|yes|
|nameEn|nameEn|request param|no|
|type|type|request param|yes|
|descriptionCh|descriptionCh|request param|yes|
|descriptionEn|descriptionEn|request param|no|
|codeLanguage|codeLanguage|request param|yes|
|expectResultCh|expectResultCh|request param|yes|
|expectResultEn|expectResultEn|request param|no|
|testSuiteIdList|testSuiteIdList|request param|yes|
|testStepCh|testStepCh|request param|yes|
|testStepEn|testStepEn|request param|no|
|file|file|request part|yes|

Example response:
```
200 OK
{
  "id": "4d203173-9999-4f62-aabb-8ebcec357f87",
  "nameCh": "APPD文件目录校验",
  "nameEn": "APPD File Dir Validation",
  "type": "automatic",
  "descriptionCh": "根目录下必须包含APPD文件目录",
  "descriptionEn": "Root directory must contain APPD file dir",
  "hashCode": "",
  "codeLanguage": "java",
  "expectResultCh": "根目录下存在APPD文件目录",
  "expectResultEn": "Root directory contains APPD file dir",
  "testStepCh": "1.打开csar包 2.校验根目录下存在APPD目录",
  "testStepEn": "1.open csar package 2.validate root directory contains APPD directory",
  "testSuiteIdList": [
    "522684bd-d6df-4b47-aab8-b43f1b4c19c0"
  ]
}
```

### 2.3 PUT update test case 
update test case
```
Resource URI: /edgegallery/atp/v1/testcases
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|request param|yes|
|type|type|request param|no|
|descriptionCh|descriptionCh|request param|no|
|descriptionEn|descriptionEn|request param|no|
|codeLanguage|codeLanguage|request param|no|
|expectResultCh|expectResultCh|request param|no|
|expectResultEn|expectResultEn|request param|no|
|testSuiteIdList|testSuiteIdList|request param|no|
|testStepCh|testStepCh|request param|no|
|testStepEn|testStepEn|request param|no|
|file|file|request part|no|

Example response:
```
200 OK
{
  "id": "4d203173-9999-4f62-aabb-8ebcec357f87",
  "nameCh": "APPD文件目录校验",
  "nameEn": "APPD File Dir Validation",
  "type": "automatic",
  "descriptionCh": "根目录下必须包含APPD文件目录",
  "descriptionEn": "Root directory must contain APPD file dir",
  "hashCode": "",
  "codeLanguage": "java",
  "expectResultCh": "根目录下存在APPD文件目录",
  "expectResultEn": "Root directory contains APPD file dir",
  "testStepCh": "1.打开csar包 2.校验根目录下存在APPD目录",
  "testStepEn": "1.open csar package 2.validate root directory contains APPD directory",
  "testSuiteIdList": [
    "522684bd-d6df-4b47-aab8-b43f1b4c19c0"
  ]
}
```
### 2.4 DELETE delete test case 
delete test case
```
Resource URI: /edgegallery/atp/v1/testcases/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
true
```

### 2.5 GET query one test case 
query one test case
```
Resource URI: /edgegallery/atp/v1/testcases/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
{
  "id": "4d203173-9999-4f62-aabb-8ebcec357f87",
  "nameCh": "APPD文件目录校验",
  "nameEn": "APPD File Dir Validation",
  "type": "automatic",
  "descriptionCh": "根目录下必须包含APPD文件目录",
  "descriptionEn": "Root directory must contain APPD file dir",
  "hashCode": "",
  "codeLanguage": "java",
  "expectResultCh": "根目录下存在APPD文件目录",
  "expectResultEn": "Root directory contains APPD file dir",
  "testStepCh": "1.打开csar包 2.校验根目录下存在APPD目录",
  "testStepEn": "1.open csar package 2.validate root directory contains APPD directory",
  "testSuiteIdList": [
    "522684bd-d6df-4b47-aab8-b43f1b4c19c0"
  ]
}
```

### 2.6 GET download test case 
download test case
```
Resource URI: edgegallery/atp/v1/testcases/{id}/action/download
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
binary stream
```

## 3. Test scenario
test scenario management
### 3.1 GET query all test scenarios 
query all test scenarios
```
Resource URI: edgegallery/atp/v1/testscenarios
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|name|name|query param|no|
|locale|locale|query param|no|

Example response:
```
200 OK
[
  {
    "id": "4d203111-1111-4f62-aabb-8ebcec357f87",
    "nameCh": "社区场景",
    "nameEn": "EdgeGallery Community Scenario",
    "descriptionCh": "适用于社区场景的测试",
    "descriptionEn": "suite for EdgeGallery community test",
    "label": "EdgeGallery"
  }
]

```

### 3.2 POST create test scenario 
create test scenario 
```
Resource URI: edgegallery/atp/v1/testscenarios
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|nameCh|nameCh|request param|yes|
|nameEn|nameEn|request param|no|
|descriptionCh|descriptionCh|request param|yes|
|descriptionEn|descriptionEn|request param|no|
|label|label|request param|yes|
|icon|icon|request part|yes|

Example response:
```
200 OK
  {
    "id": "4d203111-1111-4f62-aabb-8ebcec357f87",
    "nameCh": "社区场景",
    "nameEn": "EdgeGallery Community Scenario",
    "descriptionCh": "适用于社区场景的测试",
    "descriptionEn": "suite for EdgeGallery community test",
    "label": "EdgeGallery"
  }
```

### 3.3 PUT update test scenario
update test scenario
```
Resource URI: edgegallery/atp/v1/testscenarios/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|
|nameCh|nameCh|request param|no|
|nameEn|nameEn|request param|no|
|descriptionCh|descriptionCh|request param|no|
|descriptionEn|descriptionEn|request param|no|
|label|label|request param|no|
|icon|icon|request part|no|

Example response:
```
200 OK
  {
    "id": "4d203111-1111-4f62-aabb-8ebcec357f87",
    "nameCh": "社区场景",
    "nameEn": "EdgeGallery Community Scenario",
    "descriptionCh": "适用于社区场景的测试",
    "descriptionEn": "suite for EdgeGallery community test",
    "label": "EdgeGallery"
  }
```
### 3.4 DELETE delete test scenario
delete test scenario
```
Resource URI: edgegallery/atp/v1/testscenarios/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
true
```

### 3.5 GET query one test scenario
query one test scenario
```
Resource URI: edgegallery/atp/v1/testscenarios/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
  {
    "id": "4d203111-1111-4f62-aabb-8ebcec357f87",
    "nameCh": "社区场景",
    "nameEn": "EdgeGallery Community Scenario",
    "descriptionCh": "适用于社区场景的测试",
    "descriptionEn": "suite for EdgeGallery community test",
    "label": "EdgeGallery"
  }
```

### 3.6 GET query all test cases under one scenario
query all test cases under one scenario
```
Resource URI: edgegallery/atp/v1/testscenarios/testcases
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|scenarioids|scenarioids|request param|yes|

Example request:
```
200 OK
"scenarioIds":["id", "id2"]
```
Example response:
```
200 OK
[
  {
    "id": "96a82e85-d40d-4ce5-beec-2dd1c9a3d41d",
    "nameCh": "中国电信",
    "nameEn": "China Telecom Scenario",
    "descriptionCh": "适用于中国电信场景的测试",
    "descriptionEn": "suite for China Telecom test",
    "label": "China Telecom",
    "testSuites": [
      {
        "id": "6d04da1b-1f36-4295-920a-8074f7f9d942",
        "nameCh": "沙箱测试",
        "nameEn": "Sandbox Test",
        "descriptionCh": "应用包部署测试",
        "descriptionEn": "App package deployment test",
        "scenarioIdList": [
          "4d203111-1111-4f62-aabb-8ebcec357f87",
          "e71718a5-864a-49e5-855a-5805a5e9f97d",
          "6fe8581c-b83f-40c2-8f5b-505478f9e30b",
          "96a82e85-d40d-4ce5-beec-2dd1c9a3d41d"
        ],
        "testCases": [
          {
            "id": "4d203173-5555-4f62-aabb-8ebcec357f87",
            "nameCh": "应用实例化",
            "nameEn": "Application Instantiation",
            "type": "automatic",
            "descriptionCh": "将应用包部署到边缘节点",
            "descriptionEn": "Instantiate application and its dependency application on one edge host",
            "hashCode": "",
            "codeLanguage": "jar",
            "expectResultCh": "应用包可以成功部署",
            "expectResultEn": "app can instantiate successfully.",
            "testStepCh": "部署应用包到对应的边缘节点",
            "testStepEn": "Deploy application package to edge node",
            "testSuiteIdList": [
              "6d04da1b-1f36-4295-920a-8074f7f9d942"
            ]
          }
        ]
      }
    ]
  }
]
```

## 4. Test suite
test suite management
### 4.1 GET query all test suite
query all test suite
```
Resource URI: edgegallery/atp/v1/testsuites
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|name|name|query param|no|
|locale|locale|query param|no|
|scenarioIdList|scenarioIdList|query param|no|

Example response:
```
200 OK
[
  {
    "id": "522684bd-d6df-4b47-aab8-b43f1b4c19c0",
    "nameCh": "遵从性测试",
    "nameEn": "Compliance Test",
    "descriptionCh": "遵从社区APPD标准、ETSI标准对应用包结构进行校验",
    "descriptionEn": "Validate app package structure according to commnunity and ETSI standard",
    "scenarioIdList": [
      "4d203111-1111-4f62-aabb-8ebcec357f87"
    ]
  }
]

```

### 4.2 POST create test suite
create test suite
```
Resource URI: edgegallery/atp/v1/testsuites
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|nameCh|nameCh|request param|yes|
|nameEn|nameEn|request param|no|
|descriptionCh|descriptionCh|request param|yes|
|descriptionEn|descriptionEn|request param|no|
|scenarioIdList|scenarioIdList|request param|yes|

Example response:
```
200 OK
{
  "id": "743abd93-57a3-499d-9591-fa7db86a4778",
  "nameCh": "安全性测试",
  "nameEn": "Security Test",
  "descriptionCh": "应用包安全测试",
  "descriptionEn": "App package security test",
  "scenarioIdList": [
    "4d203111-1111-4f62-aabb-8ebcec357f87"
  ]
}
```

### 4.3 PUT update test suite
update test suite
```
Resource URI: edgegallery/atp/v1/testsuites/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|
|nameCh|nameCh|request param|no|
|nameEn|nameEn|request param|no|
|descriptionCh|descriptionCh|request param|no|
|descriptionEn|descriptionEn|request param|no|
|scenarioIdList|scenarioIdList|request param|no|

Example response:
```
200 OK
{
  "id": "743abd93-57a3-499d-9591-fa7db86a4778",
  "nameCh": "安全性测试",
  "nameEn": "Security Test",
  "descriptionCh": "应用包安全测试",
  "descriptionEn": "App package security test",
  "scenarioIdList": [
    "4d203111-1111-4f62-aabb-8ebcec357f87"
  ]
}
```
### 4.4 DELETE delete test suite
delete test suite
```
Resource URI: edgegallery/atp/v1/testsuites/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
true
```

### 4.5 GET query one test suite
query one test suite
```
Resource URI: edgegallery/atp/v1/testsuites/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|

Example response:
```
200 OK
{
  "id": "743abd93-57a3-499d-9591-fa7db86a4778",
  "nameCh": "安全性测试",
  "nameEn": "Security Test",
  "descriptionCh": "应用包安全测试",
  "descriptionEn": "App package security test",
  "scenarioIdList": [
    "4d203111-1111-4f62-aabb-8ebcec357f87"
  ]
}
```
## 5. Contribution
contribution
### 5.1 GET query all contribution
query all contribution
```
Resource URI: edgegallery/atp/v1/contribution
```

Example response:
```
200 OK
[
  {
    "id": "872b55f8-bfb8-4fb4-be4e-0b643ff375e2",
    "name": "test",
    "objective": "test",
    "step": "test",
    "expectResult": "test",
    "type": "text",
    "createTime": "2021-03-01T09:17:31.915+0000"
  }
]

```

### 5.2 POST create contribution
create contribution
```
Resource URI: edgegallery/atp/v1/contribution
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|name|name|request param|yes|
|objective|objective|request param|no|
|step|step|request param|yes|
|expectResult|expectResult|request param|no|
|type|type|request param|yes|
|file|file|requestpart|yes|

Example response:
```
200 OK
  {
    "id": "872b55f8-bfb8-4fb4-be4e-0b643ff375e2",
    "name": "test",
    "objective": "test",
    "step": "test",
    "expectResult": "test",
    "type": "text",
    "createTime": "2021-03-01T09:17:31.915+0000"
  }
```

## 6. File
file
### 6.1 GET query one file
query one file
```
Resource URI: edgegallery/atp/v1/file/{id}
```
|Name|Definition|type|Required|
|-------------|-------------|------------|------------|
|id|id|path param|yes|
|type|type|query param|no|

Example response:
```
200 OK
binary stream
```