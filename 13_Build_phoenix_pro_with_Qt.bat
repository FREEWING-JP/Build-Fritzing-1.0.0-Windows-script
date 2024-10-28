@echo off
rem 13_Build_phoenix_pro_with_Qt.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

Path=%cd%\PortableGit\bin;%Path%

cd fritzing-app
git show --format='%%H' --no-patch

git rev-parse --git-dir

set currennt_dir=%cd%

echo qtenv2.bat
call C:\Qt\6.5.3\msvc2019_64\bin\qtenv2.bat

echo x64 Native Tools Command Prompt for VS 2019
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\VC\Auxiliary\Build\vcvars64.bat"

cd /d %currennt_dir%

echo qmake
C:/Qt/6.5.3/msvc2019_64/bin/qmake.exe phoenix.pro ^
  -spec win32-msvc ^
  INCLUDEPATH+="..\ngspice-42\src\include"

rem Use svgpp 1.3.1
rem https://github.com/fritzing/fritzing-app/commit/0a53e1b4a5e9752a27d3f11157cc505f3691f20c
rem  INCLUDEPATH+="..\svgpp-1.3.1\include"

C:/Qt/Tools/QtCreator/bin/jom/jom.exe qmake_all


echo Build
C:\Qt\Tools\QtCreator\bin\jom\jom.exe -f Makefile.Release

cd ..

cd .\release64

if not exist Fritzing.exe goto failed

dir Fritzing.exe

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

