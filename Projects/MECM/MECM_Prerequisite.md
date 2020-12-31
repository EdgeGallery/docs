Prerequisite
============

### Service Center

1、Download [Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2、Run start-service-center.sh  and start-frontend.sh

![](/uploads/images/2020/0924/service-comb.png "service-comb.png")

### UserManagement

1. Download [user-mgmt-be code](https://gitee.com/edgegallery/user-mgmt/)

2. Configure the runtime environment variables of MainServer in the compiler (here in IDEA as an example)

![](/uploads/images/2020/0924/mecm-usr-env.png.png "mecm-usr-env.png.png")

3. Run the MainServer function and start UserManagement

4. Download the [jwt token generation script](https://gitee.com/edgegallery/docs/blob/master/Projects/MECM/MECM_Jwt_Token_Generation.sh) and need to give rsa private key and payload file path in the
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

5. Generate the jwt token and can be used to test the api.