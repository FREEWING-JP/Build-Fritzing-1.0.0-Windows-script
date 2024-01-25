@echo off
rem 19_Organize_unnecessary_files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

cd .\release64

mkdir .\_\

move *.cpp .\_\
move *.h .\_\
move *.obj .\_\

powershell compress-archive .\_ _.zip

rmdir /S /Q .\_\

cd ..

exit

