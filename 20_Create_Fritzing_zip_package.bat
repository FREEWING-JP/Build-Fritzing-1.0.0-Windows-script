rem 20_Create_Fritzing_zip_package.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

ren release64 Fritzing_102

powershell compress-archive .\Fritzing_102 Fritzing_102.zip

ren Fritzing_102 release64

echo .
echo ===
dir Fritzing_102.zip
rem Beep
rundll32 user32.dll,MessageBeep
timeout /T 1 /NOBREAK
rundll32 user32.dll,MessageBeep
timeout /T 1 /NOBREAK
rundll32 user32.dll,MessageBeep

timeout /T 10 /NOBREAK

start .

exit

