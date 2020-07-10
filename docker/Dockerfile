FROM php:5.6-apache

ARG version

ADD src/simpla_${version}.zip /

RUN apt-get update --fix-missing && apt-get install --no-install-recommends -y \
    unzip vim libzip-dev libpng-dev \
    libjpeg-dev libjpeg62-turbo-dev libfreetype6-dev && \
    /usr/sbin/a2enmod rewrite && \
    docker-php-ext-install mysql && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-configure gd \
      --with-jpeg-dir=/usr/include/ \
      --with-freetype-dir=/usr/include/ && \
    docker-php-ext-install gd && \
    docker-php-ext-install zip && \
    echo "date.timezone=Etc/GMT" > /usr/local/etc/php/conf.d/timezone.ini && \
    cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

RUN cd /var/www/html && unzip /simpla_${version}.zip && \
    chown -R www-data.www-data /var/www/html

VOLUME ["/var/www/html"]
