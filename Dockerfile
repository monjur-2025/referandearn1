# Use PHP 8.1 Apache image
FROM php:8.1-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set document root
ENV APACHE_DOCUMENT_ROOT /var/www/html

WORKDIR /var/www/html

# Copy all files
COPY . /var/www/html

# Set permissions
RUN chmod -R 777 /var/www/html/users.json \
    && chmod -R 777 /var/www/html/error.log

# Enable display errors (for debugging, remove in production)
RUN echo "display_errors = On\nerror_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php.ini