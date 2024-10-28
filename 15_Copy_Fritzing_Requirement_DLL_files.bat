@echo off
rem 15_Copy_Fritzing_Requirement_DLL_files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

copy .\libgit2\build64\Release\git2.dll .\release64
copy .\zlib-src\build64\Release\zlib.dll .\release64
copy .\quazip-6.5.3-1.4\bin\quazip1-qt6.dll .\release64
copy C:\Qt\6.5.3\msvc2019_64\bin\Qt6Core5Compat.dll .\release64

rem for Simulate function
copy .\Spice64_dll\dll-vs\*.dll .\release64

rem for Fritzing 1.0.2
copy .\clipper1-6.4.2\lib\polyclipping.dll .\release64

exit

