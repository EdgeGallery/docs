��          �               �  �   �      �  
   �     �  `   �        7   1     i  {   u     �  C         D  m   X  J   �       S   '  >   {     �  T   �  s        �  1   �  �  �  �   L      F	  
   g	     r	  `   ~	     �	  7   �	     (
  {   4
     �
  C   �
       k     J   �     �  S   �  8   8     q  T   w  p   �     =  1   B   Appstore.rst picks headers from the tree beneath like Appstore_Overview.po and Appstore_Interfaces.po. Making sure these files are properly written with English changes in required for rst file English reflection. For this step 1 should be followed. Bullet numbering and rst headers CORRECTION Description During auto-translation images links have extra spaces, and the link should be written properly. EdgeGallery docs Error fix for Header #,##,### and links with [], and () Images link In local setup, add myst_parser in extensions of conf.py file.      extensions = ['sphinx_markdown_tables', 'myst_parser',] Internal hrefs Internal hrefs has space between [] and (). This should be removed. License & Copyright Now, use "sphinx-intl update -p build/gettext -l en --line-width=99999999999999999999999" to update .po files Run make gettext in docs folder of the project to create fresh .pot files. TROUBLESHOOTING GUIDE The links inside () should not have any space. Else the changes won't be reflected. Translate/Auto-translate the po files and push in the po code. WRONG [Apache License Version 2.0](https://gitee.com/edgegallery/docs/blob/master/license) [Creative Commons Corporation 4.0（CC-BY-4.0）](https://gitee.com/edgegallery/docs/blob/master/license-cc-by-4.0) docs myst_parser version is 0.14.0 for proper working. Project-Id-Version: EdgeGallery Documentation 
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
 Appstore.rst picks headers from the tree beneath like Appstore_Overview.po and Appstore_Interfaces.po. Making sure these files are properly written with English changes in required for rst file English reflection. For this step 1 should be followed. Bullet numbering and rst headers CORRECTION Description During auto-translation images links have extra spaces, and the link should be written properly. EdgeGallery docs Error fix for Header #,##,### and links with [], and () Images link In local setup, add myst_parser in extensions of conf.py file.      extensions = ['sphyx_markdown_tables',' myst_parser ',] Internal hrefs Internal hrefs has space between [] and (). This should be removed. License & Copyright Now, use " sphinx-intl update -p build/gettext -l en --line-width=999999999999999999999" to update .o files Run make gettext in docs folder of the project to create fresh .dot files. TROUBLESHOOTING GUIDE The links inside () should not have any space. Else the changes won't be reflected. Translate/Auto-translate the po filesandpushinthepocode. WRONG [Apache License Version 2.0](https://gitee.com/edgegallery/docs/blob/master/license) [Creative Commons Corporation 4.0 (CC-BY-4.0)](https://gitee.com/edgegallery/docs/blob/master/license-cc-by-4.0) docs myst_parser version is 0.14.0 for proper working. 