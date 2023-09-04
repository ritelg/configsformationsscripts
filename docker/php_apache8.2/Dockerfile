FROM php:8.2-apache

RUN apt-get update 
RUN apt-get install -y \
      wget \
      git \
      fish \
      apt-transport-https \
      lsb-release \
      ca-certificates 

RUN apt-get install -y libzip-dev && docker-php-ext-install pdo zip

# Support de Postgre
RUN apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql

# Support de MySQL (pour la migration)
RUN docker-php-ext-install mysqli pdo_mysql

RUN apt-get install -y zlib1g-dev libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Symfony tool
# RUN wget https://get.symfony.com/cli/installer -O - | bash && \
#   mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# Install GD
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

# Install ext-exif
RUN apt-get -y install exiftool \
    && docker-php-ext-configure exif \
    && docker-php-ext-install exif \
    && docker-php-ext-enable exif 

# opcache
RUN docker-php-ext-enable opcache

# Unzip
RUN apt-get install -y unzip

RUN apt-get install -y \
     libxml2-dev \
  && apt-get clean -y \
  && docker-php-ext-install soap    

RUN apt-get update \
    && apt-get install -y --no-install-recommends locales apt-utils git libicu-dev g++ libpng-dev libxml2-dev libzip-dev libonig-dev libxslt-dev;


RUN docker-php-ext-install calendar dom mbstring xsl 

RUN pecl install apcu && docker-php-ext-enable apcu
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    echo "fr_FR.UTF-8 UTF-8" >> /etc/locale.gen && \
    locale-gen

RUN apt-get install -y redis-server \
    && pecl install redis \
    && docker-php-ext-enable redis

WORKDIR /var/www
