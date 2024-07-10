FROM php:7.3

# Install packages required for project 
RUN apt-get update -y && apt-get install -y openssl zip unzip git


# RUN apt install php-mysql -y

# Installing composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install required php extension  
RUN docker-php-ext-install  pdo pdo_mysql mbstring

# Set working directory
WORKDIR /app

# Copy the code inside the working directory 
COPY . /app

# Install project dependencies
RUN composer update && composer install 

# Run necessary commands to run the application
RUN php artisan key:generate && php artisan config:clear

RUN php artisan storage:link
RUN php artisan migrate

CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000