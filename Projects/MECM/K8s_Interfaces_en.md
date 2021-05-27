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
|parameters|key value pair|No|Instantiation parameters, key-value pairs

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


### CreateVmImageRequest

Create VM image request 

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|
|vmId|string|required|Valid UUID|


### CreateVmImageResponse

|Field|Type|Label|Description
|---|---|---|---|
|response|string|required|response of the CreateVmImageResponse|


### QueryVmImageRequest

Query VM image request 

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|
|imageId|string|required|Valid UUID|

### QueryVmImageResponse

|Field|Type|Label|Description
|---|---|---|---|
|response|string|required|response of the QueryVmImageResponse|


### DeleteVmImageRequest

Delete VM image request 

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|
|imageId|string|required|Valid UUID|


### DeleteVmImageResponse

|Field|Type|Label|Description
|---|---|---|---|
|response|string|required|response of the DeleteVmImageResponse|


### DownloadVmImageRequest

Download VM image request 

|Field|Type|Label|Description
|---|---|---|---|
|accessToken|string|required|Provide the required access token|
|appInstanceId|string|required|Valid UUID|
|hostIp|string|required|Valid IP|
|imageId|string|required|Valid UUID|
|chunkNum|int32|required|Valid integer|


### DownloadVmImageResponse

|Field|Type|Label|Description
|---|---|---|---|
|content|byte|required|response of the DownloadVmImageResponse|


### AppLCM Service

Service for handling requests.

|Method Name|Request Type|Response Type|Description|
|---|---|---|---|
|instantiate|InstantiateRequest|InstantiateResponse|Instantiate application|
|terminate|TerminateRequest|TerminateResponse|Terminate application|
|query|QueryRequest|QueryResponse|Query application|
|uploadConfig|UploadCfgRequest|UploadCfgResponse|Upload file configuration|
|removeConfig|RemoveCfgRequest|RemoveCfgResponse|Remove file configuration|
