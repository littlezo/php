#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<<< HEAD:8.3/alpine3.19/cli/Dockerfile
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
RUN set -eux; \
	sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

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
<<<<<<< HEAD:8.3/alpine3.19/cli/Dockerfile
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
>>>>>>> 959e5a5a (builder):8.0/alpine3.16/cli/Dockerfile
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

ENV GPG_KEYS 1198C0117593497A5EC5C199286AF1F9897469DC C28D937575603EB4ABB725861C0779DC5C0A9DE4 AFD8691FDAEDF03BDF6E460563F15A9B715376CA

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD:8.3/alpine3.19/cli/Dockerfile
ENV PHP_VERSION 8.3.11
ENV PHP_URL="https://www.php.net/distributions/php-8.3.11.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.11.tar.xz.asc"
ENV PHP_SHA256="b862b098a08ab9bf4b36ed12c7d0d9f65353656b36fb0e3c5344093aceb35802"
=======
ENV PHP_VERSION 8.1.14
ENV PHP_URL="https://www.php.net/distributions/php-8.1.14.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.1.14.tar.xz.asc"
ENV PHP_SHA256="e16e47a872d58685913ac848ce92ec49f42c1828110c98c65fb6265a08724a1a"
>>>>>>> 970a9c65 (up):8.1/alpine3.17/cli/Dockerfile
=======
ENV PHP_VERSION 8.3.1
ENV PHP_URL="https://www.php.net/distributions/php-8.3.1.tar.xz" PHP_ASC_URL="https://www.php.net/distributions/php-8.3.1.tar.xz.asc"
ENV PHP_SHA256="56445b1771b2ba5b7573453f9e8a9451e2d810b1741a352fa05259733b1e9758"
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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
<<<<<<< HEAD:8.3/alpine3.19/cli/Dockerfile
=======
# bundled pcre does not support JIT on s390x
# https://manpages.debian.org/bullseye/libpcre3-dev/pcrejit.3.en.html#AVAILABILITY_OF_JIT_SUPPORT
<<<<<<< HEAD:8.3/alpine3.19/cli/Dockerfile
		$(test "$gnuArch" = 's390x-linux-musl'; echo '--without-pcre-jit') \
>>>>>>> e93d3047 (fix: swoole build error):8.1/alpine3.17/cli/Dockerfile
=======
		$(test "$gnuArch" = 's390x-linux-musl' && echo '--without-pcre-jit') \
>>>>>>> 6d04cee6 (fix: Fix syntax):8.1/alpine3.17/cli/Dockerfile
=======
# bundled pcre does not support JIT on s390x
# https://manpages.debian.org/bullseye/libpcre3-dev/pcrejit.3.en.html#AVAILABILITY_OF_JIT_SUPPORT
		$(test "$gnuArch" = 's390x-linux-musl' && echo '--without-pcre-jit') \
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
<<<<<<< HEAD:8.3/alpine3.19/cli/Dockerfile
    docker-php-ext-enable redis; \
=======
	docker-php-ext-enable redis; \
	docker-php-ext-enable ds; \
>>>>>>> e93d3047 (fix: swoole build error):8.1/alpine3.17/cli/Dockerfile
=======
	docker-php-ext-enable redis; \
	docker-php-ext-enable ds; \
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
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

ENTRYPOINT ["docker-php-entrypoint"]
STOPSIGNAL SIGWINCH

WORKDIR ${APP_ROOT}

EXPOSE 80\
	443

CMD ["php", "-a"]
<<<<<<< HEAD
========
>>>>>>>> 68507dcf (up):8.3/alpine3.18/zts/Dockerfile
=======
>>>>>>> 68507dcf (up)
=======
>>>>>>> 0e455fac (fix: 8.0 gpg keys)
