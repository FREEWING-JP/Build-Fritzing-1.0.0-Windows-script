@echo off
rem 17_1st_Build_Parts_DB_file.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

cd .\release64

@echo off
echo .
echo ===
echo * 1st execute to create parts.db DB file
Fritzing.exe -f "..\fritzing-app\" -parts "..\release64\fritzing-parts\" -db "..\release64\fritzing-parts\parts.db"
rem Beep
rundll32 user32.dll,MessageBeep

cd ..

exit

