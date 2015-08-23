#!/bin/bash
#this script assumes you are logged into LFS system 
# and running as user ROOT

if [ -z $includedalready ]
then
	pushd `dirname $0` > /dev/null; mypath=`pwd`; popd > /dev/null
	lfsroot=$mypath #unique to blfsmain.sh since it's top-level
	export lfsstage=blfs
	logpath=$lfsroot/logs/$lfsstage
  source $lfsroot/include/include.sh
fi

wrap=$lfsroot/include/wrapper.sh
startpt=$1

if [ -z $startpt ]
then
	startpt=1
fi

pushd $lfsroot/blfs
case $startpt in
#	1) ptry $wrap lfs-bootscripts-20150222.tar.bz2 lfs-bootscripts.sh ;&
# 2) ptry source udevconfig.sh ;&
# 5) ptry $wrap inetutils-1.9.2.tar.gz inetutils.sh \
						# --localstatedir=/var   \
            # --disable-logger       \
            # --disable-whois        \
            # --disable-servers ;&
						
  1) pushd /src
		 try tar -xvf blfs-bootscripts-20150304.tar.bz2
		 popd 
		 ;&

	2) ptry $wrap time-1.7.tar.gz time.sh --infodir=/usr/share/info ;&
	3) ptry $wrap Linux-PAM-1.1.8.tar.bz2 Linux-PAM.sh ;&
	4) ptry $wrap shadow-4.2.1.tar.xz shadow.sh ;&
		 
# https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.24.tar.xz
# http://ftp.gnu.org/gnu/which/which-2.20.tar.gz
# http://www.netfilter.org/projects/iptables/files/iptables-1.4.21.tar.bz2
# http://roy.marples.name/downloads/dhcpcd/dhcpcd-6.7.1.tar.bz2
# http://downloads.sourceforge.net/project/haveged/haveged-1.9.1.tar.gz
# http://sourceforge.net/projects/lsb/files/lsb_release/1.4/lsb-release-1.4.tar.gz
# http://download.oracle.com/berkeley-db/db-6.1.19.tar.gz
# http://www.nasm.us/pub/nasm/releasebuilds/2.11.06/nasm-2.11.06.tar.xz
# http://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.4.0.tar.gz
# http://download.osgeo.org/libtiff/tiff-4.0.3.tar.gz
# http://downloads.sourceforge.net/libpng-apng/libpng-1.6.16-apng.patch.gz
# http://downloads.sourceforge.net/libpng/libpng-1.6.16.tar.xz
# http://downloads.sourceforge.net/freetype/freetype-2.5.5.tar.bz2
# http://download.icu-project.org/files/icu4c/54.1/icu4c-54_1-src.tgz
# http://downloads.sourceforge.net/lcms/lcms2-2.6.tar.gz
# http://downloads.ghostscript.com/public/ghostscript-9.15.tar.bz2
# http://downloads.sourceforge.net/gs-fonts/ghostscript-fonts-std-8.11.tar.gz
# http://downloads.sourceforge.net/gs-fonts/gnu-gs-fonts-other-6.0.tar.gz
# ftp://ftp.gnupg.org/gcrypt/libgpg-error/libgpg-error-1.18.tar.bz2
# http://ftp.gnu.org/gnu/pth/pth-2.0.7.tar.gz
# ftp://ftp.gnupg.org/gcrypt/libgcrypt/libgcrypt-1.6.2.tar.bz2
# http://www.linuxfromscratch.org/patches/blfs/7.7/openssl-1.0.2-fix_parallel_build-1.patch
# https://openssl.org/source/old/1.0.2/openssl-1.0.2.tar.gz
# http://anduin.linuxfromscratch.org/sources/other/certdata.txt
# http://ftp.gnu.org/gnu/nettle/nettle-2.7.1.tar.gz
# http://ftp.gnu.org/gnu/libtasn1/libtasn1-4.2.tar.gz
# ftp://ftp.gnutls.org/gcrypt/gnutls/v3.3/gnutls-3.3.12.tar.xz
# ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.36.tar.bz2
# http://ftp.gnu.org/gnu/wget/wget-1.16.1.tar.xz
# http://curl.haxx.se/download/curl-7.40.0.tar.lzma
# ftp://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz
# https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
# http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz
# http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
# https://www.kernel.org/pub/software/scm/git/git-manpages-2.3.0.tar.xz 
# https://www.kernel.org/pub/software/scm/git/git-htmldocs-2.3.0.tar.xz 
# https://www.kernel.org/pub/software/scm/git/git-2.3.0.tar.xz
# http://www.python.org/ftp/python/3.4.2/Python-3.4.2.tar.xz
# http://xmlsoft.org/sources/libxml2-2.9.2.tar.gz
# http://xmlsoft.org/sources/libxslt-1.1.28.tar.gz
# http://www.freedesktop.org/software/fontconfig/release/fontconfig-2.11.1.tar.bz2
# http://graphviz.org/pub/graphviz/stable/SOURCES/graphviz-2.38.0.tar.gz
# http://oligarchy.co.uk/xapian/1.2.19/xapian-core-1.2.19.tar.xz
# http://ftp.stack.nl/pub/doxygen/doxygen-1.8.9.1.src.tar.gz
# http://ftp.gnome.org/pub/gnome/sources/glib/2.42/glib-2.42.1.tar.xz
# http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.38.tar.bz2
# ftp://ftp.gnupg.org/gcrypt/libksba/libksba-1.3.2.tar.bz2
# http://www.linuxfromscratch.org/patches/blfs/7.7/libassuan-2.2.0-fix_doc_build-1.patch
# ftp://ftp.gnupg.org/gcrypt/libassuan/libassuan-2.2.0.tar.bz2
# ftp://ftp.gnupg.org/gcrypt/pinentry/pinentry-0.9.0.tar.bz2
# http://www.cmake.org/files/v3.1/cmake-3.1.3.tar.gz
# http://downloads.sourceforge.net/levent/libevent-2.0.22-stable.tar.gz
# http://anduin.linuxfromscratch.org/sources/BLFS/7.7/m/mariadb-10.0.16.tar.gz
# http://www.linuxfromscratch.org/patches/blfs/7.7/cyrus-sasl-2.1.26-fixes-3.patch
# ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-2.1.26.tar.gz
# ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-3.0.0.tar.gz
# ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-2.0.26.tar.bz2
# http://anduin.linuxfromscratch.org/sources/BLFS/7.7/n/ntp-4.2.8p1.tar.gz
# http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.7p1.tar.gz
# https://security.appspot.com/downloads/vsftpd-3.0.2.tar.gz
# http://fcron.free.fr/archives/fcron-3.2.0.src.tar.gz
# http://rpm5.org/files/popt/popt-1.16.tar.gz
# https://fedorahosted.org/releases/l/o/logrotate/logrotate-3.8.9.tar.gz
# http://downloads.sourceforge.net/project/libtirpc/libtirpc/0.2.5/libtirpc-0.2.5.tar.bz2
# ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/lsof_4.88.tar.bz2
# http://downloads.sourceforge.net/rpcbind/rpcbind-0.2.2.tar.bz2
# http://downloads.sourceforge.net/nfs/nfs-utils-1.3.2.tar.bz2
# http://www.linuxfromscratch.org/patches/blfs/7.7/bind-9.10.1-P2-use_iproute2-1.patch
# ftp://ftp.isc.org/isc/bind9/9.10.1-P2/bind-9.10.1-P2.tar.gz
# http://archive.apache.org/dist/apr/apr-1.5.1.tar.bz2
# http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.bz2
# http://www.linuxfromscratch.org/patches/blfs/7.7/httpd-2.4.12-blfs_layout-1.patch
# https://archive.apache.org/dist/httpd/httpd-2.4.12.tar.bz2
# http://downloads.sourceforge.net/project/mcrypt/Libmcrypt/2.5.8/libmcrypt-2.5.8.tar.gz
# http://ftp.gnu.org/gnu/aspell/aspell-0.60.6.1.tar.gz
# http://www.abisource.com/downloads/enchant/1.6.0/enchant-1.6.0.tar.gz
# http://downloads.sourceforge.net/libexif/libexif-0.6.21.tar.bz2
# http://downloads.sourceforge.net/openjpeg.mirror/openjpeg-2.1.0.tar.gz
# http://www.php.net/distributions/php-5.6.6.tar.xz
# http://ftp.debian.org/debian/pool/main/w/whois/whois_5.2.7.tar.xz
# http://downloads.sourceforge.net/tripwire/tripwire-2.4.2.2-src.tar.bz2
# http://www.sudo.ws/sudo/dist/sudo-1.8.12.tar.gz

	
		
	*) pressanykey; startpt= ;;
esac
popd
