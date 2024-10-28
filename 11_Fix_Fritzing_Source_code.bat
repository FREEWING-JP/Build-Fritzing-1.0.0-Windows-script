@echo off
rem 11_Fix_Fritzing_Source_code.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

cd fritzing-app

cd .\src\model

rem it fixed Fritzing 1.0.2
rem https://github.com/fritzing/fritzing-app/commit/bd010ce4961bd90505fa540032dfcc97500e364c
rem only for Fritzing 1.0.1 or 1.0.0
rem powershell -Command "gc modelbase.cpp | %% { $_ -creplace 'oldDoc.setContent\(&newFzp\);', 'oldDoc.setContent(&newFzp, nullptr);' } > modelbase.cpp_tmp"

rem ren modelbase.cpp modelbase.cpp_bak
rem del modelbase.cpp
rem ren modelbase.cpp_tmp modelbase.cpp

cd /d \00_fritzing

exit

