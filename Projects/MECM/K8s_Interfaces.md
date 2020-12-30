K8s plugin Interfaces
==============
The document is for the K8s plugin project.

### AppLCM Service

Service for handling requests.

|Method Name|Request Type|Response Type|Description|
|---|---|---|---|
|instantiate|InstantiateRequest|InstantiateResponse|Instantiate application|
|terminate|TerminateRequest|TerminateResponse|Terminate application|
|query|QueryRequest|QueryResponse|Query application|
|uploadConfig|UploadCfgRequest|UploadCfgResponse|Upload file configuration|
|removeConfig|RemoveCfgRequest|RemoveCfgResponse|Remove file configuration|
