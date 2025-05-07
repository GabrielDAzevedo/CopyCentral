@echo off
setlocal enabledelayedexpansion

:MENU
cls
echo =====================================
echo      GERENCIADOR DE IMAGENS
echo =====================================
echo.
echo 1. Alterar imagem do Slide 0
echo 2. Alterar imagem do Slide 1
echo 3. Alterar imagem do Slide 2
echo 4. Alterar imagem do Slide 3
echo 5. Alterar imagem de exemplo do Servico 1
echo 6. Alterar imagem de exemplo do Servico 2
echo 7. Alterar imagem de exemplo do Servico 3
echo 8. Alterar imagem de exemplo do Servico 4
echo 9. Alterar imagem de exemplo do Servico 5
echo 10. Alterar imagem de exemplo do Servico 6
echo 11. Alterar imagem de exemplo do Servico 7
echo 12. Alterar imagem de exemplo do Servico 8
echo 0. Sair
set /p OPCAO="Escolha uma opcao: "

if "%OPCAO%"=="1" goto SLIDE0
if "%OPCAO%"=="2" goto SLIDE1
if "%OPCAO%"=="3" goto SLIDE2
if "%OPCAO%"=="4" goto SLIDE3
if "%OPCAO%"=="5" goto SERV1
if "%OPCAO%"=="6" goto SERV2
if "%OPCAO%"=="7" goto SERV3
if "%OPCAO%"=="8" goto SERV4
if "%OPCAO%"=="9" goto SERV5
if "%OPCAO%"=="10" goto SERV6
if "%OPCAO%"=="11" goto SERV7
if "%OPCAO%"=="12" goto SERV8
if "%OPCAO%"=="0" exit

goto MENU

:SLIDE0
set CSS_FILE=static\css\style.css
set /p IMG="Digite a URL da nova imagem para o Slide 0: "
if not "%IMG%"=="" (
    powershell -Command "((Get-Content %CSS_FILE% -Raw) -replace '(^#heroCarousel0[^{]*background-image: url\\([\"''][^\"'']*[\"'']\\);)', '#heroCarousel0 { background-image: url(`"%IMG%`" );' }) | Set-Content %CSS_FILE%"
    echo Slide 0 alterado!
)
pause
goto MENU

:SLIDE1
set CSS_FILE=static\css\style.css
set /p IMG="Digite a URL da nova imagem para o Slide 1: "
if not "%IMG%"=="" (
    powershell -Command "((Get-Content %CSS_FILE% -Raw) -replace '(^#heroCarousel1[^{]*background-image: url\\([\"''][^\"'']*[\"'']\\);)', '#heroCarousel1 { background-image: url(`"%IMG%`" );' }) | Set-Content %CSS_FILE%"
    echo Slide 1 alterado!
)
pause
goto MENU

:SLIDE2
set CSS_FILE=static\css\style.css
set /p IMG="Digite a URL da nova imagem para o Slide 2: "
if not "%IMG%"=="" (
    powershell -Command "((Get-Content %CSS_FILE% -Raw) -replace '(^#heroCarousel2[^{]*background-image: url\\([\"''][^\"'']*[\"'']\\);)', '#heroCarousel2 { background-image: url(`"%IMG%`" );' }) | Set-Content %CSS_FILE%"
    echo Slide 2 alterado!
)
pause
goto MENU

:SLIDE3
set CSS_FILE=static\css\style.css
set /p IMG="Digite a URL da nova imagem para o Slide 3: "
if not "%IMG%"=="" (
    powershell -Command "((Get-Content %CSS_FILE% -Raw) -replace '(^#heroCarousel3[^{]*background-image: url\\([\"''][^\"'']*[\"'']\\);)', '#heroCarousel3 { background-image: url(`"%IMG%`" );' }) | Set-Content %CSS_FILE%"
    echo Slide 3 alterado!
)
pause
goto MENU

REM --- Serviços ---
REM Função para substituir o N-ésimo bloco de exemplo
:REPLACE_SERV
setlocal
set HTML_FILE=templates\core\home.html
set N=%1
set IMG=%2
set TMP_FILE=%HTML_FILE%.tmp

powershell -Command ^
    "$in = Get-Content '%HTML_FILE%' -Raw; ^
    $pattern = '(<div class=\"example-placeholder\">[\\s\\S]*?<i class=\"fas fa-images\"></i>[\\s\\S]*?<p>Exemplos em breve</p>[\\s\\S]*?</div>)'; ^
    $matches = [regex]::Matches($in, $pattern); ^
    if ($matches.Count -ge %N%) { ^
        $replace = '<div class=\"example-placeholder\"><img src=\"%IMG%\" alt=\"Exemplo Servico %N%\" style=\"max-width:100%%;border-radius:8px;\"></div>'; ^
        $sb = New-Object System.Text.StringBuilder; ^
        $lastIndex = 0; ^
        for ($i = 0; $i -lt $matches.Count; $i++) { ^
            if ($i -eq (%N%-1)) { ^
                $sb.Append($in.Substring($lastIndex, $matches[$i].Index - $lastIndex)) | Out-Null; ^
                $sb.Append($replace) | Out-Null; ^
                $lastIndex = $matches[$i].Index + $matches[$i].Length; ^
            } ^
        } ^
        $sb.Append($in.Substring($lastIndex)) | Out-Null; ^
        Set-Content '%TMP_FILE%' $sb.ToString(); ^
        Move-Item -Force '%TMP_FILE%' '%HTML_FILE%'; ^
        Write-Host 'Servico %N% alterado!'; ^
    } else { ^
        Write-Host 'Bloco de exemplo do servico %N% nao encontrado!'; ^
    }"
endlocal
goto MENU

:SERV1
set /p IMG="URL da nova imagem de exemplo para o Servico 1: "
if not "%IMG%"=="" call :REPLACE_SERV 1 "%IMG%"
pause
goto MENU

:SERV2
set /p IMG="URL da nova imagem de exemplo para o Servico 2: "
if not "%IMG%"=="" call :REPLACE_SERV 2 "%IMG%"
pause
goto MENU

:SERV3
set /p IMG="URL da nova imagem de exemplo para o Servico 3: "
if not "%IMG%"=="" call :REPLACE_SERV 3 "%IMG%"
pause
goto MENU

:SERV4
set /p IMG="URL da nova imagem de exemplo para o Servico 4: "
if not "%IMG%"=="" call :REPLACE_SERV 4 "%IMG%"
pause
goto MENU

:SERV5
set /p IMG="URL da nova imagem de exemplo para o Servico 5: "
if not "%IMG%"=="" call :REPLACE_SERV 5 "%IMG%"
pause
goto MENU

:SERV6
set /p IMG="URL da nova imagem de exemplo para o Servico 6: "
if not "%IMG%"=="" call :REPLACE_SERV 6 "%IMG%"
pause
goto MENU

:SERV7
set /p IMG="URL da nova imagem de exemplo para o Servico 7: "
if not "%IMG%"=="" call :REPLACE_SERV 7 "%IMG%"
pause
goto MENU

:SERV8
set /p IMG="URL da nova imagem de exemplo para o Servico 8: "
if not "%IMG%"=="" call :REPLACE_SERV 8 "%IMG%"
pause
goto MENU 