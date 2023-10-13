FROM ritelg/php:8.2-fpm

ARG USER_ID
ARG GROUP_ID
RUN groupadd -f --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

WORKDIR /var/www

EXPOSE 9000
