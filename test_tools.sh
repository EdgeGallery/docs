#!/bin/bash

# Tool installation

pip install sphinx

pip install recommonmark

pip install sphinx_markdown_tables

pip install sphinx_rtd_theme

pip install -r requirements.txt

make html

sphinx-build -b gettext . _build/gettext

sphinx-intl update -p _build/gettext -l en --line-width=99999999999999999999

sphinx-build -b html -D language=en . _build/html/en


