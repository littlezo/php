#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
FROM debian:bullseye-slim

# prevent Debian's PHP packages from being installed
# https://github.com/docker-library/php/pull/542
RUN set -eux; \
	{ \
		echo 'Package: php*'; \
		echo 'Pin: release *'; \
		echo 'Pin-Priority: -1'; \
	} > /etc/apt/preferences.d/no-debian-php

# dependencies required for running "phpize"
# (see persistent deps below)
ENV PHPIZE_DEPS \
		autoconf \
		procps \
		wget \
		dpkg-dev \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		pkg-config \
		re2c

# persistent / runtime deps
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		$PHPIZE_DEPS \
		apt-transport-https \
		ca-certificates \
		ncat \
		ca-certificates \
		curl \
		xz-utils \
	; \
	rm -rf /var/lib/apt/lists/*
<<<<<<< HEAD

=======
# RUN set -eux; \
# { \
# 	echo "deb https://mirrors.aliyun.com/debian/ bullseye main non-free contrib"; \
#   echo "deb-src https://mirrors.aliyun.com/debian/ bullseye main non-free contrib"; \
#   echo "deb https://mirrors.aliyun.com/debian-security/ bullseye-security main"; \
#   echo "deb-src https://mirrors.aliyun.com/debian-security/ bullseye-security main"; \
#   echo "deb https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib"; \
#   echo "deb-src https://mirrors.aliyun.com/debian/ bullseye-updates main non-free contrib"; \
#   echo "deb https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib"; \
#   echo "deb-src https://mirrors.aliyun.com/debian/ bullseye-backports main non-free contrib"; \
# } | tee /etc/apt/sources.list
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
# ensure little user exists
RUN set -eux; \
	addgroup --gid 82 --system little; \
	adduser --uid 82 --no-create-home --disabled-login --disabled-password --system --ingroup little little;

ENV PHP_INI_DIR=/usr/local/etc/php \
	APP_ROOT=/app-src \
	PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/app-src:/app-src/bin
RUN set -eux; \
	mkdir -p "$PHP_INI_DIR/conf.d"; \
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
	[ ! -d /var/www/html ]; \
	mkdir -p /var/www/html; \
	chown www-data:www-data /var/www/html; \
	chmod 1777 /var/www/html
=======
=======
# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
>>>>>>> 959e5a5a (builder)
=======
# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
	[ ! -d ${APP_ROOT} ]; \
	mkdir -p ${APP_ROOT}; \
	chown little:little ${APP_ROOT}; \
	chmod 777 ${APP_ROOT}

<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> b6080d7e (cli and zts)

=======
>>>>>>> 959e5a5a (builder)
=======
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
# Apply stack smash protection to functions using local buffers and alloca()
# Make PHP's main executable position-independent (improves ASLR security mechanism, and has no performance impact on x86_64)
# Enable optimization (-O2)
# Enable linker optimization (this sorts the hash buckets to improve cache locality, and is non-default)
# https://github.com/docker-library/php/issues/272
# -D_LARGEFILE_SOURCE and -D_FILE_OFFSET_BITS=64 (https://www.php.net/manual/en/intro.filesystem.php)
ENV PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
ENV PHP_CPPFLAGS="$PHP_CFLAGS"
ENV PHP_LDFLAGS="-Wl,-O1 -pie"

ENV GPG_KEYS 528995BFEDFBA7191D46839EF9BA0ADA31CBD89E 39B641343D8C104B2B146DC3F9C39DC0B9698544 F1F692238FBC1666E5A5CCD4199F9DFEF6FFBAFD

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ENV PHP_VERSION 8.1.29
ENV PHP_URL="https://www.php.net/distributions/php-8.1.29.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.1.29.tar.xz.asc"
ENV PHP_SHA256="288884af60581d4284baba2ace9ca6d646f72facbd3e3c2dd2acc7fe6f903536"
=======
ENV PHP_VERSION 8.1.27
ENV PHP_URL="https://www.php.net/distributions/php-8.1.27.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.1.27.tar.xz.asc"
ENV PHP_SHA256="479e65c3f05714d4aace1370e617d78e49e996ec7a7579a5be47535be61f0658"
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
=======
ENV PHP_VERSION 8.1.28
ENV PHP_URL="https://www.php.net/distributions/php-8.1.28.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.1.28.tar.xz.asc"
ENV PHP_SHA256="95d0b2e9466108fd750dab5c30a09e5c67f5ad2cb3b1ffb3625a038a755ad080"
>>>>>>> d0053071 (feat: up)
=======
ENV PHP_VERSION 8.1.29
ENV PHP_URL="https://www.php.net/distributions/php-8.1.29.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.1.29.tar.xz.asc"
ENV PHP_SHA256="288884af60581d4284baba2ace9ca6d646f72facbd3e3c2dd2acc7fe6f903536"
>>>>>>> 995be175 (ci: Update Docker image version)

RUN set -eux; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends gnupg; \
	rm -rf /var/lib/apt/lists/*; \
	\
	mkdir -p /usr/src; \
	cd /usr/src; \
	\
	curl -fsSL -o php.tar.xz "$PHP_URL"; \
	\
	if [ -n "$PHP_SHA256" ]; then \
		echo "$PHP_SHA256 *php.tar.xz" | sha256sum -c -; \
	fi; \
	\
	if [ -n "$PHP_ASC_URL" ]; then \
		curl -fsSL -o php.tar.xz.asc "$PHP_ASC_URL"; \
		export GNUPGHOME="$(mktemp -d)"; \
		for key in $GPG_KEYS; do \
			gpg --batch --keyserver keyserver.ubuntu.com --recv-keys "$key"; \
		done; \
		gpg --batch --verify php.tar.xz.asc php.tar.xz; \
		gpgconf --kill all; \
		rm -rf "$GNUPGHOME"; \
	fi; \
	\
	apt-mark auto '.*' > /dev/null; \
	apt-mark manual $savedAptMark > /dev/null; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

COPY docker-php-source /usr/local/bin/

RUN set -eux; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libargon2-dev \
		libcurl4-openssl-dev \
		liblz4-dev \
		libonig-dev \
		libreadline-dev \
		libsodium-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		libzstd-dev \
		zlib1g-dev \
	; \
	\
	export \
		CFLAGS="$PHP_CFLAGS" \
		CPPFLAGS="$PHP_CPPFLAGS" \
		LDFLAGS="$PHP_LDFLAGS" \
# https://github.com/php/php-src/blob/d6299206dd828382753453befd1b915491b741c6/configure.ac#L1496-L1511
		PHP_BUILD_PROVIDER='https://github.com/docker-library/php' \
		PHP_UNAME='Linux - Docker' \
	; \
	docker-php-source extract; \
	cd /usr/src/php; \
	gnuArch="$(dpkg-architecture --query DEB_BUILD_GNU_TYPE)"; \
	debMultiarch="$(dpkg-architecture --query DEB_BUILD_MULTIARCH)"; \
# https://bugs.php.net/bug.php?id=74125
	if [ ! -d /usr/include/curl ]; then \
		ln -sT "/usr/include/$debMultiarch/curl" /usr/local/include/curl; \
	fi; \
	./configure \
		--build="$gnuArch" \
		--with-config-file-path="$PHP_INI_DIR" \
		--with-config-file-scan-dir="$PHP_INI_DIR/conf.d" \
		\
# make sure invalid --configure-flags are fatal errors instead of just warnings
		--enable-option-checking=fatal \
		\
# https://github.com/docker-library/php/issues/439
		--with-mhash \
		\
# https://github.com/docker-library/php/issues/822
		--with-pic \
		\
<<<<<<< HEAD
<<<<<<< HEAD
# --enable-ftp is included here for compatibility with existing versions. ftp_ssl_connect() needed ftp to be compiled statically before PHP 7.0 (see https://github.com/docker-library/php/issues/236).
=======
# --enable-ftp is included here because ftp_ssl_connect() needs ftp to be compiled statically (see https://github.com/docker-library/php/issues/236)
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
=======
# --enable-ftp is included here for compatibility with existing versions. ftp_ssl_connect() needed ftp to be compiled statically before PHP 7.0 (see https://github.com/docker-library/php/issues/236).
>>>>>>> d0053071 (feat: up)
		--enable-ftp \
# --enable-mbstring is included here because otherwise there's no way to get pecl to use it properly (see https://github.com/docker-library/php/issues/195)
		--enable-mbstring \
# --enable-mysqlnd is included here because it's harder to compile after the fact than extensions are (since it's a plugin for several extensions, not an extension in itself)
		--enable-mysqlnd \
# https://wiki.php.net/rfc/argon2_password_hash
		--with-password-argon2 \
# https://wiki.php.net/rfc/libsodium
		--with-sodium=shared \
# always build against system sqlite3 (https://github.com/php/php-src/commit/6083a387a81dbbd66d6316a3a12a63f06d5f7109)
		--with-pdo-sqlite=/usr \
		--with-sqlite3=/usr \
		\
		--with-curl \
		--with-iconv \
		--with-openssl \
		--with-readline \
		--with-zlib \
		\
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
# https://github.com/docker-library/php/pull/1259
		--enable-phpdbg \
		--enable-phpdbg-readline \
=======
# https://github.com/bwoebi/phpdbg-docs/issues/1#issuecomment-163872806 ("phpdbg is primarily a CLI debugger, and is not suitable.")
=======
# https://github.com/bwoebi/phpdbg-docs/issues/1#issuecomment-163872806 ("phpdbg is primarily a CLI debugger, and is not suitable for debugging an fpm stack.")
>>>>>>> 959e5a5a (builder)
		--disable-phpdbg \
>>>>>>> 7cf0064b (fix alpine build fail)
=======
# https://github.com/docker-library/php/pull/1259
		--enable-phpdbg \
		--enable-phpdbg-readline \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
		\
# in PHP 7.4+, the pecl/pear installers are officially deprecated (requiring an explicit "--with-pear")
		--with-pear \
		\
<<<<<<< HEAD
# bundled pcre does not support JIT on riscv64 until 10.41 (php 8.3+)
# https://github.com/PCRE2Project/pcre2/commits/pcre2-10.41/src/sljit/sljitNativeRISCV_64.c
# https://github.com/php/php-src/tree/php-8.3.0/ext/pcre/pcre2lib
		$(test "$gnuArch" = 'riscv64-linux-gnu' && echo '--without-pcre-jit') \
=======
# bundled pcre does not support JIT on s390x
# https://manpages.debian.org/bullseye/libpcre3-dev/pcrejit.3.en.html#AVAILABILITY_OF_JIT_SUPPORT
		$(test "$gnuArch" = 's390x-linux-gnu' && echo '--without-pcre-jit') \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
		--with-libdir="lib/$debMultiarch" \
		\
# https://github.com/docker-library/php/pull/939#issuecomment-730501748
		--enable-embed \
		\
		--enable-zts \
# https://externals.io/message/118859
		--disable-zend-signals \
		--enable-zend-max-execution-timers \
	; \
	make -j "$(nproc)"; \
	find -type f -name '*.a' -delete; \
	make install; \
	find \
		/usr/local \
		-type f \
		-perm '/0111' \
		-exec sh -euxc ' \
			strip --strip-all "$@" || : \
		' -- '{}' + \
	; \
	make clean; \
	\
# https://github.com/docker-library/php/issues/692 (copy default example "php.ini" files somewhere easily discoverable)
	cp -v php.ini-* "$PHP_INI_DIR/"; \
	cp -v php.ini-production "$PHP_INI_DIR/php.ini"; \
	\
	cd /; \
	docker-php-source delete; \
	\
# reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; \
	find /usr/local -type f -executable -exec ldd '{}' ';' \
<<<<<<< HEAD
<<<<<<< HEAD
		| awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); printf "*%s\n", so }' \
=======
		| awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); print so }' \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
=======
		| awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); printf "*%s\n", so }' \
>>>>>>> d0053071 (feat: up)
		| sort -u \
		| xargs -r dpkg-query --search \
		| cut -d: -f1 \
		| sort -u \
		| xargs -r apt-mark manual \
	; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	rm -rf /var/lib/apt/lists/*; \
	\
# update pecl channel definitions https://github.com/docker-library/php/issues/443
	pecl update-channels; \
<<<<<<< HEAD
<<<<<<< HEAD
	pecl install redis; \
=======
	pecl install --configureoptions 'enable-redis-igbinary="no" enable-redis-lzf="no" enable-redis-zstd="no"' redis; \
	pecl install ds; \
<<<<<<< HEAD
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
=======
	pecl install igbinary;\
>>>>>>> 5030ce88 (feat: add igbinary ext)
=======
	pecl install msgpack; \
	pecl install igbinary; \
	pecl install ds; \
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> e9df8816 (update redis swoole ext)
=======
	pecl install --configureoptions 'enable-redis-igbinary="yes" \
	enable-redis-lzf="yes" enable-redis-zstd="yes" enable-redis-msgpack="yes" \
	enable-redis-lz4="yes" with-liblz4="yes"' redis; \
>>>>>>> f033d8e2 (ci: Update Docker image version)
=======
>>>>>>> 5bfc178f (ci: Update Docker image version)
	 \
	rm -rf /tmp/pear ~/.pearrc; \
	rm -rf /tmp/*; \
	\
# smoke test
	php --version
COPY docker-php-ext-* docker-php-entrypoint /usr/local/bin/

# sodium was built as a shared module (so that it can be replaced later if so desired), so let's enable it too (https://github.com/docker-library/php/issues/598)
<<<<<<< HEAD
<<<<<<< HEAD
RUN docker-php-ext-enable sodium; \
<<<<<<< HEAD
<<<<<<< HEAD
    docker-php-ext-enable redis; \
	sed -i "s@;date.timezone =@date.timezone = Asia/Shanghai@g" "$PHP_INI_DIR/php.ini"; \
    sed -i "s@upload_max_filesize = 2M@upload_max_filesize = 2048M@g" "$PHP_INI_DIR/php.ini"; \
    sed -i "s@post_max_size = 8M@post_max_size = 2048M@g" "$PHP_INI_DIR/php.ini"; \
    sed -i "s@max_input_time = 60@max_input_time = 1800@g" "$PHP_INI_DIR/php.ini"; \
    sed -i "s@max_execution_time = 30@max_execution_time = 1800M@g" "$PHP_INI_DIR/php.ini"; \
    sed -i "s@memory_limit = 128M@memory_limit = 2048M@g" "$PHP_INI_DIR/php.ini"

RUN set -eux; \
    curl -o /usr/local/bin/composer https://mirrors.aliyun.com/composer/composer.phar; \
    chmod a+x /usr/local/bin/composer; \
    composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
=======
	docker-php-ext-enable redis; \
=======
>>>>>>> e9df8816 (update redis swoole ext)
=======
RUN pecl install --configureoptions 'enable-redis-igbinary="yes" \
	enable-redis-lzf="yes" enable-redis-zstd="yes" enable-redis-msgpack="yes" \
	enable-redis-lz4="yes" with-liblz4="yes"' redis; \
	docker-php-ext-enable sodium; \
>>>>>>> e1fdcca1 (ci: Update Docker image version)
=======
RUN docker-php-ext-enable sodium; \
>>>>>>> f033d8e2 (ci: Update Docker image version)
	docker-php-ext-enable ds; \
	docker-php-ext-enable igbinary; \
	docker-php-ext-enable msgpack; \
	pecl install --configureoptions 'enable-redis-igbinary="yes" \
	enable-redis-lzf="yes" enable-redis-zstd="yes" enable-redis-msgpack="yes" \
	enable-redis-lz4="yes" with-liblz4="yes"' redis; \
	docker-php-ext-enable redis; \
	sed -i "s@;date.timezone =@date.timezone = Asia/Shanghai@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@upload_max_filesize = 2M@upload_max_filesize = 2048M@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@post_max_size = 8M@post_max_size = 2048M@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@max_input_time = 60@max_input_time = 1800@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@max_execution_time = 30@max_execution_time = 1800M@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@memory_limit = 128M@memory_limit = 2048M@g" "$PHP_INI_DIR/php.ini"


RUN set -eux; \
	curl -o /usr/local/bin/composer https://mirrors.aliyun.com/composer/composer.phar; \
	chmod a+x /usr/local/bin/composer; \
	composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
>>>>>>> 0e455fac (fix: 8.0 gpg keys)

ENTRYPOINT ["docker-php-entrypoint"]
STOPSIGNAL SIGWINCH

WORKDIR ${APP_ROOT}

EXPOSE 80\
	443

CMD ["php", "-a"]
<<<<<<< HEAD
=======
>>>>>>> 68507dcf (up)
=======
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
