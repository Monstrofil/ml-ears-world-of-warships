#!/bin/bash

set -o pipefail

python prebuild.py
/home/monstrofil/dev/flash/flex/bin/mxmlc -load-config+=WorldofWarshipsEarsConfigUbuntu.xml -omit-trace-statements -debug=false -incremental=true -swf-version=12 -o $WORKSPACE/build/gui/flash/XVMBackground.swf

mkdir ml-ears
python file_divide.py config/__background.xml bin/ml-ears-world-of-warships/ root_block