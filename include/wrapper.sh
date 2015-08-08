#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	logpath=$lfsroot/logs
  source $lfsroot/include/include.sh
fi

if [ "$2" == "generic.sh" ]
then
	logfn=${1%-*}
else
  logfn=${2%.sh}
fi
oldout=$outlog
olderr=$errlog
oldcmd=$cmdlog
outlog=$logpath/$logfn-out.log
errlog=$logpath/$logfn-err.log
cmdlog=$logpath/$logfn-cmd.log
pushd `dirname $2` > /dev/null; srcpath=`pwd`; popd > /dev/null

pushd $LFS/sources
try tar -xf $1
cd ${1%.tar*}

try source $srcpath/$2

cd ..
try rm -rf ${1%.tar*}
outlog=$oldout
errlog=$olderr
cmdlog=$oldcmd
popd