��          t               �      �   �   �      �  j   �  u   U     �  h   �  "   8  Z   [  &   �  �  �     i  �   l     ,  V   K  u   �       j     $   �  Z   �  &   	   ); APPINSID               VARCHAR(200)       NOT NULL, HOSTIP                 VARCHAR(200)       NULL, DEPLOYTYPE             VARCHAR(200)       NULL, TENANTID               VARCHAR(200)       NULL, CONSTRAINT app_info_record_pkey PRIMARY KEY (APPINSID) Lcm Controller Database Design TENANTID               VARCHAR(200)       NOT NULL, CONSTRAINT app_info_record_pkey PRIMARY KEY (TENANTID) The LcmController database uses an open source PostgreSQL database, and the recommended version is 12.2. Two database ``` ``` - tenant_info_record: Store tenant information, such as tenantId. ``` CREATE TABLE app_info_record ( ``` CREATE TABLE app_info_record ( app_info_record: Store app information, such as appInsId, hostIp, deployType and tenantId. tables currently designed and applied: Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-04-12 10:35+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.0
 ); APPINSID VARCHAR (200) NOT NULL, HOSTIP VARCHAR (200)       NULL, DEPLOYTYPE VARCHAR (200)       NULL, TENANTID VARCHAR (200)       NULL, CONSTRAINT app_info_record_key PRIMARY KEY (APPINSID) Lcm Controller Database Design TENANTID VARCHAR (200) NOT NULL, CONSTRAINT app_info_record_key PRIMARY KEY (TENANTID) The LcmController database uses an open source PostgreSQL database, and the recommended version is 12.2. Two database ` ` ` ` ` - tenant_info_record: Store tenant information, such as tenantId. ` ` ` CREATE TABLE app_info_record ( ` ` ` CREATE TABLE app_info_record ( app_info_record: Store app information, such as appInsId, hostIp, deployType and tenantId. tables currently assigned and applied: 