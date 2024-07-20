#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

<<<<<<< HEAD
<<<<<<< HEAD:8.3/alpine3.19/fpm/Dockerfile
FROM alpine:3.19

# dependencies required for running "phpize"
# these get automatically installed and removed by "docker-php-ext-*" (unless they're already installed)
ENV PHPIZE_DEPS \
		autoconf \
		dpkg-dev dpkg \
=======
FROM debian:bookworm-slim

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
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
		file \
		g++ \
		gcc \
		libc-dev \
		make \
<<<<<<< HEAD
		pkgconf \
		re2c

# persistent / runtime deps
RUN apk add --no-cache \
		ca-certificates \
		curl \
		openssl \
		tar \
		xz

# ensure www-data user exists
RUN set -eux; \
	adduser -u 82 -D -S -G www-data www-data
# 82 is the standard uid/gid for "www-data" in Alpine
# https://git.alpinelinux.org/aports/tree/main/apache2/apache2.pre-install?h=3.14-stable
# https://git.alpinelinux.org/aports/tree/main/lighttpd/lighttpd.pre-install?h=3.14-stable
# https://git.alpinelinux.org/aports/tree/main/nginx/nginx.pre-install?h=3.14-stable

ENV PHP_INI_DIR /usr/local/etc/php
RUN set -eux; \
	mkdir -p "$PHP_INI_DIR/conf.d"; \
# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
	[ ! -d /var/www/html ]; \
	mkdir -p /var/www/html; \
	chown www-data:www-data /var/www/html; \
	chmod 1777 /var/www/html
=======
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
# ensure little user exists
RUN set -eux; \
	addgroup --gid 82 --system little; \
	adduser --uid 82 --no-create-home --disabled-login --disabled-password --system --ingroup little little;

ENV PHP_INI_DIR=/usr/local/etc/php \
	APP_ROOT=/app-src \
	PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/app-src:/app-src/bin
RUN set -eux; \
	mkdir -p "$PHP_INI_DIR/conf.d"; \
# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
	[ ! -d ${APP_ROOT} ]; \
	mkdir -p ${APP_ROOT}; \
	chown little:little ${APP_ROOT}; \
	chmod 777 ${APP_ROOT}
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

ENV GPG_KEYS 1198C0117593497A5EC5C199286AF1F9897469DC C28D937575603EB4ABB725861C0779DC5C0A9DE4 AFD8691FDAEDF03BDF6E460563F15A9B715376CA

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ENV PHP_VERSION 8.3.11
ENV PHP_URL="https://www.php.net/distributions/php-8.3.11.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.11.tar.xz.asc"
ENV PHP_SHA256="b862b098a08ab9bf4b36ed12c7d0d9f65353656b36fb0e3c5344093aceb35802"

RUN set -eux; \
	\
	apk add --no-cache --virtual .fetch-deps gnupg; \
=======
ENV PHP_VERSION 8.3.1
ENV PHP_URL="https://www.php.net/distributions/php-8.3.1.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.1.tar.xz.asc"
ENV PHP_SHA256="56445b1771b2ba5b7573453f9e8a9451e2d810b1741a352fa05259733b1e9758"
=======
ENV PHP_VERSION 8.3.6
ENV PHP_URL="https://www.php.net/distributions/php-8.3.6.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.6.tar.xz.asc"
ENV PHP_SHA256="53c8386b2123af97626d3438b3e4058e0c5914cb74b048a6676c57ac647f5eae"
>>>>>>> d0053071 (feat: up)
=======
ENV PHP_VERSION 8.3.7
ENV PHP_URL="https://www.php.net/distributions/php-8.3.7.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.7.tar.xz.asc"
ENV PHP_SHA256="d53433c1ca6b2c8741afa7c524272e6806c1e895e5912a058494fea89988570a"
>>>>>>> f0eb1ea7 (ci: Update Docker image version)
=======
ENV PHP_VERSION 8.3.8
ENV PHP_URL="https://www.php.net/distributions/php-8.3.8.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.8.tar.xz.asc"
ENV PHP_SHA256="aea358b56186f943c2bbd350c9005b9359133d47e954cfc561385319ae5bb8d7"
>>>>>>> 995be175 (ci: Update Docker image version)
=======
ENV PHP_VERSION 8.3.9
ENV PHP_URL="https://www.php.net/distributions/php-8.3.9.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.9.tar.xz.asc"
ENV PHP_SHA256="bf4d7b8ea60a356064f88485278bd6f941a230ec16f0fc401574ce1445ad6c77"
>>>>>>> 5fbad131 (ci: Update Docker image version)

RUN set -eux; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends gnupg; \
	rm -rf /var/lib/apt/lists/*; \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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
<<<<<<< HEAD
	apk del --no-network .fetch-deps
=======
	apt-mark auto '.*' > /dev/null; \
	apt-mark manual $savedAptMark > /dev/null; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false
>>>>>>> 0e455fac (fix: 8.0 gpg keys)

COPY docker-php-source /usr/local/bin/

RUN set -eux; \
<<<<<<< HEAD
	apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		argon2-dev \
		coreutils \
		curl-dev \
		gnu-libiconv-dev \
		libsodium-dev \
		libxml2-dev \
		linux-headers \
		oniguruma-dev \
		openssl-dev \
		readline-dev \
		sqlite-dev \
	; \
	\
# make sure musl's iconv doesn't get used (https://www.php.net/manual/en/intro.iconv.php)
	rm -vf /usr/include/iconv.h; \
=======
	\
	savedAptMark="$(apt-mark showmanual)"; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libargon2-dev \
		libcurl4-openssl-dev \
		libonig-dev \
		libreadline-dev \
		libsodium-dev \
		libsqlite3-dev \
		libssl-dev \
		libxml2-dev \
		zlib1g-dev \
	; \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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
<<<<<<< HEAD
=======
	debMultiarch="$(dpkg-architecture --query DEB_BUILD_MULTIARCH)"; \
# https://bugs.php.net/bug.php?id=74125
	if [ ! -d /usr/include/curl ]; then \
		ln -sT "/usr/include/$debMultiarch/curl" /usr/local/include/curl; \
	fi; \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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
=======
# --enable-ftp is included here because ftp_ssl_connect() needs ftp to be compiled statically (see https://github.com/docker-library/php/issues/236)
		--enable-ftp \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
=======
>>>>>>> d0053071 (feat: up)
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
<<<<<<< HEAD
		--with-iconv=/usr \
=======
		--with-iconv \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
		--with-openssl \
		--with-readline \
		--with-zlib \
		\
# https://github.com/bwoebi/phpdbg-docs/issues/1#issuecomment-163872806 ("phpdbg is primarily a CLI debugger, and is not suitable for debugging an fpm stack.")
		--disable-phpdbg \
		\
# in PHP 7.4+, the pecl/pear installers are officially deprecated (requiring an explicit "--with-pear")
		--with-pear \
		\
<<<<<<< HEAD
		\
		--disable-cgi \
		\
		--enable-fpm \
		--with-fpm-user=www-data \
		--with-fpm-group=www-data \
=======
# bundled pcre does not support JIT on s390x
# https://manpages.debian.org/bullseye/libpcre3-dev/pcrejit.3.en.html#AVAILABILITY_OF_JIT_SUPPORT
		$(test "$gnuArch" = 's390x-linux-gnu' && echo '--without-pcre-jit') \
		--with-libdir="lib/$debMultiarch" \
		\
		--disable-cgi \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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
<<<<<<< HEAD
=======
	cp -v php.ini-production "$PHP_INI_DIR/php.ini"; \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
	\
	cd /; \
	docker-php-source delete; \
	\
<<<<<<< HEAD
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --no-cache $runDeps; \
	\
	apk del --no-network .build-deps; \
	\
# update pecl channel definitions https://github.com/docker-library/php/issues/443
	pecl update-channels; \
	rm -rf /tmp/pear ~/.pearrc; \
	\
# smoke test
	php --version

COPY docker-php-ext-* docker-php-entrypoint /usr/local/bin/

# sodium was built as a shared module (so that it can be replaced later if so desired), so let's enable it too (https://github.com/docker-library/php/issues/598)
RUN docker-php-ext-enable sodium

ENTRYPOINT ["docker-php-entrypoint"]
WORKDIR /var/www/html

RUN set -eux; \
	cd /usr/local/etc; \
	if [ -d php-fpm.d ]; then \
		# for some reason, upstream's php-fpm.conf.default has "include=NONE/etc/php-fpm.d/*.conf"
		sed 's!=NONE/!=!g' php-fpm.conf.default | tee php-fpm.conf > /dev/null; \
		cp php-fpm.d/www.conf.default php-fpm.d/www.conf; \
	else \
		# PHP 5.x doesn't use "include=" by default, so we'll create our own simple config that mimics PHP 7+ for consistency
		mkdir php-fpm.d; \
		cp php-fpm.conf.default php-fpm.d/www.conf; \
		{ \
			echo '[global]'; \
			echo 'include=etc/php-fpm.d/*.conf'; \
		} | tee php-fpm.conf; \
	fi; \
	{ \
		echo '[global]'; \
		echo 'error_log = /proc/self/fd/2'; \
		echo; echo '; https://github.com/docker-library/php/pull/725#issuecomment-443540114'; echo 'log_limit = 8192'; \
		echo; \
		echo '[www]'; \
		echo '; php-fpm closes STDOUT on startup, so sending logs to /proc/self/fd/1 does not work.'; \
		echo '; https://bugs.php.net/bug.php?id=73886'; \
		echo 'access.log = /proc/self/fd/2'; \
		echo; \
		echo 'clear_env = no'; \
		echo; \
		echo '; Ensure worker stdout and stderr are sent to the main error log.'; \
		echo 'catch_workers_output = yes'; \
		echo 'decorate_workers_output = no'; \
	} | tee php-fpm.d/docker.conf; \
	{ \
		echo '[global]'; \
		echo 'daemonize = no'; \
		echo; \
		echo '[www]'; \
		echo 'listen = 9000'; \
	} | tee php-fpm.d/zz-docker.conf; \
	mkdir -p "$PHP_INI_DIR/conf.d"; \
	{ \
		echo '; https://github.com/docker-library/php/issues/878#issuecomment-938595965'; \
		echo 'fastcgi.logging = Off'; \
	} > "$PHP_INI_DIR/conf.d/docker-fpm.ini"

# Override stop signal to stop process gracefully
# https://github.com/php/php-src/blob/17baa87faddc2550def3ae7314236826bc1b1398/sapi/fpm/php-fpm.8.in#L163
STOPSIGNAL SIGQUIT

EXPOSE 9000
CMD ["php-fpm"]
=======
>>>>>>> 68507dcf (up):8.3/bookworm/swoole/Dockerfile
=======
# reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
	apt-mark auto '.*' > /dev/null; \
	[ -z "$savedAptMark" ] || apt-mark manual $savedAptMark; \
	find /usr/local -type f -executable -exec ldd '{}' ';' \
		| awk '/=>/ { so = $(NF-1); if (index(so, "/usr/local/") == 1) { next }; gsub("^/(usr/)?", "", so); printf "*%s\n", so }' \
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
	pecl install --configureoptions 'enable-redis-igbinary="no" enable-redis-lzf="no" enable-redis-zstd="no"' redis; \
	pecl install ds; \
	 \
	rm -rf /tmp/pear ~/.pearrc; \
	rm -rf /tmp/*; \
	\
# smoke test
	php --version
COPY docker-php-ext-* docker-php-entrypoint /usr/local/bin/

# sodium was built as a shared module (so that it can be replaced later if so desired), so let's enable it too (https://github.com/docker-library/php/issues/598)
RUN docker-php-ext-enable sodium; \
	docker-php-ext-enable redis; \
	docker-php-ext-enable ds; \
	sed -i "s@;date.timezone =@date.timezone = Asia/Shanghai@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@upload_max_filesize = 2M@upload_max_filesize = 2048M@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@post_max_size = 8M@post_max_size = 2048M@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@max_input_time = 60@max_input_time = 1800@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@max_execution_time = 30@max_execution_time = 1800M@g" "$PHP_INI_DIR/php.ini"; \
	sed -i "s@memory_limit = 128M@memory_limit = 2048M@g" "$PHP_INI_DIR/php.ini"

# swoole module
ENV EXTRA_EXT \
  bcmath bz2 calendar exif ffi gd gettext intl \
  mysqli pcntl pdo_mysql pdo_pgsql shmop soap \
  sockets sysvmsg sysvsem sysvshm tidy zip

ENV EXTRA_LIBS \
  autoconf \
	libbz2-dev \
  libffi-dev \
	zlib1g-dev \
  libpng-dev \
	libicu-dev \
  libpq-dev \
  libxml2-dev \
  libzip-dev \
	libpcre3 \
	libpcre3-dev\
	libssl-dev \
	libcurl4-openssl-dev \
	libbrotli1 \
	libbrotli-dev \
	libtidy-dev \
	libc-ares-dev \
	libzip-dev

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends $EXTRA_LIBS; \
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	rm -rf /var/lib/apt/lists/*

RUN set -ex; \
	pecl channel-update pecl.php.net; \
	docker-php-ext-install $EXTRA_EXT; \
	docker-php-ext-enable redis; \
	docker-php-ext-install sockets; \
	docker-php-source extract; \
	pecl install --configureoptions 'enable-mysqlnd="yes" enable-openssl="yes" \
	enable-http2="yes" enable-swoole-json="yes" enable-swoole-curl="yes" \
	enable-cares="yes" with-openssl-dir="/usr"' swoole; \
	docker-php-ext-enable swoole; \
	docker-php-source delete; \
	php --version; \
	php -m; \
	{ \
	echo "[swoole]"; \
	echo "extension=swoole"; \
	echo "swoole.unixsock_buffer_size=512M"; \
	echo "swoole.use_shortname=Off"; \
	echo "swoole.enable_preemptive_scheduler=On"; \
	} | tee /usr/local/etc/php/conf.d/docker-php-ext-swoole.ini; \
	 \
	rm -rf /tmp/pear ~/.pearrc; \
	rm -rf /tmp/*

RUN set -eux; \
	curl -o /usr/local/bin/composer https://mirrors.aliyun.com/composer/composer.phar; \
	chmod a+x /usr/local/bin/composer; \
	composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

ENTRYPOINT ["docker-php-entrypoint"]
STOPSIGNAL SIGWINCH

WORKDIR ${APP_ROOT}

EXPOSE 80\
	443

CMD ["php", "-a"]
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
