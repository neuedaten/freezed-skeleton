# Freezed skeleton

Starter project for **[Freezed](https://github.com/neuedaten/freezed)** — a
static site generator powered by the TYPO3 Fluid template engine.

## Create a site

```bash
composer create-project --stability=beta neuedaten/freezed-skeleton my-site
cd my-site
./vendor/bin/freezed build
# open public/index.html
```

`create-project` automatically scaffolds the project (`freezed install`) with the
default theme and example pages.

## Develop

Rebuild after changes and preview locally:

```bash
./vendor/bin/freezed build
php -S localhost:8080 -t public
```

Or use Docker (no local PHP required):

```bash
docker compose up --build
# http://localhost:8080
```

Rebuild inside the running container:

```bash
docker compose exec freezed ./vendor/bin/freezed build
```

## What's here

```text
.
├─ composer.json          # requires neuedaten/freezed
├─ Dockerfile             # PHP 8.3 + Composer dev image
├─ docker-compose.yml     # builds + serves public/ on :8080
└─ docker/entrypoint.sh   # install → scaffold → build → serve
```

After `freezed install`, your site lives in `content/`, `themes/`, `static/`
and `freezed.config.php`. The build output goes to `public/` (git-ignored).

## Documentation

Full docs are in the engine repository:
**[neuedaten/freezed → docs](https://github.com/neuedaten/freezed/tree/main/docs)**.

## License

[GPL-2.0-or-later](LICENSE) © Bastian Schwabe / neuedaten
