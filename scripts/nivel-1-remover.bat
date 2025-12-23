@echo off
echo ========================================
echo NIVEL 1 - DEBLOAT CONSERVADOR
echo Samsung Galaxy A54
echo ========================================
echo.
echo Este script remove apps 100%% seguros:
echo - Microsoft (LinkedIn, OneDrive, AppManager)
echo - Facebook (Services, AppManager, System)
echo - Bixby (todos)
echo - AR (ARCore, AR Emoji)
echo.
pause

echo.
echo [1/11] Removendo LinkedIn...
adb shell pm uninstall -k --user 0 com.linkedin.android

echo [2/11] Removendo OneDrive...
adb shell pm uninstall -k --user 0 com.microsoft.skydrive

echo [3/11] Removendo Microsoft AppManager...
adb shell pm uninstall -k --user 0 com.microsoft.appmanager

echo [4/11] Removendo Facebook AppManager...
adb shell pm uninstall -k --user 0 com.facebook.appmanager

echo [5/11] Removendo Facebook System...
adb shell pm uninstall -k --user 0 com.facebook.system

echo [6/11] Removendo Facebook Services...
adb shell pm uninstall -k --user 0 com.facebook.services

echo [7/11] Removendo Bixby Agent...
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.agent

echo [8/11] Removendo Bixby Wakeup...
adb shell pm uninstall -k --user 0 com.samsung.android.bixby.wakeup

echo [9/11] Removendo Bixby Vision...
adb shell pm uninstall -k --user 0 com.samsung.android.bixbyvision.framework

echo [10/11] Removendo ARCore...
adb shell pm uninstall -k --user 0 com.google.ar.core

echo [11/11] Removendo AR Emoji...
adb shell pm uninstall -k --user 0 com.samsung.android.aremoji

echo.
echo ========================================
echo NIVEL 1 CONCLUIDO!
echo Reinicie o celular para aplicar.
echo ========================================
pause
