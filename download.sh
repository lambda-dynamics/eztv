#!/bin/bash

wget https://bitbucket.org/lambdadynamics/eztv/get/master.tar.gz -O eztv.tar.gz
tar -xf eztv.tar.gz
mv lambdadynamics-eztv-* EZTV
rm eztv.tar.gz
