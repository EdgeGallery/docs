K8s plugin Interfaces
==============
The document is for the K8s plugin project.

### InstantiateRequest

Application instantiated

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|
|package|bytes|required|Valid UUID without hypen|
|ak|string|required|Alphanumeric characters|
|sk|string|required|Alphanumeric characters|

### InstantiateResponse

Represents the InstantiateRequest status.

|Field|Type|Label|Description
|---|---|---|---|
|status|string|required|Status of the instantiate request|

### TerminateRequest

Terminates application instance id

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|

### TerminateResponse

Represents the TerminateRequest status.

|Field|Type|Label|Description
|---|---|---|---|
|status|string|required|Status of the terminate request|

### QueryRequest

Get statistics information 

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|

### QueryResponse 

Represents the QueryRequest status.

|Field|Type|Label|Description
|---|---|---|---|
|status|string|required|Status of the Query request|


### UploadCfgRequest

Upload Config File

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|hostIp|string|required|Valid IP|
|configFile|formData|required|Provide valid config file|

### UploadCfgResponse

Represents the UploadCfgRequest status.

|Field|Type|Label|Description
|---|---|---|---|
|status|string|required|Status of the UploadCfgRequest|

### RemoveCfgRequest

Removes the config file 

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|hostIp|string|required|Valid IP|

### RemoveCfgResponse

|Field|Type|Label|Description
|---|---|---|---|
|status|string|required|Status of the RemoveCfgRequest|

### AppLCM Service

Service for handling requests.

|Method Name|Request Type|Response Type|Description|
|---|---|---|---|
|instantiate|InstantiateRequest|InstantiateResponse|Instantiate application|
|terminate|TerminateRequest|TerminateResponse|Terminate application|
|query|QueryRequest|QueryResponse|Query application|
|uploadConfig|UploadCfgRequest|UploadCfgResponse|Upload file configuration|
|removeConfig|RemoveCfgRequest|RemoveCfgResponse|Remove file configuration|
