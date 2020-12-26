# EdgeGallery生态能力调用指导

EdgeGallery作为5G MEC开源平台，将始终开放5G能力和生态能力。用户在进行应用开发时，可以参考本文调用EdgeGallery生态能力。
这里我们将提供生态能力的应用称为 provider app，将调用生态能力的应用称为 consumer app，具体流程请参考如下步骤：

## 1 provider app 提供生态能力
在提供生态能力前，provider app 需要先将自身服务注册到MEP（实现服务注册接口），provider app 可以通过MEP-Agent自动注册，也可以自身实现服务注册接口。
通过EdgeGallery开发者平台进行部署测试的app无需关注 provider app 的服务注册，平台会自动为用户实现 provider app 的部署与服务注册。

## 2 consumer app 调用 provider app 能力
consumer app 在调用 provider app 提供的能力时，需要通过EdgeGallery MEP模块进行服务发现以及请求的转发，并且在与MEP进行业务交互时需要携带身份认证信息（token）。
EdgeGallery推荐 consumer app 使用MEP-Agent进行token的获取，便于应用进行自身的服务注册与成为生态应用。

### 2.1 consumer app 获取token
consumer app 在编写部署文件时需要注入MEP-Agent的信息，从而可以在pod内部调用MEP-Agent的接口获取token。consumer app 调用MEP接口时header中必须添加token信息，否则会提示无权访问。

在部署时注入MEP-Agent信息后，consumer app 可以直接访问如下接口获取token，其中token_type是token类型，access_token是token的值。在携带token时需要以 "token_type" + "空格" + "access_token" 的形式组合使用。
```
url: http://localhost:8080/mep-agent/v1/token
method: GET
response: {"access_token":"eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MDg3OTM1NjAuMzM4NzM1LCJpc3MiOiJtZXBhdXRoIiwic3ViIjoiNDdlOTg4MGItYzMyNy00NmI0LTg3MWYtMzY5NDU3NDJjZDIyIiwiY2xpZW50aXAiOiIyMDAuMS4xLjIifQ.mIlkBxTL_HRPiwreGXS_Cd1yAJd194nDo7MgOF4aDjuo2qVGQ5-U4Gk10vfVqEBmfSZzN6cCVwQimCuyUs4n0hn_HdqpUIZVtBf_ISuXe8EN4RGBrqU2woEYYAcXqg4Fawet8t7ZSZlldcHrfWPL2zcB2kAGloR2QFMS7vRY5nSlXXmt5-LEi7_uaJPtYcwknT2iHzrdxZp-GJmEW-SqebxQWObD58SQMgOqC-SITIe-bizMnKU8rJMCXsvs8-3IK2Mwe76mmaAEo1iL2JpYuqnUzA9CTmo0dJZ8ZaZTAKrUx6P7mlOu7IMP8dpOiYbpOOxFqa4UgH4w4DZHiDqTdA","token_type":"Bearer","expires_in":3600}
```

### 2.2 consumer app 获取 provider app 的endpoint信息
consumer app 通过MEP的服务发现接口获取 provider app 的endpoint信息，为下一步调用 provider app 的生态能力做准备。在调用服务发现接口时，需要将获取的token组织好，填充请求头的"Authorization"字段。
返回值中关注 transportInfo->endpoint->uris[0] 的值，它将作为 provider app 的endpoint信息进行使用。

```
url: https://mep-api-gw.mep:8443/mepserver/mec_service_mgmt/v1/services?ser_name=
method: GET
header: {"Authorization": "Bearer eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MDg3OTQzMjIuNTQxMzYwOSwiaXNzIjoibWVwYXV0aCIsInN1YiI6IjVhYmU0NzgyLTJjNzAtNGU0Ny05YTRlLTBlZTNhMWEwZmQxZiIsImNsaWVudGlwIjoiMTU5LjEzOC4xMzAuMTU2In0.RL8VOODpzpGipxbqL1MOOmb0wIcVV1Gsh9zMhp8gxCf2N725sbBtmq_P5UCAF8_F7ub6Ehgw0u906NrOQymhdYxuM9GaAAj2ReVxSGYAMsY-rZl8XEkR_SLL2CZHK2vmaT0G7CgsWyrMOkUd8k5SyJ4jCqzrSiPcoC3ECNwIDJwcNmu8ET2OWnRyi53Ef4dbxL9iWtRUEjh9xuNMl4vxF3y3xvo_Li6SCfY0AHN6vdJCcejHXXPbSqcP9gPfVr0jkNwfbA3-ZoirM80JEjIiguDfqlD23tSLwa2GOZ09xrG34Ak8fp_mnDLG6f8jBzi7kt-14vZr4uHRqYhhT9FvFA"}
response: [
    {
        "serInstanceId": "54535ad49a6d62060ca0261d075817ae",
        "serName": "FaceRegService8",
        "serCategory": {
            "href": "/example/catalogue1",
            "id": "id12345",
            "name": "RNI",
            "version": "1.2.3"
        },
        "version": "4.5.8",
        "state": "ACTIVE",
        "transportId": "Rest1",
        "transportInfo": {
            "id": "TransId12345",
            "name": "REST",
            "description": "REST API",
            "type": "REST_HTTP",
            "protocol": "HTTP",
            "version": "2.0",
            "endpoint": {
                "uris": [
                    "https://mep-api-gw.mep:8443/FaceRegService8d025f7b745b211eba564"
                ],
                "addresses": null,
                "alternative": null
            },
            "security": {
                "oAuth2Info": {
                    "grantTypes": [
                        "OAUTH2_CLIENT_CREDENTIALS"
                    ],
                    "tokenEndpoint": "/mecSerMgmtApi/security/TokenEndPoint"
                }
            }
        },
        "serializer": "JSON",
        "scopeOfLocality": "MEC_SYSTEM",
        "isLocal": true,
        "livenessInterval": 0,
        "_links": {
            "self": {}
        }
    }
]

```
### 2.3 consumer app 调用 provider app 生态能力
consumer app 拼接获取到的 provider app 的endpoint信息和 provider app 的业务url，通过此url可以调用 provider app 提供的生态能力，同时在调用时需要携带获取的token。

```
url: "https://mep-api-gw.mep:8443/FaceRegService8d025f7b745b211eba564/provider-app-url"
method: 
header: {"Authorization": "Bearer eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MDg3OTQzMjIuNTQxMzYwOSwiaXNzIjoibWVwYXV0aCIsInN1YiI6IjVhYmU0NzgyLTJjNzAtNGU0Ny05YTRlLTBlZTNhMWEwZmQxZiIsImNsaWVudGlwIjoiMTU5LjEzOC4xMzAuMTU2In0.RL8VOODpzpGipxbqL1MOOmb0wIcVV1Gsh9zMhp8gxCf2N725sbBtmq_P5UCAF8_F7ub6Ehgw0u906NrOQymhdYxuM9GaAAj2ReVxSGYAMsY-rZl8XEkR_SLL2CZHK2vmaT0G7CgsWyrMOkUd8k5SyJ4jCqzrSiPcoC3ECNwIDJwcNmu8ET2OWnRyi53Ef4dbxL9iWtRUEjh9xuNMl4vxF3y3xvo_Li6SCfY0AHN6vdJCcejHXXPbSqcP9gPfVr0jkNwfbA3-ZoirM80JEjIiguDfqlD23tSLwa2GOZ09xrG34Ak8fp_mnDLG6f8jBzi7kt-14vZr4uHRqYhhT9FvFA"}
body:
response: 
```

在以上流程的基础上 consumer app 能够通过EdgeGallery MEP模块调用 provider app 提供的所有生态能力。

