��    
      l               �      �   �   �      �  r   �       +     r   I  %   �     �  �  �     z  �   }       r   6     �  -   �  r   �  %   P     v   ); APPINSID               VARCHAR(200)       NOT NULL, HOSTIP                 VARCHAR(200)       NULL, WORKLOADID             VARCHAR(200)       NULL, CONSTRAINT app_info_record_pkey PRIMARY KEY (APPINSID) K8s Plugin Database Design The K8sPlugin database uses an open source PostegreSQL database, and the recommended version is 12.2. One database ``` ``` CREATE TABLE app_instance_info_record ( app_instance_info_record: MECM LcmController Database Design.mdStore app information, such as appInsId, hostIp and table currently designed and applied: workloadId. Project-Id-Version: EdgeGallery Documentation 
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
 ); APPINSID VARCHAR (200) NOT NULL, HOSTIP VARCHAR (200)       NULL, WORKLOADEID VARCHAR (200)       NULL, CONSTRAINT app_info_record_key PRIMARY KEY (APPINSID) K8s Plugin Database Design The K8sPlugin database uses an open source PostegreSQL database, and the recommended version is 12.2. One database ` ` ` ` ` ` CREATE TABLE app_instance_info_record ( app_instance_info_record: MECM LcmController Database Design.mdStore app information, such as appInsId, hostIp and table currently assigned and applied: workloadId. 