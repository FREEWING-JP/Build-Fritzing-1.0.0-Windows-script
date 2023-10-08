rem 11_Fix_Library_place_Fritzing.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

dir .\quazip_qt6\include\QuaZip-Qt6-1.4\quazip
xcopy .\quazip_qt6\include\QuaZip-Qt6-1.4\quazip .\quazip_qt6\include\quazip\

dir .\quazip_qt6\bin
dir .\quazip_qt6\lib
xcopy .\quazip_qt6\bin .\quazip_qt6\build64\Release\
xcopy .\quazip_qt6\lib\*.lib .\quazip_qt6\build64\Release\
dir .\quazip_qt6\build64\Release\

exit

