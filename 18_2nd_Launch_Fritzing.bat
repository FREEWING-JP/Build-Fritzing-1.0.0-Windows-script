@echo off
rem 18_2nd_Launch_Fritzing.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

cd .\release64

@echo off
echo .
echo ===
echo * 2nd execute to Normally Launch Fritzing
rem Beep
rundll32 user32.dll,MessageBeep

rem start /wait Fritzing.exe
start Fritzing.exe

timeout /T 10 /NOBREAK

cd ..

if "%Qt_close%" == "" goto wait_close

start SendKeys_AltF4.vbs


:wait_close
echo .
echo .
echo .
echo ===
echo * 3rd
echo Waiting Close Fritzing app.
rem Beep
rundll32 user32.dll,MessageBeep

timeout /T 5 /NOBREAK

TASKLIST /FI "STATUS eq RUNNING" | findstr Fritzing.exe
if %ERRORLEVEL% EQU 0 goto wait_close

exit

