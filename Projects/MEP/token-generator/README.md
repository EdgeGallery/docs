# How to run?

## Download and unzip token-generator.zip

## Set the below env variables using the correct ip
```
export AK=QVUJMSUMgS0VZLS0tLS0
export SK=DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc
export APPINSTID=5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f
export CA_CERT=./ca.crt
export MEP_IP=159.138.129.53
export MEP_APIGW_PORT=30443
export MEP_AUTH_ROUTE=mepauth
export ENABLE_WAIT=true
export CA_CERT_DOMAIN_NAME=edgegallery
```

## Run the token generator
```
./token_generator 
```
![token](https://images.gitee.com/uploads/images/2021/0204/161201_3db17e7c_4991354.png "token.png")

# How to modify token-generator

Token-generator is modified from mep-agent code. Only add log to record token and return after get token.

The change code as follows：

main.go
```
// start main service
//go service.BeginService().Start("./conf/app_instance_info.yaml") // remove
service.BeginService().Start("./conf/app_instance_info.yaml") // add
return // add
```

start.go
```
// service entrance
func (ser *Ser) Start(confPath string) {
	log.Info("start") // add
......
	util.FirstToken = true
	return // add
```

token.go
```
// Request token from mep_auth
func GetMepToken(auth model.Auth) error {
	log.Info("begin to get token from mep_auth") // add
......
	token := *&util.MepToken.AccessToken // add
	log.Infof("token: %s", token) // add
	log.Info("get token success.")
```




