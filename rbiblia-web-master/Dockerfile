# Dockerfile dla rBiblia Web
# Wieloetapowy build dla optymalizacji rozmiaru obrazu

# =========================================
# Etap 1: Base - instalacja zależności systemowych
# =========================================
FROM php:8.2-apache AS base

# Instalacja zależności systemowych
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    unzip \
    libicu-dev \
    sudo \
    libzip-dev \
    zlib1g-dev \
    && docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
    pdo_mysql \
    intl \
    opcache \
    zip \
    && rm -rf /tmp/* \
    && rm -rf /var/list/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Instalacja Composer
COPY .docker/composer_installer.sh /tmp/composer_installer.sh
RUN sh /tmp/composer_installer.sh && rm /tmp/composer_installer.sh

# Instalacja Node.js LTS (v20) i Yarn
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash - \
    && apt-get update && apt-get install -y nodejs \
    && npm install -g yarn \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Konfiguracja Apache
RUN sed -i 's#/var/www/html#/var/www/html/public_html#' /etc/apache2/sites-enabled/000-default.conf

# Włączenie wymaganych modułów Apache
RUN a2enmod headers rewrite

# Ustawienie katalogu roboczego
WORKDIR /var/www/html

# =========================================
# Etap 2: Development
# =========================================
FROM base AS development

# Dodatkowe narzędzia deweloperskie
RUN apt-get update && apt-get install -y \
    vim \
    less \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Expose porty
EXPOSE 80 443

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# Start Apache w foreground
CMD ["apache2-foreground"]

# =========================================
# Etap 3: Production (opcjonalnie)
# =========================================
FROM base AS production

# Kopiowanie plików źródłowych
COPY . /var/www/html

# Instalacja zależności produkcyjnych
RUN composer install --optimize-autoloader --no-dev --no-interaction \
    && yarn install --frozen-lockfile \
    && yarn encore production \
    && rm -rf node_modules \
    && chown -R www-data:www-data /var/www/html

# Expose port
EXPOSE 80

# Healthcheck
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

# Start Apache
CMD ["apache2-foreground"]
