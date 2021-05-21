# How to run?

## Download and unzip token-generator.zip

## Set the below env variables using the correct ip
```
export AK=QVUJMSUMgS0VZLS0tLS0
export SK=DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc
export APPINSTID=5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f
export CA_CERT=./ca.crt
export MEP_IP=127.0.0.1
export MEP_APIGW_PORT=30443
export MEP_AUTH_ROUTE=mepauth
export ENABLE_WAIT=true
export CA_CERT_DOMAIN_NAME=edgegallery
```

## Run the token generator
If the MEP version is 1.0.1 and before use token_generator
```
./token_generator 
```
If the MEP version is after 1.0.1 use token_generator_url_unify
```
./token_generator_url_unify 
```
签名（Authorization）和token都可以通过日志看到
![输入图片说明](https://images.gitee.com/uploads/images/2021/0204/165822_77d3c5d4_4991354.png "屏幕截图.png")

# How to modify token-generator code

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

request.go
```
	req.Header.Set("Authorization", authorization)
	log.Info("Authorization : ", authorization) // add
	log.Info("PostRegisterRequest : ", req) // add
```
# How to build token-generator 

```
set GOOS=linux
go build -o token_generator -ldflags "-s -w" main.go
```





