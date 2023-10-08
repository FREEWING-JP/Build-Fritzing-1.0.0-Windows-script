rem 10_Fix_Fritzing_Source_code.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

cd fritzing-app

cd .\src\model

powershell -Command "gc modelbase.cpp | %% { $_ -creplace 'oldDoc.setContent\(&newFzp\);', 'oldDoc.setContent(&newFzp, nullptr);' } > modelbase.cpp_tmp"

rem ren modelbase.cpp modelbase.cpp_bak
del modelbase.cpp
ren modelbase.cpp_tmp modelbase.cpp

cd /d \00_fritzing

exit

