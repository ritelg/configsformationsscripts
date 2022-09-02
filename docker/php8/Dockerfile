FROM php:8.1-fpm

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
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" 
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" 
RUN php composer-setup.php 
RUN cp composer.phar /usr/bin/composer
	#php -r "unlink('composer-setup.php');" \

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

# RUN apt-get update
# RUN apt-get install -y libzip-dev zlib1g-dev chromium chromium-driver
# ENV PANTHER_CHROME_DRIVER_BINARY /usr/bin/chromedriver
# ENV PANTHER_NO_SANDBOX 1
# ENV PANTHER_CHROME_BINARY /usr/bin/chromium

# Symfony tool
RUN apt install gnupg -y  
RUN apt-get update
RUN curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | bash
RUN apt install symfony-cli
#RUN wget https://get.symfony.com/cli/installer -O - | bash && \
#  mv /root/.symfony/bin/symfony /usr/local/bin/symfony


RUN apt-get install -y sudo 
RUN echo 'user ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

# RUN apt-get install -y graphviz
RUN pecl install xdebug
ADD xdebug.ini /usr/local/etc/php/conf.d/
ADD php.ini /usr/local/etc/php/conf.d/

RUN docker-php-ext-enable xdebug
