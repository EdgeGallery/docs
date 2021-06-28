Features Design
======================
AppStore is the application warehouse module of EdgeGallery. It is mainly responsible for the storage and management of 5G edge applications. The current version has decentralized control, and different user roles contain different features.

Administrator users' features: application upload, application test, application publish, application query, application comment, download/delete all applications, external warehouse management, application push, application pull, message management, operation analysis, application management, sandbox management, application online experience, document center.

Tenant users' features: application upload, application test, application publish, application query, application comment, download/delete of this user application, application online experience, document center.

Guest user features: application query, document center.

|feature name|feature description|
|---|---|
|application upload|AppStore supports users to upload application packages.|
|application test|AppStore integrates the ATP test platform, users can test the application package through the ATP test platform after uploading the application package.|
|application publish|AppStore allows applications that have passed the ATP test to be published, and the published applications will be shown to all users.|
|application query|Users can view all published applications in the "App Warehouse", and view all applications uploaded by themselves on the "My App" page.|
|application comment|Users can comment and rate the apps they see in the "App Warehouse", but cannot comment on their own apps.|
|application download|Users can download application packages from AppStore, tenants can only download application packages uploaded by this user, and administrator users can download all published application packages and application packages uploaded by this user.|
|application delete|Users can delete application packages from AppStore, tenants can only delete application packages uploaded by this user, and administrator users can delete all published application packages and application packages uploaded by this user.|
|external warehouse management|Users can add, delete, modify and query external application warehouses.|
|application push|Users can push shared applications to the added external application warehouse.|
|application pull|Users can pull applications that are allowed to be shared from the added external application repositories to this repository.|
|message management|A message log will be recorded for the push, download and other operations performed by the user in the "App Share".|
|application get|The user can get the application from the received push message and upload it to the current platform.|
|application management|Users can manage recent popular applications, a list of applications that can be displayed in the application warehouse, and a list of applications that can be promoted.|
|sandbox management|Users can add, delete, modify and query the sandbox environment.|
|application online experience|Users can instantiate applications based on the existing sandbox environment for online experience.|
|document center|Users can learn about the main functions, interface specifications and application package specifications of appstore in the documentation center|

