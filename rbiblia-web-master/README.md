# rBiblia Web

![php-cs-fixer](https://github.com/rbiblia/rbiblia-web/actions/workflows/php-cs-fixer.yaml/badge.svg)
![phpstan](https://github.com/rbiblia/rbiblia-web/actions/workflows/phpstan.yaml/badge.svg)
![rector](https://github.com/rbiblia/rbiblia-web/actions/workflows/rector.yaml/badge.svg)
![lint](https://github.com/rbiblia/rbiblia-web/actions/workflows/lint.yaml/badge.svg)
![phpunit](https://github.com/rbiblia/rbiblia-web/actions/workflows/phpunit.yaml/badge.svg)
![sonarcloud](https://github.com/rbiblia/rbiblia-web/actions/workflows/sonarcloud.yaml/badge.svg)

Simple web interface to access rBiblia's built-in translations repository in an online mode. You can access repository at the official location under [https://web.rbiblia.toborek.info](https://web.rbiblia.toborek.info).

Check also standalone and more powerful desktop version of this application at [https://rbiblia.toborek.info](https://rbiblia.toborek.info/en-US/). Binary version is available in different languages (English, Polish and Russian) and works on Windows.

This piece of software was created by [Rafał Toborek](https://github.com/clash82) with a cooperation of Brothers in Faith (check [contributors list](https://github.com/rBiblia/rbiblia-web/graphs/contributors)).

Everyone is invited to help make this software better and help to `spread God's Word over the world!`

## Development

Refer to the [official wiki](https://github.com/rBiblia/rbiblia-web/wiki) where you can find tutorials which will help you to develop locally.

### 🐳 Docker Quick Start (Windows)

Najszybszy sposób uruchomienia aplikacji lokalnie:

```batch
# Pierwsze uruchomienie (instalacja wszystkich zależności)
docker.bat dev

# Kolejne uruchomienia
docker.bat start

# Zatrzymanie
docker.bat stop
```

Aplikacja będzie dostępna pod adresem: **http://localhost:8080**

### Docker Commands

| Komenda | Opis |
|---------|------|
| `docker.bat start` | Uruchom środowisko developerskie |
| `docker.bat stop` | Zatrzymaj kontenery |
| `docker.bat dev` | Pierwsze uruchomienie z instalacją zależności |
| `docker.bat prod` | Zbuduj i uruchom wersję produkcyjną |
| `docker.bat logs` | Pokaż logi kontenerów |
| `docker.bat login` | Zaloguj się do kontenera |
| `docker.bat build` | Przebuduj assety (yarn encore) |
| `docker.bat clean` | Usuń wszystkie kontenery i obrazy projektu |

### Docker Compose (cross-platform)

```bash
# Development
docker-compose up -d
docker-compose exec web composer install
docker-compose exec web yarn install
docker-compose exec web yarn encore dev

# Production
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
```

## Technical talk

App was created using PHP v8.2 on the backend with support of ReactJS v17 on the frontend side. We use modern (on the date of writing this note) dev-technologies like Webpack, JSX, SASS, PSR's, etc.

## API Specification

Documentation for the API was created in OpenAPI format and is hosted [here](https://rbiblia.github.io/rbiblia-web/api).

## Todo's

- [React] add better error handling when dealing with response data (display error message when something will fail)
- [React] add caching to avoid server querying with every location change (if location was visited then keep it in memory and use it again)
- [React] implement searching

## Donations

Maintaining of this repo and translations is generating costs. If you wish you can always [support our work](https://rbiblia.toborek.info/donation/).

## Changelog

List of recent releases and changes can be tracked using [assets/docs/changelog.txt](https://github.com/rBiblia/rbiblia-web/blob/master/assets/docs/changelog.txt) file.

## Contributors

See [full list](https://github.com/rBiblia/rbiblia-web/graphs/contributors).

## License and terms of usage

Legal stuff can be found in [LICENSE](https://github.com/rBiblia/rbiblia-web/blob/master/LICENSE) file included in this repo.

Jezus żyje! 🧡
