#!/usr/bin/env bash
#
# Freezed container entrypoint:
#   1. install Composer dependencies (if missing)
#   2. scaffold the site (if not yet scaffolded)
#   3. build the static site into public/
#   4. serve public/ on port 8080
#
set -euo pipefail

cd /app

echo "==> Freezed dev environment"

if [ ! -f vendor/autoload.php ]; then
    echo "==> Installing Composer dependencies..."
    composer install --no-interaction --prefer-dist --no-progress
fi

if [ ! -f freezed.config.php ]; then
    echo "==> Scaffolding project (freezed install)..."
    ./vendor/bin/freezed install
fi

echo "==> Building site (freezed build)..."
./vendor/bin/freezed build

echo ""
echo "==> Site is live at http://localhost:8080"
echo "    Rebuild after changes:  docker compose exec freezed ./vendor/bin/freezed build"
echo ""

exec php -S 0.0.0.0:8080 -t public
