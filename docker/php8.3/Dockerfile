FROM php:8.3

RUN apt-get update 
RUN apt-get install -y \
      wget \
      git \
      fish \
      apt-transport-https \
      lsb-release \
      ca-certificates \
      g++ \
      libpq-dev \
      libicu-dev \ 
      libjpeg62-turbo-dev \
      libfreetype6-dev \
      libpng-dev \
      libxml2-dev \ 
      libonig-dev \ 
      libxml2-dev \
      libzip-dev \
      zlib1g-dev \
      exiftool \
      unzip \
      redis-server \
      locales \ 
      apt-utils \ 
      libxslt-dev


RUN pecl install redis apcu
RUN docker-php-ext-install pdo zip pdo_pgsql mysqli pdo_mysql intl opcache soap calendar dom mbstring xsl exif
RUN docker-php-ext-configure exif
RUN docker-php-ext-enable exif redis apcu opcache

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install -j$(nproc) gd

RUN locale-gen fr_FR.UTF-8

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

RUN curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
RUN fish install --path=~/.local/share/omf --config=~/.config/omf --noninteractive

WORKDIR /var/www


