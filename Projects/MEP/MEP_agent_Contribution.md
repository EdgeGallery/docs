Contribution to mep-agent
==========================

This section provides details on how to participate/contribute to the mep-agent project. 

## Build local development environment

This section will guide developers to build mep-agent module locally and help developers to quickly understand and
 develop code 

- Clone mep-agent code
- Open folder by goland
- Configure the runtime environment variables</br>
MEP_IP=192.168.100.177;
MEP_APIGW_PORT=30443;
AK=QVUJMSUMgS0VZLS0tLS0;
SK=DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc;
APPINSTID=5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f;
CA_CERT_DOMAIN_NAME=edgegallery</br>

![](/uploads/images/2021/mep/mep-agent_config_env_variables.png "env variables")

- Run main.go to start mep-agent
- After start, can call the api by postman