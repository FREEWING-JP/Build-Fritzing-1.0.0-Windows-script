@echo off
rem 20_Fix_Language_Filename.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

echo =======================
echo =======================
echo =======================
cd release64
dir release64
echo =======================
echo =======================
echo =======================
pause

if exist translations (
  cd translations
)

if exist qt_*.qm (
  setlocal EnableDelayedExpansion
  ren qt_*.* q`_*.*
  for /f "tokens=1,2 delims=`" %%i in ('dir /b q`*.*') do (
    ren "q`%%j" "fritzing%%j"
  )
  endlocal

  echo Fixed Language translations file name .
)

cd /d \00_fritzing

exit

