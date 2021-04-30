FROM prestashop/prestashop:1.7-7.3-apache

RUN apt-get update 
RUN apt-get install -y \
      wget \
      git \
      fish \
      apt-transport-https \
      lsb-release \
      ca-certificates

RUN apt-get install -y libzip-dev && docker-php-ext-install pdo zip

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
