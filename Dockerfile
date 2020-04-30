FROM php:7.4-fpm
LABEL maintainer: Gregory Smith <me@gregsmith.nyc> \
    version="4.1.1" \
    description="Ampache FPM Docker image"

ENV DEBIAN_FRONTEND=noninteractive
ENV AMPACHE_VERSION=4.1.1

ENV AMPACHE_DEBUG=false \
    AMPACHE_LASTFM_API_KEY= \
    AMPACHE_LASTFM_API_SECRET= \
    AMPACHE_LDAP_GROUP= \
    AMPACHE_LOGIN_METHOD=mysql \
    AMPACHE_MAIL_AUTH=false \
    AMPACHE_MAIL_AUTH_PASSWORD= \
    AMPACHE_MAIL_AUTH_USER= \
    AMPACHE_MAIL_DOMAIN=example.com \
    AMPACHE_MAIL_ENABLE=false \
    AMPACHE_MAIL_HOST=localhost \
    AMPACHE_MAIL_NAME=Ampache \
    AMPACHE_MAIL_PORT=25 \
    AMPACHE_MAIL_USER=me \
    AMPACHE_REMEMBER_ME_SESSION=31536000 \
    AMPACHE_SECRET= \
    AMPACHE_SESSION_LENGTH=7200 \
    AMPACHE_SMTP_SECURITY= \
    AMPACHE_STREAM_LENGTH=7200 \
    LDAP_ADMIN_DN= \
    LDAP_ADMIN_PASSWORD= \
    LDAP_HOST=localhost \
    LDAP_SEARCH_DN= \
    MYSQL_DATABASE=ampache \
    MYSQL_HOST= \
    MYSQL_PASSWORD= \
    MYSQL_PORT=3306 \
    MYSQL_USER=ampache 

RUN apt-get update && \
    apt-get install -y -qq \
    cron \
    gettext \
    git \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev 

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
	&& docker-php-ext-install -j$(nproc) pdo pdo_mysql gd

RUN mkdir /scripts
COPY ./update_catalog.sh /scripts
RUN echo '30 7 * * *   /usr/bin/php /var/www/bin/catalog_update.inc' | crontab -u www-data -

WORKDIR /var/templates
COPY ./ampache.cfg.php.template .

RUN mkdir /music

WORKDIR /var/www/html
RUN git clone -b master https://github.com/ampache/ampache.git ampache \
    && chown -R www-data:www-data ampache

WORKDIR ampache

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer 
RUN composer install --prefer-source --no-interaction --ignore-platform-reqs

RUN mkdir -p /var/log/ampache
RUN touch /var/log/ampache/debug.log
RUN chmod -R 777 /var/log/ampache

VOLUME /var/www/html/ampache
VOLUME /music

CMD envsubst "`env | awk -F = '{printf \" $$%s\", $$1}'`" \
        < /var/templates/ampache.cfg.php.template \
        > /var/www/html/ampache/config/ampache.cfg.php \
        && cat /var/www/html/ampache/config/ampache.cfg.php \
        && php-fpm