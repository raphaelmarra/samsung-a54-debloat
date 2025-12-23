@echo off
echo ========================================
echo RESTAURAR APP REMOVIDO
echo Samsung Galaxy A54
echo ========================================
echo.
echo Digite o nome do pacote (ex: com.samsung.android.bixby.agent)
echo.
set /p PACKAGE=Package:

echo.
echo Restaurando %PACKAGE%...
adb shell cmd package install-existing %PACKAGE%

echo.
echo Se apareceu "Package %PACKAGE% installed for user 0", foi restaurado!
echo Se apareceu erro, o app nao pode ser restaurado por este metodo.
echo.
pause
