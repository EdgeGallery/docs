K8s Plugin Database Design
===============

The K8sPlugin database uses an open source PostegreSQL database, and the recommended version is 12.2. One database
 table currently designed and applied:
 
- app_instance_info_record: MECM LcmController Database Design.mdStore app information, such as appInsId, hostIp and
 workloadId.
```
CREATE TABLE app_instance_info_record (
    	APPINSID               VARCHAR(200)       NOT NULL,
    	HOSTIP                 VARCHAR(200)       NULL,
    	WORKLOADID             VARCHAR(200)       NULL,
    	CONSTRAINT app_info_record_pkey PRIMARY KEY (APPINSID)
    );
```