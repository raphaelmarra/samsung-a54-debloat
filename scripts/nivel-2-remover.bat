@echo off
echo ========================================
echo NIVEL 2 - DEBLOAT MODERADO
echo Samsung Galaxy A54
echo ========================================
echo.
echo Este script remove:
echo - Samsung Extras (Temas, Video, Games)
echo - Samsung Conectividade (DeX, Smart View)
echo - Galeria e Galaxy Store
echo.
echo ATENCAO: Use Google Fotos apos remover Galeria!
echo.
pause

echo.
echo === SAMSUNG EXTRAS ===
echo [1/18] Removendo Theme Store...
adb shell pm uninstall -k --user 0 com.samsung.android.themestore

echo [2/18] Removendo Live Wallpaper...
adb shell pm uninstall -k --user 0 com.samsung.android.wallpaper.live

echo [3/18] Removendo Sticker Center...
adb shell pm uninstall -k --user 0 com.samsung.android.stickercenter

echo [4/18] Removendo Samsung Video...
adb shell pm uninstall -k --user 0 com.samsung.android.video

echo [5/18] Removendo Game Tools...
adb shell pm uninstall -k --user 0 com.samsung.android.game.gametools

echo [6/18] Removendo Game Launcher...
adb shell pm uninstall -k --user 0 com.samsung.android.game.gamehome

echo [7/18] Removendo Guia do Usuario...
adb shell pm uninstall -k --user 0 com.sec.android.usermanual

echo [8/18] Removendo Galeria Samsung...
adb shell pm uninstall -k --user 0 com.sec.android.gallery3d

echo [9/18] Removendo Galaxy Store...
adb shell pm uninstall -k --user 0 com.sec.android.app.samsungapps

echo.
echo === SAMSUNG CONECTIVIDADE ===
echo [10/18] Removendo Smart View...
adb shell pm uninstall -k --user 0 com.samsung.android.smartmirroring

echo [11/18] Removendo Samsung DeX...
adb shell pm uninstall -k --user 0 com.samsung.android.mdx

echo [12/18] Removendo DeX Kit...
adb shell pm uninstall -k --user 0 com.samsung.android.mdx.kit

echo [13/18] Removendo HDMI App...
adb shell pm uninstall -k --user 0 com.samsung.android.hdmapp

echo [14/18] Removendo Input Share...
adb shell pm uninstall -k --user 0 com.samsung.android.inputshare

echo [15/18] Removendo Audio Mirror...
adb shell pm uninstall -k --user 0 com.samsung.android.audiomirroring

echo [16/18] Removendo Samsung Pay...
adb shell pm uninstall -k --user 0 com.samsung.android.spayfw

echo [17/18] Removendo Cold Wallet...
adb shell pm uninstall -k --user 0 com.samsung.android.coldwalletservice

echo [18/18] Removendo Media Share...
adb shell pm uninstall -k --user 0 com.samsung.android.allshare.service.mediashare

echo.
echo ========================================
echo NIVEL 2 CONCLUIDO!
echo Reinicie o celular para aplicar.
echo ========================================
pause
