# docs

#### Description
EdgeGallery docs


## License & Copyright
[Apache License Version 2.0](https://gitee.com/edgegallery/docs/blob/master/license)

[Creative Commons Corporation 4.0（CC-BY-4.0）](https://gitee.com/edgegallery/docs/blob/master/license-cc-by-4.0)

## TROUBLESHOOTING GUIDE

#### Error fix for Header #,##,### and links with [], and ()
- In local setup, add myst_parser in extensions of conf.py file.
       extensions = ['sphinx_markdown_tables', 'myst_parser',]
- myst_parser version is 0.14.0 for proper working.
- Run make gettext in docs folder of the project to create fresh .pot files.
- Now, use "sphinx-intl update -p build/gettext -l en --line-width=99999999999999999999999" to update .po files
- Translate/Auto-translate the po files and push in the po code.
   ###### WRONG
       msgid "## EdgeGallery Installation guide"
       msgstr "## EdgeGallery Installation Guidance"
   ###### CORRECTION
       msgid "EdgeGallery Installation guide"
       msgstr "EdgeGallery Installation Guidance"
   ###### WRONG
       msgid "[EdgeGalleryOffline installation guide](https://gitee.com/OSDT/dashboard/projects/edgegallery/installer/blob/Release-v1.0/offline/README_cn.md)"
       msgstr "[EdgeGallery offline installation guidance] (https: //gitee.com/OSDT/dashboard/projects/edgegallery/installer/blob/Release-v1.0/offline/README_cn.md)"
   ###### CORRECTION
       msgid "[EdgeGalleryOffline installation guide](https://gitee.com/edgegallery/installer/blob/Release-v1.1/ansible_install/README-cn%2Emd)"
       msgstr "[EdgeGallery offline installation guidance](https://gitee.com/edgegallery/installer/blob/Release-v1.1/ansible_install/README-cn%2Emd)"

#### Images link
 - During auto-translation images links have extra spaces, and the link should be written properly.
   ###### WRONG
       msgstr "! [](/uploads/images/2020/v1.0/all - the-arch.png)"
   ###### CORRECTION
       msgstr "![](/uploads/images/2020/v1.0/all-the-arch.png)"

#### Bullet numbering and rst headers
- Appstore.rst picks headers from the tree beneath like Appstore_Overview.po and Appstore_Interfaces.po. Making sure these files are properly written with English changes in required for rst file English reflection. For this step 1 should be followed.
   
#### Internal hrefs
- Internal hrefs has space between [] and (). This should be removed.
- The links inside () should not have any space. Else the changes won't be reflected.
   ###### WRONG
      msgid "[1. application](#1-application)"
      msgstr "[1. Application] (#1-Application)"

      msgid "[AppStore Interface list](#Interface list)"
      msgstr "[AppStore Interface List](#Interface List)"
   ###### CORRECTION
      msgid "[1. application](#1-application)"
      msgstr "[1. Application](#1-Application)"
      
      msgid "[AppStore Interface list](#Interface list)"
      msgstr "[AppStore Interface List](#InterfaceList)"
      