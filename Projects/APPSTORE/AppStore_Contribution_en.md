# How to contribute

This article will show users how to participate in the contribution of the AppStore project. The content is divided into two parts, which will respectively introduce how to build a local development environment and AppStore operation guidance.

## Build a local development environment-Release 1.2

This section will guide users how to build AppStore-be and AppStore-fe modules locally to help developers quickly understand and develop code.

The local startup of AppStore-be depends on:
```
- Service center
- DataBase
- User Management
```
The local startup of AppStore-fe depends on:
```
- Website Gateway
- User Management
- AppStore-be
```
So in order to build a local development environment, the final startup sequence is Service Center -> DataBase -> UserManagement -> AppStore-be -> WebsiteGateway(AppStore-fe).

### Service Center

1. Download [Service Center](http://servicecomb.apache.org/cn/release/service-center-downloads/)

   ![](/uploads/images/2020/0908/153700_b069cf5f_7625245.jpeg "service center1.jpg")

2. Run start-service-center.bat and start-frontend.bat after decompression

   ![](/uploads/images/2021/cor2020/153735_4dafd335_7625245.jpeg "service center2.jpg")

### DataBase

1. Download, install, and start Postgresql 12.2

2. Set the login name and password, such as postgresql/root

3. Create a database named appstoredb

   ![](/uploads/images/2021/cor2020/153833_89c54e53_7625245.jpeg "db1.jpg")

4. Create a database named usermgmtdb

### User Management

1. Download user-mgmt-be code and user-mgmt-fe code

2. Install node.js and npm, enter the user-mgmt-fe folder, run `npm install`and`npm run build`

3. Create a static folder in the src/main/resources/ folder of user-mgmt-be

4. Copy the contents of the dist folder compiled by user-mgmt-fe to the static folder of user-mgmt-be

5. Configure the runtime environment variables of MainServer in the compiler (here, taking IDEA as an example)

   ![](/uploads/images/2021/cor2020/154011_896d887f_7625245.jpeg "usermgmt1.jpg")

6. Run the MainServer function and start UserManagement

### AppStore-be

1. Download the appstore-be code

2. Modify the /src/main/resources/application.yaml file in appstore-be `servicecomb.rest.address`to`127.0.0.1:8099`

3. Configure the runtime environment variables of MainServer in the compiler (here, taking IDEA as an example)

   ![](/uploads/images/2021/cor2020/154023_9c49d20c_7625245.jpeg "appstore-be1.jpg")

4. Run the MainServer function and start appstore-be

### AppStore-fe

1. Download the appstore-fe code

2. Enter the appstore-fe folder, run `npm install`and`npm run build`

3. Download the website-gateway code

4. Create a static folder in the src/main/resources/ folder of website-gateway

5. Copy the contents of the dist folder compiled by appstore-fe to the static folder of website-gateway

6. Modify the /src/main/resources/application.yaml file in website-gateway `server.port`to `8080`( `OAUTH_APPSTORE_CLIENT_URL`consistent with the port in the variable filled in when usermgmt is started )

7. Configure the runtime environment variables of GatewayApplication in the compiler (here in IDEA as an example)

   ![](/uploads/images/2021/cor2020/154035_12e727fc_7625245.jpeg "appstore-fe1.jpg")

8. Run GatewayApplication to start WebsiteGateway and AppStore-fe, and the browser can visit http://127.0.0.1:8080/ to access the AppStore homepage

##  Operation guidance

AppStore is a market for developers to publish and launch App applications. Edge applications developed by the Developer platform can be directly shared to the AppStore application store after testing. You can also directly upload application packages that comply with the platform specifications, and the application package file type is csar. One APP corresponds to multiple packages, and users can directly download the latest version of the APP or download the specified version of the package.

###  Log in to the application platform

After entering the website, the default is the guest user and can view the information. If you want to perform more operations (such as uploading an application), you need to register an account. After the registration is completed, you can enter the home page of the application platform after logging in with the account:
![](/uploads/images/2021/appstore/guest_en.png "1.1")
![](/uploads/images/2021/appstore/register_user_en.png "1.2")
![](/uploads/images/2021/appstore/login_en.png "1.3")
![](/uploads/images/2021/appstore/login_appstore_en.png "1.4")

###  View application

1. Click on the application to view the application details. The details interface displays basic information such as application version, industry, type, etc. The specific introduction is displayed on the lower side. In the operation on the right side of the basic information, the download button on the right has permission settings and can only download packages uploaded by yourself. Administrator users can download all published packages and packages uploaded by themselves.

2. If you need to comment on the APP, you can enter the comment in the comment area, set the rating, and click the button with the left mouse button, and the comment submission is successful.

   ![](/uploads/images/2021/appstore/app_detail_en.png "2.1")
   ![](/uploads/images/2021/appstore/comment_en.png "2.2")
   ![](/uploads/images/2021/appstore/comments_en.png "2.3")

###  Publish the application

1. Upload the APP, open the main interface of the APP Store, click the upload icon on the right to open the upload APP dialog box. In the upload dialog box, select the APP to be uploaded, upload or select the APP icon provided by the system by default, select the APP industry, type, and architecture, fill in a brief description of the APP, and click OK to complete the upload.
   ![](/uploads/images/2021/appstore/upload_en.png "3.1")

2. After the application is uploaded, it will automatically jump to the My Application interface. The uploaded application needs to pass the platform's atp test before it can be published to the warehouse. My application is the basic information of the uploaded package. The right side of the form is the basic operation. Click the test button to start creating a test task. The page is a nested atp test page. Click the start test button to resolve the package dependencies, you can see When you reach the number of specific test cases, click OK to start the test. The page is the test progress page, you can return to the My Application page and wait for the test to complete.
   ![](/uploads/images/2021/appstore/totest_en.png "3.2")
   ![](/uploads/images/2021/appstore/test_task_en.png "3.3")
   ![](/uploads/images/2021/appstore/test_success_en.png "3.4")

3. The application can only be published when the test status in my application is Test_success (that is, the test is successful). Click the publish button on the right. After the publishing is successful, you can see the application you uploaded on the homepage.
   ![](/uploads/images/2021/appstore/topublish_en.png "3.5")

   ![](/uploads/images/2021/appstore/published_en.png "3.6")

###  Share application

1. Application sharing navigation is divided into external application warehouse management, application promotion, application pull, message center and operation analysis.
   ![](/uploads/images/2021/appstore/app_share_en.png "4.1")

2. External application warehouse management page, you can add, modify and delete warehouses.
   ![](/uploads/images/2021/appstore/third_appstores_en.png "4.2")

3. Click the application push menu under the application sharing main menu to view the application information that can be pushed, select the application that needs to be pushed to the operator or a third party, and open the application push operation dialog box. Click the execute button in the lower left corner of the push operation dialog box to trigger the push task, and then view the results of the application pushed to the operator or a third party.
   ![](/uploads/images/2021/appstore/topush_en.png "4.3")
   ![](/uploads/images/2021/appstore/pushed_en.png "4.4")

4. Click the application pull menu under the application sharing main menu to view the application information that can be pulled from each external warehouse, and select the applications that need to be pulled for batch pull.
   ![](/uploads/images/2021/appstore/topull_en.png "4.5")
   ![](/uploads/images/2021/appstore/pulled_en.png "4.6")

5. Click the message center menu under the main menu of application sharing to view the notification information, and you can accept APP information that needs to be pushed from different operators. You can pull (download) the information of the application by clicking the receive button in the upper right corner of the right panel of the message center. The successfully pulled APP can be viewed on the "My Application" interface. Click the delete button to delete the message. Double-click to delete the message. View the message details.
   ![](/uploads/images/2021/appstore/messages_en.png "4.7")
   ![](/uploads/images/2021/appstore/message_detail_en.png "4.8")

6. After the application is successfully pushed, switch to the operation analysis tab on the right, and view the corresponding information in the operation analysis interface. At the same time, the operation analysis interface can view different operations such as pull, download, notification, push and other types of messages.
   ![](/uploads/images/2021/appstore/operations_en.png "4.9")

