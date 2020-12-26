## providerApp注册到MEP
providerApp启动的时候注册到MEP，使用mep-agent可以自动注册，不用关心细节
## consumerApp服务调用providerApp
### 1.consumerApp获取token接口
app在pod内部调用自己的mep-agent获取token，app调用MEP接口时header中必须添加token信息，否则会报没权限的错误
```
url: http://localhost:8080/mep-agent/v1/token
method: GET
response: {"access_token":"eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MDg3OTM1NjAuMzM4NzM1LCJpc3MiOiJtZXBhdXRoIiwic3ViIjoiNDdlOTg4MGItYzMyNy00NmI0LTg3MWYtMzY5NDU3NDJjZDIyIiwiY2xpZW50aXAiOiIyMDAuMS4xLjIifQ.mIlkBxTL_HRPiwreGXS_Cd1yAJd194nDo7MgOF4aDjuo2qVGQ5-U4Gk10vfVqEBmfSZzN6cCVwQimCuyUs4n0hn_HdqpUIZVtBf_ISuXe8EN4RGBrqU2woEYYAcXqg4Fawet8t7ZSZlldcHrfWPL2zcB2kAGloR2QFMS7vRY5nSlXXmt5-LEi7_uaJPtYcwknT2iHzrdxZp-GJmEW-SqebxQWObD58SQMgOqC-SITIe-bizMnKU8rJMCXsvs8-3IK2Mwe76mmaAEo1iL2JpYuqnUzA9CTmo0dJZ8ZaZTAKrUx6P7mlOu7IMP8dpOiYbpOOxFqa4UgH4w4DZHiDqTdA","token_type":"Bearer","expires_in":3600}
```
响应包含token的值、token类型和有效期
### 2.consumerApp服务发现接口
consumerApp通过服务发现接口获取providerApp的endpoint信息，header里面添加获取到的token值
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
响应中关注transportInfo->endpoint->uris[0]的值
```
### 3.consumerApp调用providerApp的接口
consumerApp使用服务发现接口获取的providerApp的endpoint信息，调用providerApp，header中添加获取到的token的值，body添加调用providerApp需要的参数
```
url: "https://mep-api-gw.mep:8443/FaceRegService8d025f7b745b211eba564/providerAppurl"
method: 
header: {"Authorization": "Bearer eyJhbGciOiJSUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MDg3OTQzMjIuNTQxMzYwOSwiaXNzIjoibWVwYXV0aCIsInN1YiI6IjVhYmU0NzgyLTJjNzAtNGU0Ny05YTRlLTBlZTNhMWEwZmQxZiIsImNsaWVudGlwIjoiMTU5LjEzOC4xMzAuMTU2In0.RL8VOODpzpGipxbqL1MOOmb0wIcVV1Gsh9zMhp8gxCf2N725sbBtmq_P5UCAF8_F7ub6Ehgw0u906NrOQymhdYxuM9GaAAj2ReVxSGYAMsY-rZl8XEkR_SLL2CZHK2vmaT0G7CgsWyrMOkUd8k5SyJ4jCqzrSiPcoC3ECNwIDJwcNmu8ET2OWnRyi53Ef4dbxL9iWtRUEjh9xuNMl4vxF3y3xvo_Li6SCfY0AHN6vdJCcejHXXPbSqcP9gPfVr0jkNwfbA3-ZoirM80JEjIiguDfqlD23tSLwa2GOZ09xrG34Ak8fp_mnDLG6f8jBzi7kt-14vZr4uHRqYhhT9FvFA"}
body:
respponse: 
```
响应为providerApp的接口返回


