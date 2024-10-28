@echo off
rem 16_Copy_Qt_Requirement_DLL_files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

cd .\release64

if not exist Fritzing.exe goto failed

C:\Qt\6.5.3\msvc2019_64\bin\windeployqt6.exe Fritzing.exe

cd ..

exit

:failed
@echo off
echo .
echo ===
echo failed
echo ===
:failed_beep
rem Beep
rundll32 user32.dll,MessageBeep
timeout /T 5 /NOBREAK

goto failed_beep

