# Use the official Composer image to get Composer
FROM composer:1.9.3 AS composer

# Use the official WordPress image with PHP 8.2 as the base for the application
FROM wordpress:6.2.2-php8.2-apache

# Copy Composer from the Composer image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Update and install basic utilities first
RUN apt-get update && apt-get install -y curl git build-essential

# Install Java (OpenJDK 11) and verify installation
#RUN apt-get update && \
#    apt-get install -y openjdk-11-jre && \
#    java -version

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify installations
#RUN node -v && npm -v && composer --version && php -v && java -version

# Set up the working directory and copy application files
WORKDIR /var/www/html/wp-content/themes/base

# Copy Composer and npm files to the working directory
COPY ./wp-content/themes/base/composer.json ./composer.json
COPY ./wp-content/themes/base/composer.lock ./composer.lock
COPY ./wp-content/themes/base/package.json ./package.json
COPY ./wp-content/themes/base/package-lock.json ./package-lock.json

# Debugging step: List directory contents and check permissions
#RUN ls -al /var/www/html/wp-content/themes/base

# Run Composer install and npm install separately for better debugging
RUN composer install || { echo 'Composer install failed'; exit 1; }
RUN npm install || { echo 'npm install failed'; exit 1; }

# Verify npm packages and configuration
#RUN npm list -g --depth=0 || echo 'Failed to list global npm packages'
#RUN npm i -g selenium-standalone@10.0.0 || echo 'Could not install selenium standalone package'

# Install Selenium Standalone with verbose logging
#RUN selenium-standalone install --verbose || { echo 'Selenium Standalone installation failed'; exit 1; }

# Set the working directory back to the root of the WordPress installation
WORKDIR /var/www/html

# Expose port 80 for Apache server
EXPOSE 80

# Default command to run Apache in the foreground
CMD ["apache2-foreground"]
