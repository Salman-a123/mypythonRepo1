#!/bin/sh
echo "I am at point 1"
xargs -a package.txt sudo apt-get -y install --no-install-recommends | grep "xxx" 
echo "I am at point 2"
#etc.
