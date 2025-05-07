@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ===================================
echo    Copycentral - Configuracao
echo ===================================
echo.
echo 1. Configuracao inicial completa
echo 2. Iniciar servidor local
echo 3. Iniciar servidor para acesso externo
echo 4. Coletar arquivos estaticos
echo 5. Verificar codigo
echo 6. Limpar cache e arquivos temporarios
echo 7. Sair
echo.
set /p opcao="Escolha uma opcao: "

if "%opcao%"=="1" goto setup
if "%opcao%"=="2" goto run_local
if "%opcao%"=="3" goto run_external
if "%opcao%"=="4" goto collect_static
if "%opcao%"=="5" goto check_code
if "%opcao%"=="6" goto clean
if "%opcao%"=="7" goto end

echo Opcao invalida!
timeout /t 2 >nul
goto menu

:setup
echo.
echo === Configuracao inicial ===
echo.
python -m venv venv
call venv\Scripts\activate
python -m pip install --upgrade pip
pip install -r requirements.txt
python manage.py migrate
python manage.py collectstatic --noinput
echo.
echo Configuracao concluida!
pause
goto menu

:run_local
echo.
echo === Iniciando servidor local ===
echo.
call venv\Scripts\activate
python manage.py runserver
goto menu

:run_external
echo.
echo === Iniciando servidor para acesso externo ===
echo.
call venv\Scripts\activate
ipconfig | findstr /i "ipv4"
echo.
echo Use um dos IPs acima para acessar o site de outros dispositivos
echo Formato: http://SEU_IP:8000
echo.
python manage.py runserver 0.0.0.0:8000
goto menu

:collect_static
echo.
echo === Coletando arquivos estaticos ===
echo.
call venv\Scripts\activate
python manage.py collectstatic --noinput
pause
goto menu

:check_code
echo.
echo === Verificando codigo ===
echo.
call venv\Scripts\activate
python manage.py check
python manage.py makemigrations --check
pause
goto menu

:clean
echo.
echo === Limpando arquivos temporarios ===
echo.
del /s /q *.pyc
del /s /q __pycache__
rmdir /s /q staticfiles
echo.
echo Limpeza concluida!
pause
goto menu

:end
echo.
echo Ate logo!
timeout /t 2 >nul
exit 