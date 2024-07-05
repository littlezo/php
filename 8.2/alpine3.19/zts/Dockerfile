#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
FROM alpine:3.19

# dependencies required for running "phpize"
# these get automatically installed and removed by "docker-php-ext-*" (unless they're already installed)
ENV PHPIZE_DEPS \
		autoconf \
		procps \
		wget \
		dpkg-dev dpkg \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		pkgconf \
		re2c

# persistent / runtime deps
<<<<<<< HEAD
=======
RUN set -eux; \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

>>>>>>> 0e455fac (fix: 8.0 gpg keys)
RUN apk add --no-cache \
		ca-certificates \
		curl \
		openssl \
		tar \
		xz

# ensure little user exists
RUN set -eux; \
	addgroup -Sg 83 little; \
	adduser -u 82 -D -S  -s /sbin/nologin -G little -g little little
<<<<<<< HEAD
# 82 is the standard uid/gid for "little" in Alpine
=======
#	adduser -u 82 -D -S -G little little
# 82 is the standard uid/gid for "little" in Alpine
# https://git.alpinelinux.org/aports/tree/main/apache2/apache2.pre-install?h=3.14-stable
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
# https://git.alpinelinux.org/aports/tree/main/lighttpd/lighttpd.pre-install?h=3.14-stable
# https://git.alpinelinux.org/aports/tree/main/nginx/nginx.pre-install?h=3.14-stable

ENV PHP_INI_DIR=/usr/local/etc/php \
	APP_ROOT=/app-src \
	PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin:/app-src:/app-src/bin
RUN set -eux; \
	mkdir -p "$PHP_INI_DIR/conf.d"; \
# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
<<<<<<< HEAD
<<<<<<< HEAD:8.2/alpine3.19/zts/Dockerfile
	[ ! -d /var/www/html ]; \
	mkdir -p /var/www/html; \
	chown www-data:www-data /var/www/html; \
	chmod 1777 /var/www/html
=======
=======
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
	[ ! -d ${APP_ROOT} ]; \
	mkdir -p ${APP_ROOT}; \
	chown little:little ${APP_ROOT}; \
	chmod 777 ${APP_ROOT}
<<<<<<< HEAD
>>>>>>> 959e5a5a (builder):7.4/alpine3.16/cli/Dockerfile
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

ENV GPG_KEYS 39B641343D8C104B2B146DC3F9C39DC0B9698544 E60913E4DF209907D8E30D96659A97C9CF2A795A 1198C0117593497A5EC5C199286AF1F9897469DC

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
ENV PHP_VERSION 8.2.23
ENV PHP_URL="https://www.php.net/distributions/php-8.2.23.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.2.23.tar.xz.asc"
ENV PHP_SHA256="81c5ae6ba44e262a076349ee54a2e468638a4571085d80bff37f6fd308e1d8d5"
=======
ENV PHP_VERSION 8.2.14
ENV PHP_URL="https://www.php.net/distributions/php-8.2.14.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.2.14.tar.xz.asc"
ENV PHP_SHA256="763ecd39fcf51c3815af6ef6e43fa9aa0d0bd8e5a615009e5f4780c92705f583"
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
=======
ENV PHP_VERSION 8.2.18
ENV PHP_URL="https://www.php.net/distributions/php-8.2.18.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.2.18.tar.xz.asc"
ENV PHP_SHA256="44b306fc021e56441f691da6c3108788bd9e450f293b3bc70fcd64b08dd41a50"
>>>>>>> d0053071 (feat: up)
=======
ENV PHP_VERSION 8.2.19
ENV PHP_URL="https://www.php.net/distributions/php-8.2.19.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.2.19.tar.xz.asc"
ENV PHP_SHA256="aecd63f3ebea6768997f5c4fccd98acbf897762ed5fc25300e846197a9485c13"
>>>>>>> f0eb1ea7 (ci: Update Docker image version)
=======
ENV PHP_VERSION 8.2.20
ENV PHP_URL="https://www.php.net/distributions/php-8.2.20.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.2.20.tar.xz.asc"
ENV PHP_SHA256="4474cc430febef6de7be958f2c37253e5524d5c5331a7e1765cd2d2234881e50"
>>>>>>> 995be175 (ci: Update Docker image version)
=======
ENV PHP_VERSION 8.2.21
ENV PHP_URL="https://www.php.net/distributions/php-8.2.21.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.2.21.tar.xz.asc"
ENV PHP_SHA256="8cc44d51bb2506399ec176f70fe110f0c9e1f7d852a5303a2cd1403402199707"
>>>>>>> 5fbad131 (ci: Update Docker image version)

RUN set -eux; \
	\
	apk add --no-cache --virtual .fetch-deps gnupg; \
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
	apk del --no-network .fetch-deps

COPY docker-php-source /usr/local/bin/

RUN set -eux; \
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
		--with-iconv=/usr \
		--with-openssl \
		--with-readline \
		--with-zlib \
		\
# https://github.com/docker-library/php/pull/1259
		--enable-phpdbg \
		--enable-phpdbg-readline \
		\
# in PHP 7.4+, the pecl/pear installers are officially deprecated (requiring an explicit "--with-pear")
		--with-pear \
		\
<<<<<<< HEAD
# bundled pcre does not support JIT on riscv64 until 10.41 (php 8.3+)
# https://github.com/PCRE2Project/pcre2/commits/pcre2-10.41/src/sljit/sljitNativeRISCV_64.c
# https://github.com/php/php-src/tree/php-8.3.0/ext/pcre/pcre2lib
		$(test "$gnuArch" = 'riscv64-linux-musl' && echo '--without-pcre-jit') \
=======
# bundled pcre does not support JIT on s390x
# https://manpages.debian.org/bullseye/libpcre3-dev/pcrejit.3.en.html#AVAILABILITY_OF_JIT_SUPPORT
		$(test "$gnuArch" = 's390x-linux-musl' && echo '--without-pcre-jit') \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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
	runDeps="$( \
		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
			| tr ',' '\n' \
			| sort -u \
			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
	)"; \
	apk add --no-cache $runDeps; \
	apk add --no-cache --virtual .build-deps \
	g++ \
	gcc \
	libc-dev \
	make \
	pkgconf \
	autoconf; \
	\
# update pecl channel definitions https://github.com/docker-library/php/issues/443
	pecl update-channels; \
<<<<<<< HEAD
	pecl install redis; \
=======
	pecl install --configureoptions 'enable-redis-igbinary="no" enable-redis-lzf="no" enable-redis-zstd="no"' redis; \
	pecl install ds; \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
	apk del --no-network .build-deps; \
	rm -rf /tmp/pear ~/.pearrc; \
	rm -rf /tmp/*; \
	\
# smoke test
	php --version
COPY docker-php-ext-* docker-php-entrypoint /usr/local/bin/

# sodium was built as a shared module (so that it can be replaced later if so desired), so let's enable it too (https://github.com/docker-library/php/issues/598)
RUN docker-php-ext-enable sodium; \
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
	docker-php-ext-enable ds; \
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
