@echo off
rem 01_Create_Build_directory.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
rem Configure Fritzing workspace directory (default is \00_fritzing)
if "%FRITZING_WORKSPACE_DIR%" == "" set FRITZING_WORKSPACE_DIR=\00_fritzing
echo Using Fritzing workspace directory: %FRITZING_WORKSPACE_DIR%

cd \
mkdir %FRITZING_WORKSPACE_DIR%
cd /d %FRITZING_WORKSPACE_DIR%

