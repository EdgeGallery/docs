Prerequisite
============

### UserManagement

1. Download user-mgmt-be code and user-mgmt-fe code

2. Install node.js and npm, enter the user-mgmt-fe folder, run and npm install npm run build

3. Create a static folder in the src/main/resources/ folder of user-mgmt-be

4. Copy the contents of the dist folder compiled by user-mgmt-fe to the static folder of user-mgmt-be

5. Configure the runtime environment variables of MainServer in the compiler (here in IDEA as an example)

![](/uploads/images/2020/0924/mecm-prerequisite.png "mecm-prerequisite.png")

6. Run the MainServer function and start UserManagement

7. Download the [jwt token generation script](MECM_Jwt_Token_Generation.sh) and need to give rsa private key and payload file path in the
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