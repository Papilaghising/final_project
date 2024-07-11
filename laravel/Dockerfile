FROM php:7.3

# Install packages required for project 
RUN apt-get update -y && apt-get install -y openssl zip unzip git gnupg2

# Install Node.js and npm
# RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && apt-get install -y nodejs
RUN apt-get update && \
    apt-get install -y --no-install-recommends gnupg && \
    curl -sL https://deb.nodesource.com/setup_12.x | sudo bash -; \
    && \
    apt-get update && \
    apt-get install -y --no-install-recommends nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends yarn && \
    npm install -g npm@^6.9.0 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# Installing composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install required php extension  
RUN docker-php-ext-install  pdo pdo_mysql mbstring

# Set working directory
WORKDIR /app

# Copy the code inside the working directory 
COPY . /app

# Install project dependencies
RUN composer install 

# Run necessary commands to run the application
RUN php artisan key:generate 
# && php artisan config:clear

RUN php artisan storage:link

RUN npm install

COPY ./laravel/run.sh /tmp    
ENTRYPOINT ["/tmp/run.sh"]



