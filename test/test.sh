#!/bin/sh

cd `dirname $0`

gantry bower install
rm -rf bower_components || echo "Test Failed"