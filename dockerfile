FROM php:8.2-rc-zts-alpine3.16

RUN apk update && apk upgrade && apk add --no-cache --update curl bash openssl zip unzip git postgresql-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_pgsql
WORKDIR /app
COPY . /app
RUN composer update --ignore-platform-reqs

ARG user=myuser
RUN adduser -D $user
RUN chown -R $user:www-data storage
RUN chown -R $user:www-data bootstrap/cache
RUN chmod -R 775 storage
RUN chmod -R 775 bootstrap/cache
USER myuser

EXPOSE 8000
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]