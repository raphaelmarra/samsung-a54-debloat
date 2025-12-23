@echo off
echo ========================================
echo LISTAR APPS INSTALADOS
echo Samsung Galaxy A54
echo ========================================
echo.
echo Escolha uma opcao:
echo [1] Todos os apps
echo [2] Apenas Samsung
echo [3] Apenas Google
echo [4] Apps de terceiros
echo [5] Apps desabilitados
echo.
set /p OPCAO=Opcao:

if "%OPCAO%"=="1" (
    echo.
    echo === TODOS OS APPS ===
    adb shell pm list packages
)
if "%OPCAO%"=="2" (
    echo.
    echo === APPS SAMSUNG ===
    adb shell pm list packages | findstr samsung
)
if "%OPCAO%"=="3" (
    echo.
    echo === APPS GOOGLE ===
    adb shell pm list packages | findstr google
)
if "%OPCAO%"=="4" (
    echo.
    echo === APPS DE TERCEIROS ===
    adb shell pm list packages -3
)
if "%OPCAO%"=="5" (
    echo.
    echo === APPS DESABILITADOS ===
    adb shell pm list packages -d
)

echo.
pause
