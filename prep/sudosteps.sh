#!/bin/bash

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath/..
	export lfsstage=toolchain
	logpath=$lfsroot/logs/$lfsstage
	
	#unique to sudo.sh
	install -v -d -m777 $logpath
	#end unique to sudo.sh
	
  source $lfsroot/include/include.sh
fi

export LFS=/mnt/lfs
try chmod 777 $LFS
try groupadd lfs
try useradd -s /bin/bash -g lfs -m -k $mypath/skel lfs
try mkdir -pv $LFS/{sources/lfsscripts,tools}
try chmod -v a+wt $LFS/sources
try ln -sv $LFS/tools /
try mkdir -v /tools/lib
case $(uname -m) in
  x86_64)  try ln -sv lib /tools/lib64 ;;
esac
try chown -v lfs:lfs $LFS/{sources,tools{,/lib}}
passwd lfs