@echo off
rem 06_Download_from_Git.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

Path=%cd%\PortableGit\bin;%Path%

rem https://github.com/stachenov/quazip/releases
echo QuaZip v1.4
git clone https://github.com/stachenov/quazip -b v1.4 quazip-1.4

rem https://github.com/svgpp/svgpp/releases/tag/v1.3.1
echo SVG++ library 1.3.1
git clone https://github.com/svgpp/svgpp -b v1.3.1 svgpp-1.3.1

rem https://github.com/libgit2/libgit2/releases/tag/v0.28.5
echo libgit2 v0.28.5
git clone https://github.com/libgit2/libgit2 -b v0.28.5

exit

