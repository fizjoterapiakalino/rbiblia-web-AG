@echo off
REM =========================================
REM rBiblia Web - Docker Helper Script
REM =========================================

if "%1"=="" goto help
if "%1"=="help" goto help
if "%1"=="start" goto start
if "%1"=="stop" goto stop
if "%1"=="dev" goto dev
if "%1"=="prod" goto prod
if "%1"=="logs" goto logs
if "%1"=="login" goto login
if "%1"=="build" goto build
if "%1"=="clean" goto clean
goto help

:help
echo.
echo rBiblia Web - Docker Helper Script
echo ===================================
echo.
echo Dostepne komendy:
echo   start    - Uruchom srodowisko developerskie
echo   stop     - Zatrzymaj kontenery
echo   dev      - Uruchom i zainstaluj zaleznosci (pierwsza konfiguracja)
echo   prod     - Zbuduj i uruchom wersje produkcyjna
echo   logs     - Pokaz logi kontenerow
echo   login    - Zaloguj sie do kontenera
echo   build    - Przebuduj assety (yarn encore)
echo   clean    - Usun wszystkie kontenery i obrazy projektu
echo.
goto end

:start
echo [*] Uruchamianie srodowiska developerskiego...
docker-compose up -d
echo [*] Aplikacja dostepna pod: http://localhost:8080
goto end

:stop
echo [*] Zatrzymywanie kontenerow...
docker-compose down
goto end

:dev
echo [*] Pierwsze uruchomienie - instalacja zaleznosci...
docker-compose up -d
echo [*] Czekam na kontener...
timeout /t 5 /nobreak > nul
echo [*] Instalacja Composer...
docker-compose exec web composer install
echo [*] Instalacja Yarn...
docker-compose exec web yarn install
echo [*] Budowanie assetow...
docker-compose exec web yarn encore dev
echo.
echo [*] Gotowe! Aplikacja dostepna pod: http://localhost:8080
goto end

:prod
echo [*] Budowanie wersji produkcyjnej...
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build
echo [*] Aplikacja produkcyjna dostepna pod: http://localhost
goto end

:logs
docker-compose logs -f
goto end

:login
docker-compose exec web bash
goto end

:build
echo [*] Budowanie assetow...
docker-compose exec web yarn encore dev
goto end

:clean
echo [*] Czyszczenie kontenerow i obrazow...
docker-compose down -v --rmi local
goto end

:end
