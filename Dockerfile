# Prestashop Docker
# PHP Docker for Prestashop on Steroids
#
# VERSION 0.1

FROM php:5.6-apache
MAINTAINER Julian Xhokaxhiu <info [at] julianxhokaxhiu [dot] com>

LABEL Description="PHP Docker for Prestashop on Steroids" Vendor="Julian Xhokaxhiu" Version="0.1"


RUN \
    # enable mod_rewrite
    a2enmod rewrite \
    # fetch latest repository status
    && apt-get update \
    # install development packages
    && apt-get install -y \
      libmcrypt-dev \
      libjpeg62-turbo-dev \
      libpng12-dev \
      libfreetype6-dev \
      libxml2-dev \
      libicu-dev \
      zlib1g-dev \
      libz-dev \
      libmemcached-dev \
    # clear lists after install
    && rm -rf /var/lib/apt/lists/* \
    # configure gd library
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    # install PHP extensions
    && docker-php-ext-install iconv intl mcrypt opcache pdo mysql pdo_mysql mbstring soap gd zip \
    # install APCu from PECL
    && pecl install apcu-4.0.11 \
    # install IMagick from PECL
    && pecl install imagick-3.4.1 \
    # install memcached from PECL
    && pecl install memcached \
    # enable PHP extensions
    && docker-php-ext-enable opcache apcu imagick memcached

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
    echo 'opcache.memory_consumption=128'; \
    echo 'opcache.interned_strings_buffer=8'; \
    echo 'opcache.max_accelerated_files=4000'; \
    echo 'opcache.revalidate_freq=60'; \
    echo 'opcache.fast_shutdown=1'; \
    echo 'opcache.enable_cli=1'; \
  } > /usr/local/etc/php/conf.d/opcache-recommended.ini

# increase upload size
# see http://php.net/manual/en/ini.core.php
RUN { \
    echo "upload_max_filesize = 25M"; \
    echo "post_max_size = 50M"; \
  } > /usr/local/etc/php/conf.d/uploads.ini

# prestashop recommended settings
RUN { \
    echo "allow_url_fopen = on"; \
    echo "register_globals = off"; \
    echo "magic_quotes_gpc = off"; \
    echo "magic_quotes_runtime = off"; \
    echo "magic_quotes_sybase = off"; \
    echo "safe_mode = off"; \
  } > /usr/local/etc/php/conf.d/prestashop.ini

VOLUME /var/www/html