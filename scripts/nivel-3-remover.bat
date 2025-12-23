@echo off
echo ========================================
echo NIVEL 3 - DEBLOAT AVANCADO
echo Samsung Galaxy A54
echo ========================================
echo.
echo Este script remove servicos Samsung em background:
echo - Samsung Pass (use Google Password Manager)
echo - Samsung Cloud (use Google backup)
echo - Bixby Routines
echo - Servicos de IA e telemetria
echo.
echo ATENCAO: Testado e seguro, mas faca backup!
echo.
pause

echo.
echo [1/16] Removendo Samsung Pass...
adb shell pm uninstall -k --user 0 com.samsung.android.samsungpass

echo [2/16] Removendo Pass Autofill...
adb shell pm uninstall -k --user 0 com.samsung.android.samsungpassautofill

echo [3/16] Removendo Samsung Cloud...
adb shell pm uninstall -k --user 0 com.samsung.android.scloud

echo [4/16] Removendo Bixby Routines...
adb shell pm uninstall -k --user 0 com.samsung.android.app.routines

echo [5/16] Removendo Bixby Vision IA...
adb shell pm uninstall -k --user 0 com.samsung.android.visionintelligence

echo [6/16] Removendo Clipboard Edge...
adb shell pm uninstall -k --user 0 com.samsung.android.app.clipboardedge

echo [7/16] Removendo Share Live...
adb shell pm uninstall -k --user 0 com.samsung.android.app.sharelive

echo [8/16] Removendo Story Service...
adb shell pm uninstall -k --user 0 com.samsung.storyservice

echo [9/16] Removendo Photo Remaster...
adb shell pm uninstall -k --user 0 com.samsung.android.photoremasterservice

echo [10/16] Removendo Rubin IA (telemetria)...
adb shell pm uninstall -k --user 0 com.samsung.android.rubin.app

echo [11/16] Removendo Smart Switch...
adb shell pm uninstall -k --user 0 com.samsung.android.smartswitchassistant

echo [12/16] Removendo Kids Installer...
adb shell pm uninstall -k --user 0 com.samsung.android.kidsinstaller

echo [13/16] Removendo Samsung Members...
adb shell pm uninstall -k --user 0 com.samsung.android.lool

echo [14/16] Removendo DOF Viewer...
adb shell pm uninstall -k --user 0 com.samsung.android.app.dofviewer

echo [15/16] Removendo Picture Frame Widget...
adb shell pm uninstall -k --user 0 com.samsung.android.widget.pictureframe

echo [16/16] Removendo AppLovin (adware)...
adb shell pm uninstall -k --user 0 com.applovin.array.apphub.samsung

echo.
echo ========================================
echo NIVEL 3 CONCLUIDO!
echo Reinicie o celular para aplicar.
echo ========================================
pause
