rem 20_Create_Fritzing_zip_package.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

ren release64 Fritzing_100

powershell compress-archive .\Fritzing_100 Fritzing_101.zip

ren Fritzing_100 release64

echo .
echo ===
dir Fritzing_101.zip
rem Beep
rundll32 user32.dll,MessageBeep
timeout /T 1 /NOBREAK
rundll32 user32.dll,MessageBeep
timeout /T 1 /NOBREAK
rundll32 user32.dll,MessageBeep

timeout /T 10 /NOBREAK

start .

exit

