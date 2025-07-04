@echo off
rem 12_Fix_Fritzing_Header_files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
rem Load configuration
if exist directories_config.bat call directories_config.bat

cd /d %FRITZING_WORKSPACE_DIR%

Path=%cd%\PortableGit\bin;%Path%

cd fritzing-app

if not exist ..\fritzing_h\ goto qmake_jom

xcopy ..\fritzing_h\ ..\debug64\
xcopy ..\fritzing_h\ ..\release64\

cd ..

exit


:qmake_jom

set currennt_dir=%cd%

echo qtenv2.bat
call %QT_INSTALL_DIR%\6.5.3\msvc2019_64\bin\qtenv2.bat

echo x64 Native Tools Command Prompt for VS 2019
call "%VS_INSTALL_DIR%\VC\Auxiliary\Build\vcvars64.bat"

cd /d %currennt_dir%

%QT_INSTALL_DIR%\6.5.3\msvc2019_64\bin\qmake.exe -o Makefile phoenix.pro "QMAKE_TARGET.arch=x86_64"
%QT_INSTALL_DIR%\Tools\QtCreator\bin\jom\jom.exe -f Makefile.Debug compiler_uic_make_all
DIR ..\debug64\ui_*.h
xcopy ..\debug64\*.h ..\fritzing_h\
xcopy ..\fritzing_h\ ..\release64\

cd ..

exit

