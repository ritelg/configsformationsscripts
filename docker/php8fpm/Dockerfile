FROM php:8.0-fpm

RUN echo 'test'
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
RUN wget https://get.symfony.com/cli/installer -O - | bash && \
  mv /root/.symfony/bin/symfony /usr/local/bin/symfony

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

# Xdebug
RUN pecl install xdebug-3.0.0 && docker-php-ext-enable xdebug

# opcache
RUN docker-php-ext-enable opcache

# Unzip
RUN apt-get install -y unzip

RUN apt-get install -y \
     libxml2-dev \
  && apt-get clean -y \
  && docker-php-ext-install soap    

RUN apt-get update
RUN apt-get install -y libzip-dev zlib1g-dev chromium chromium-driver
ENV PANTHER_CHROME_DRIVER_BINARY /usr/bin/chromedriver
ENV PANTHER_NO_SANDBOX 1
ENV PANTHER_CHROME_BINARY /usr/bin/chromium

RUN echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

RUN apt-get install -y graphviz

ADD xdebug.ini /usr/local/etc/php/conf.d/

