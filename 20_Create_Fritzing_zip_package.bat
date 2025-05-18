@echo off
rem 20_Create_Fritzing_zip_package.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

set Fritzing_XXX=Fritzing_105

ren release64 %Fritzing_XXX%

powershell compress-archive .\%Fritzing_XXX% %Fritzing_XXX%.zip

ren %Fritzing_XXX% release64

echo .
echo ===
dir %Fritzing_XXX%.zip
rem Beep
rundll32 user32.dll,MessageBeep
timeout /T 1 /NOBREAK
rundll32 user32.dll,MessageBeep
timeout /T 1 /NOBREAK
rundll32 user32.dll,MessageBeep

timeout /T 10 /NOBREAK

start .

exit

