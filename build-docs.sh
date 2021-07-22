#!/bin/bash

# Local build verification

# cleanup and create a virtual python directory for docs command executions.
cleanup
mkdir -p ~/docs_jjb/virtualpython
virtualenv -p /usr/bin/python3 ~/docs_jjb/virtualpython
source ~/docs_jjb/virtualpython/bin/activate
exit_if_error $? "Unable to activate virtual python."

# Tool installation and html generation
pip install sphinx
exit_if_error $? "sphinx installation failed."

pip install recommonmark
exit_if_error $? "recommonmark installation failed."

pip install sphinx_markdown_tables
exit_if_error $? "sphinx_rtd_theme installation failed."
sphinx_markdown_tables
pip install sphinx_rtd_theme
exit_if_error $? "sphinx_rtd_theme installation failed."

pip install -r requirements.txt
exit_if_error $? "Running requirements.txt failed."

make html
exit_if_error $? "Unable to generate Chinese HTML documents."

sphinx-build -b gettext . _build/gettext
exit_if_error $? "Unable to generate .pot documents."

sphinx-intl update -p _build/gettext -l en --line-width=99999999999999999999
exit_if_error $? "Unable to generate .po documents."

sphinx-build -b html -D language=en . _build/html/en
exit_if_error $? "Unable to generate English HTML documents."

mkdir -p /var/opt/docs
mkdir /var/opt/docs/$BUILD_NUMBER
cp -r /root/docs/_build/html/en/* /var/opt/docs/$BUILD_NUMBER/

# Cleanup and exit
cleanup