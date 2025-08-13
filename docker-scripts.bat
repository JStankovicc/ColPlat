@echo off
echo ABPlat Docker Management Scripts
echo ==================================

:menu
echo.
echo 1. Pokretanje svih servisa (build + up)
echo 2. Pokretanje u background-u
echo 3. Zaustavljanje servisa
echo 4. Pregled logova
echo 5. Restart servisa
echo 6. Čišćenje (down + volumes)
echo 7. Status servisa
echo 8. Izlaz
echo.
set /p choice="Izaberite opciju (1-8): "

if "%choice%"=="1" (
    echo Pokretanje svih servisa...
    docker-compose up --build
    goto menu
)

if "%choice%"=="2" (
    echo Pokretanje u background-u...
    docker-compose up -d --build
    goto menu
)

if "%choice%"=="3" (
    echo Zaustavljanje servisa...
    docker-compose down
    goto menu
)

if "%choice%"=="4" (
    echo Pregled logova...
    docker-compose logs -f
    goto menu
)

if "%choice%"=="5" (
    echo Restart servisa...
    docker-compose restart
    goto menu
)

if "%choice%"=="6" (
    echo Čišćenje (down + volumes)...
    docker-compose down -v
    goto menu
)

if "%choice%"=="7" (
    echo Status servisa...
    docker-compose ps
    goto menu
)

if "%choice%"=="8" (
    echo Izlaz...
    exit /b 0
)

echo Neispravna opcija. Pokušajte ponovo.
goto menu
