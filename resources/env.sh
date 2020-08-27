#!/usr/bin/env bash

FENV=`readlink -f "$0"`
DDROPLET=`dirname $FENV`


echo env.sh
echo user `whoami`
echo dir `pwd`
export PYTHONHOME=$DDROPLET/app/.buildpack

PYLIB=$(echo $DDROPLET/app/.buildpack/lib/python*/)
PYLIB64=$(echo $DDROPLET/app/.buildpack/lib64/python*/)

export PYTHONPATH=$PYLIB:$PYLIB/lib-dynload

echo PYTHONHOME=$PYTHONHOME
echo PYTHONPATH=$PYTHONPATH
