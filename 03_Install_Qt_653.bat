@echo off
rem 03_Install_Qt_653.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
@echo off
cd /d \00_fritzing

if exist "C:\Qt\6.5.3\msvc2019_64" exit


echo .
echo ===
echo MUST Require Qt Account
echo .
echo https://login.qt.io/register
echo ===
echo Input Qt Account
rem Beep
rundll32 user32.dll,MessageBeep
if "%Qt_email%" == "" set /p Qt_email=Qt Account your_email ? 
if "%Qt_passw%" == "" set /p Qt_passw=Qt Account your_password ? 

cls

echo Check Admin Plivilege
whoami /groups | find "S-1-16-12288" > nul
if %ErrorLevel% == 0 goto is_admin

echo .
echo .
echo .
echo ===
echo User Account Control
echo ===
echo Select Yes
rem Beep
rundll32 user32.dll,MessageBeep
pause


:is_admin

if "%Qt_agree%" == "" goto manual_accept

start SendKeys_Accept.vbs
goto auto_accept


:manual_accept
echo .
echo .
echo .
echo ===
echo (Lesser) GNU General Public License v3 obligations:
echo  Accept or Reject
echo ===
rem Beep
rundll32 user32.dll,MessageBeep
pause


:auto_accept

echo cd /d %cd%>qt_inst.bat
echo qt-unified-windows-x64-4.6.1-online.exe --root C:\Qt ^^>>qt_inst.bat
echo   --email %Qt_email% ^^>>qt_inst.bat
echo   --pw    %Qt_passw% ^^>>qt_inst.bat
echo   --accept-licenses ^^>>qt_inst.bat
echo   --accept-messages ^^>>qt_inst.bat
echo   --confirm-command ^^>>qt_inst.bat
echo   --auto-answer telemetry-question=No ^^>>qt_inst.bat
echo   install qt.qt6.653.win64_msvc2019_64 ^^>>qt_inst.bat
echo   install qt.qt6.653.addons ^^>>qt_inst.bat
echo   install qt.qt6.653.qt5compat>>qt_inst.bat

@echo on

start /wait powershell "Start-Process -FilePath 'qt_inst.bat' -WorkingDirectory '%cd%' -Verb RunAs -Wait"

if exist C:\Qt\Tools\QtCreator\bin\jom\jom.exe goto end

echo QtCreator jom.exe
cd /d \00_fritzing
if not exist jom_1_1_4.zip DownloadFile https://download.qt.io/official_releases/jom/jom_1_1_4.zip jom_1_1_4.zip
UnZip.exe jom_1_1_4.zip C:\Qt\Tools\QtCreator\bin\jom\

:end
exit


rem include QtCreator
echo   install qt.tools.qtcreator_gui ^^>>qt_inst.bat

