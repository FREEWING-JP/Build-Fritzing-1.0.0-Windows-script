@echo off
rem 19_Organize_unnecessary_files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
rem Load configuration
if exist qt_config.bat call qt_config.bat

cd /d %FRITZING_WORKSPACE_DIR%

cd .\release64

mkdir .\_\

move *.cpp .\_\
move *.h .\_\
move *.obj .\_\

powershell compress-archive .\_ _.zip

rmdir /S /Q .\_\

cd ..

exit

