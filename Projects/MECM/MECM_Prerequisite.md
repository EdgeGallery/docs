Prerequisite
============

### Service Center

1、下载[Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2、解压后运行 start-service-center.bat  和  start-frontend.bat

![](/uploads/images/2020/0908/153735_4dafd335_7625245.jpeg "service center2.jpg")

### UserManagement

1. Download user-mgmt-be code and user-mgmt-fe code

2. Install node.js and npm, enter the user-mgmt-fe folder, run command npm install and npm run build

3. Create a static folder in the src/main/resources/ folder of user-mgmt-be

4. Copy the contents of the dist folder compiled by user-mgmt-fe to the static folder of user-mgmt-be

5. Configure the runtime environment variables of MainServer in the compiler (here in IDEA as an example)

![](/uploads/images/2020/0924/mecm-usr-env.png.png "mecm-usr-env.png.png")

6. Run the MainServer function and start UserManagement

7. Download the [jwt token generation script](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_Jwt_Token_Generation.sh) and need to give rsa private key and payload file path in the
   field provided.
   
Example Payload
```
[
  	"userName": "sample user name",
  	"userId": "example user id",
        "scope": "sample scope",
        "ssoSessionId": "ssoSession id to be given",
  	"authorities": [ Example of authorities to be given
  	],
  	"jti": "unique id",
  	"client_id": "enter client id"
]
```

8. Generate the jwt token and can be used to test the api.