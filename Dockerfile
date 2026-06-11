# Freezed test/dev environment
# PHP CLI + Composer. Builds the static site and serves public/ via PHP's
# built-in web server. Intended for local testing of Freezed sites.
FROM php:8.3-cli

# System dependencies + PHP extensions required by typo3fluid/fluid.
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        unzip \
        libonig-dev \
        libxml2-dev \
    && docker-php-ext-install mbstring \
    && rm -rf /var/lib/apt/lists/*

# Composer (copied from the official Composer image).
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /app

COPY docker/entrypoint.sh /usr/local/bin/freezed-entrypoint
RUN chmod +x /usr/local/bin/freezed-entrypoint

EXPOSE 8080

ENTRYPOINT ["freezed-entrypoint"]
