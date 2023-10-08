rem 14_Open_phoenix_pro_with_Qt_Creator.bat
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
  INCLUDEPATH+="..\svgpp-1.3.0\include" ^
  INCLUDEPATH+="..\ngspice-40\src\include"

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

