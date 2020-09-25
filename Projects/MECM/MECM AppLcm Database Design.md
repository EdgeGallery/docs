Database Design

The LcmController database uses an open source PostgreSQL database, and the recommended version is 12.2. Two database
 tables currently designed and applied:
                                    
. app_info_record: Store app information, such as appInsId, hostIp, deployType and tenantId.

CREATE TABLE app_info_record (
    	APPINSID               VARCHAR(200)       NOT NULL,
    	HOSTIP                 VARCHAR(200)       NULL,
    	DEPLOYTYPE             VARCHAR(200)       NULL,
    	TENANTID               VARCHAR(200)       NULL,
    	CONSTRAINT app_info_record_pkey PRIMARY KEY (APPINSID)
    );

. tenant_info_record: Store tenant information, such as tenantId.

CREATE TABLE app_info_record (
    	TENANTID               VARCHAR(200)       NOT NULL,
    	CONSTRAINT app_info_record_pkey PRIMARY KEY (TENANTID)
    );

The K8sPlugin database uses an open source PostegreSQL database, and the recommended version is 12.2. One database
 table currently designed and applied:
 
. app_instance_info_record: MECM LcmController Database Design.mdStore app information, such as appInsId, hostIp and workloadId.

CREATE TABLE app_instance_info_record (
    	APPINSID               VARCHAR(200)       NOT NULL,
    	HOSTIP                 VARCHAR(200)       NULL,
    	WORKLOADID             VARCHAR(200)       NULL,
    	CONSTRAINT app_info_record_pkey PRIMARY KEY (APPINSID)
    );
