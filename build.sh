#!/bin/bash

PROJECT="ml-ears-world-of-warships"
BUILD_DIR=build/gui/flash/$PROJECT

set -eo pipefail
python prebuild.py

mkdir -p $BUILD_DIR
/home/monstrofil/dev/flash/flex/bin/mxmlc -load-config+=$PROJECT.xml -omit-trace-statements -warnings=false -debug=false -incremental=true -swf-version=12 -o $BUILD_DIR.swf
python file_divide.py config/__background.xml $BUILD_DIR/ root_block

/home/monstrofil/dev/flash/signIt.sh