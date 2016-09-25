#!/bin/bash

PROJECT="ml-ears-world-of-warships"
set -eo pipefail
python prebuild.py

mkdir -p gui/flash/$PROJECT
/home/monstrofil/dev/flash/flex/bin/mxmlc -load-config+=$PROJECT.xml -omit-trace-statements -warnings=false -debug=false -incremental=true -swf-version=12 -o gui/flash/$PROJECT.swf
python file_divide.py config/__background.xml gui/flash/$PROJECT/ root_block