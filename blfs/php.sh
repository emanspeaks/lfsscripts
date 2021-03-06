#--with-apxs2                     \
try ./configure --prefix=/usr                    \
            --sysconfdir=/etc                \
						--localstatedir=/var         \
            --datadir=/usr/share/php     \
            --mandir=/usr/share/man      \
            --with-config-file-path=/etc     \
            --disable-ipv6                   \
            --with-openssl                   \
            --enable-fpm                 \
            --with-fpm-user=apache       \
            --with-fpm-group=apache      \
            --with-pcre-regex=/usr           \
            --with-zlib                      \
            --enable-bcmath                  \
            --with-bz2                       \
            --enable-calendar                \
            --with-curl                      \
            --enable-dba=shared              \
            --with-gdbm                      \
            --enable-exif                    \
            --enable-ftp                     \
            --with-openssl-dir=/usr          \
            --with-gd                   \
            --with-jpeg-dir=/usr             \
            --with-png-dir=/usr              \
            --with-zlib-dir=/usr             \
            --with-freetype-dir=/usr         \
            --with-gettext                   \
            --with-gmp                       \
            --enable-mbstring                \
            --with-mysql                     \
            --with-mysqli=mysqlnd            \
            --with-mysql-sock=/var/run/mysql \
            --with-pdo-mysql                 \
            --without-pdo-sqlite             \
            --with-pspell                    \
            --with-readline                  \
            --enable-sockets                 \
            --with-tidy                      \
            --with-xsl                       \
            --with-iconv \
						--with-mcrypt=/usr 
try make
try make test
try make install
try install -v -m644 php.ini-production /etc/php.ini
try mv -v /etc/php-fpm.conf{.default,}            
try install -v -m755 -d /usr/share/doc/php-5.6.6 
try install -v -m644    CODING_STANDARDS EXTENSIONS INSTALL NEWS README* UPGRADING* php.gif \
                    /usr/share/doc/php-5.6.6 
try ln -v -sfn          /usr/lib/php/doc/Archive_Tar/docs/Archive_Tar.txt \
                    /usr/share/doc/php-5.6.6 
try ln -v -sfn          /usr/lib/php/doc/Structures_Graph/docs \
                    /usr/share/doc/php-5.6.6

sed -i 's@php/includes"@&\ninclude_path = ".:/usr/lib/php"@' \
    /etc/php.ini
sed -i -e '/proxy_module/s/^#//'      \
       -e '/proxy_fcgi_module/s/^#//' \
       /etc/httpd/httpd.conf
echo \
'ProxyPassMatch ^/(.*\.php)$ fcgi://127.0.0.1:9000/srv/www/$1' >> \
/etc/httpd/httpd.conf
			 
pushd $bootscripts
try make install-php
popd