��    
      l               �   z   �   5   8  $   n  *   �  *   �  -   �  '       ?     C  �  S  �   �  >   |  ,   �  /   �  .     3   G  0   {  N  �     �   ATP数据库使用了开源的PostgreSQL数据库，推荐版本为12.2。目前设计并应用的数据库表格如下： CONTRIBUTION_TABLE: 存储贡献的测试用例信息 FILE_TABLE: 存储图标文件信息 TABLE TASK_TABLE: 存储测试任务信息 TEST_CASE_TABLE : 存储测试用例信息 TEST_SCENARIO_TABLE: 存储测试场景信息 TEST_SUITE_TABLE: 存储测试套信息 在V1.1版本中，较v1.0版本，TASK_TABLE表中TESTCASEDETAIL字段存储内容发生变化，TEST_CASE_TABLE表中存储字段发生变化，因此升级V1.1版本需要清除TASK_TABLE表和TEST_CASE_TABLE表中所有数据，否则功能会有问题。 数据库设计 Project-Id-Version: EdgeGallery Documentation 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-05-26 17:32+0530
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: en
Language-Team: en <LL@li.org>
Plural-Forms: nplurals=2; plural=(n != 1)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.9.1
 The ATP database uses open-source PostgreSQL databases with a recommended version of 12.2.The database tables currently designed and applied are as follows: CONTRIBUTION_TABLE: Storage contribution test case information FILE_TABLE: stores icon document information TABLE TASK_TABLE: Storage test task information TEST_CASE_TABLE: Storage test case information TEST_SCENARIO_TABLE: Storage test scene information TEST_SUITE_TABLE: Storage test suite information In version V1.1, when the contents of the TESTCASEDETAIL field in the TESTCASE_TABLE table change in the v1.0 version, the storage field in the TEST_CASE_TABLE table has changed, so the upgrade version 1.1 requires that all data in the TASK_TABLE table and TEST_CASE_TABLE table be cleared, otherwise the function will be problematic. Database design 