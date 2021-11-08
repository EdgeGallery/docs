Lcm Controller Database Design
===============
The LcmController database uses an open source PostgreSQL database, and the recommended version is 12.2. Two database
 tables currently designed and applied:
                                    
- app_info_record: Store app information, such as appInsId, hostIp, deployType, appPackageId, appName, Origin,
 SyncStatus and tenantId.
```
CREATE TABLE app_info_record (
    	APPINSID               VARCHAR(200)       NOT NULL,
    	MECHOST                VARCHAR(200)       NULL,
    	DEPLOYTYPE             VARCHAR(200)       NULL,
    	TENANTID               VARCHAR(200)       NULL,
    	CONSTRAINT app_info_record_pkey PRIMARY KEY (APPINSID),
        APPPACKAGEID           VARCHAR(200)      NULL,
        APPNAME                VARCHAR(200)      NULL,
        ORIGIN                 VARCHAR(200)      NULL,
        SYNCSTATUS             VARCHAR(200)      NULL
    );
```
- tenant_info_record: Store tenant information, such as tenantId.
```
CREATE TABLE tenant_info_record (
    	TENANTID               VARCHAR(200)       NOT NULL,
    	CONSTRAINT tenant_info_record_pkey PRIMARY KEY (TENANTID)
    );
```
- mec_host: Store mec host information, such as mecHostId, mecHostIp, mecHostName, zipCode, city, address, affinity
 UserName, configUploadStatus, coordinates, vim, origin and syncStatus
```
CREATE TABLE mec_host (
	MECHOSTID               VARCHAR(200)       NOT NULL,
	MECHOSTIP               VARCHAR(200)       NULL,
	MECHOSTNAME             VARCHAR(200)       NULL,
	ZIPCODE                 VARCHAR(200)       NULL,
	CITY                    VARCHAR(200)       NULL,
	ADDRESS                 VARCHAR(200)       NULL,
	AFFINITY                VARCHAR(200)       NULL,
	USERNAME                VARCHAR(200)       NULL,
	CONFIGUPLOADSTATUS      VARCHAR(200)       NULL,
	COORDINATES             VARCHAR(200)       NULL,
	VIM                     VARCHAR(200)       NULL,
	ORIGIN                  VARCHAR(200)       NULL,
	SYNCSTATUS              VARCHAR(200)       NULL,
    CONSTRAINT mec_host_pkey PRIMARY KEY (MECHOSTID)	
);
```
- mec_hw_capability: Store mec hardware capability information, such as MecCapabilityId, hwType, hwVendor and hwModel
```
CREATE TABLE mec_hw_capability (
	MECCAPABILITYID VARCHAR(200)       NOT NULL,
	HWTYPE          VARCHAR(200)       NULL,
	HWVENDOR        VARCHAR(200)       NULL,
	HWMODEL         VARCHAR(200)       NULL
);
```
- app_instance_stale_rec: Store app instance stale record information, such as appInstanceId and tenantId
```
CREATE TABLE app_instance_stale_rec (
	APPINSTANCEID VARCHAR(200)       NOT NULL,
	TENANTID      VARCHAR(200)       NULL
);
```
- mec_host_stale_rec: Store mec host stale record information, such as mecHostId
```
CREATE TABLE mec_host_stale_rec (
	MECHOSTID VARCHAR(200)       NOT NULL,
);
```
- app_package_record: Store app package record information, such as appPkgId, appPkgName, appPkgVersion, appPkgPath,
  appPkgProvider, appPkgDesc, appPkgAffinity, appIconUrl, appId, tenantId, packageId, origin and syncStatus
```  
CREATE TABLE app_package_record (
	APPPKGID       VARCHAR(200)       NOT NULL,
	APPPKGNAME     VARCHAR(200)       NULL,
	APPPKGVERSION  VARCHAR(200)       NULL,
	APPPKGPATH     VARCHAR(200)       NULL,
	APPPROVIDER    VARCHAR(200)       NULL,
	APPPKGDESC     VARCHAR(200)       NULL,
	APPPKGAFFINITY VARCHAR(200)       NULL,
	APPICONURL     VARCHAR(200)       NULL,
	APPID          VARCHAR(200)       NULL,
	TENANTID       VARCHAR(200)       NULL,
	PACKAGEID      VARCHAR(200)       NULL,
	ORIGIN         VARCHAR(200)       NULL,
	SYNCSTATUS     VARCHAR(200)       NULL
	);
```
- app_package_host_record: Store app package host record information, such as pkgHostKey, hostIp, appPkgId, status, 
  tenantId, error, origin and syncStatus
```  
CREATE TABLE app_package_host_record  {
	PKGHOSTKEY VARCHAR(200)       NOT NULL,
	HOSTIP     VARCHAR(200)       NULL,
	APPPKGID   VARCHAR(200)       NULL,
	STATUS     VARCHAR(200)       NULL,
	TENANTID   VARCHAR(200)       NULL,
	ERROR      VARCHAR(200)       NULL,
	ORIGIN     VARCHAR(200)       NULL,
	SYNCSTATUS VARCHAR(200)       NULL
    );
```
- app_package_stale_rec: Store app package stale record information, such as appPkgId and tenantId
```
CREATE TABLE app_package_stale_rec (
	APPKGID      VARCHAR(200)       NOT NULL,
	TENANTID     VARCHAR(200)       NULL
   );
```
- app_package_host_stale_rec: Store app package stale record information, such as pacakgeId, tenantId and hostIp
```
CREATE TABLE app_package_host_stale_rec (
	PACKAGEID      VARCHAR(200)       NOT NULL,
	TENANTID       VARCHAR(200)       NULL,
	HOSTIP         VARCHAR(200)       NULL
    );
```
- edge_authenticate_rec: Store edge authenticate record information, such as authenticateId, name and key
```
CREATE TABLE edge_authenticate_rec (
	AUTHENTICATEID  VARCHAR(200)       NOT NULL,
	NAME            VARCHAR(200)       NULL,
	KEY             VARCHAR(200)       NULL
   );
```