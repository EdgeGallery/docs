### 打包可执行文件
1. git clone mep-agent的代码

```
git clone https://gitee.com/edgegallery/mep-agent.git
```
2. 编译打包成可执行文件

如果是windows环境打包linux可执行文件，需要设置GOOS

```
set GOOS=linux
```
在mep-agent目录下执行go build命令，当前dockerfile使用的go version为1.14.2，如果是1.16版本命令参数会不一样
```
# go version go1.14.2 windows/amd64
go build -buildmode=pie -ldflags '-linkmode "external" -extldflags "-static"' src/main/main.go

# go version go1.16.2 windows/amd64
go build -buildmode=pie -ldflags '-linkmode="external"' src/main/main.go
```

### 设置环境变量

vi /etc/profile 添加下面的环境变量，环境变量的值根据实际环境的值修改
```
export MEP_IP=192.168.100.177
export MEP_APIGW_PORT=30443
export AK=QVUJMSUMgS0VZLS0tLS0
export SK=DXPb4sqElKhcHe07Kw5uorayETwId1JOjjOIRomRs5wyszoCR5R7AtVa28KT3lSc
export APPINSTID=5abe4782-2c70-4e47-9a4e-0ee3a1a0fd1f
export CA_CERT_DOMAIN_NAME=edgegallery
```
wq保存后，source /etc/profile生效


### 运行程序
虚拟机创建/usr/mep目录，创建/usr/mep/log/mep-agent.log日志文件，拷贝代码中的conf、views目录到/usr/mep下，拷贝可执行文件到此目录（没有指定名词则为main）

设置可执行权限

```
chmod 550 main
```
执行可执行文件

```
root@test-os:/usr/mep# ./main
2021/05/12 15:16:21.067 [I]  http server Running on http://:8080

```
**如果修改启动的端口，需要添加app.conf配置文件指定端口**

```
appname = mep-agent
httpport = 8080
runmode = prod
```



