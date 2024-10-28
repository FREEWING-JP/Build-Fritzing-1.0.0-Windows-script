@echo off
rem 07_Build_Library.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

Path=%cd%\PortableGit\bin;%Path%

rem Visual Studio 2019 Build Tools
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools\Common7\Tools\VsDevCmd.bat"

echo Build Boost
cd boost_1_85_0

rem Visual Studio 16 2019 BuildTools VS2019 14.2
call bootstrap.bat vc142

echo %cd%
set BOOST_DIR=%cd%
set BUILD_JOBS=%NUMBER_OF_PROCESSORS%
rem Visual Studio 16 2019 BuildTools VS2019 14.2
set TOOL_SET=msvc-14.2

b2.exe toolset=%TOOL_SET% link=static runtime-link=static,shared --build-dir=build/x64 address-model=64 -j%BUILD_JOBS% install --includedir=%BOOST_DIR%\include --libdir=%BOOST_DIR%\stage\lib\x64
if not "%ERRORLEVEL%" == "0" goto failed

cd ..

echo Build libgit2
cd libgit2

rmdir /S /Q build64
mkdir build64
cd build64
cmake .. -G "Visual Studio 16 2019" -A x64 -DBUILD_CLAR=OFF
if not "%ERRORLEVEL%" == "0" goto failed

cmake --build . --config Release
if not "%ERRORLEVEL%" == "0" goto failed

cd ..
cd ..

echo Build zlib
cd zlib-src

rmdir /S /Q build64
mkdir build64
cd build64
cmake ..  -G "Visual Studio 16 2019" -A x64
if not "%ERRORLEVEL%" == "0" goto failed

msbuild /P:Configuration=Release  ALL_BUILD.vcxproj
if not "%ERRORLEVEL%" == "0" goto failed

cd ..

rem -- Renaming
rem --     C:/00_fritzing/zlib-1.3/zconf.h
rem -- to 'zconf.h.included' because this file is included with zlib
rem -- but CMake generates it automatically in the build directory.
copy zconf.h.included zconf.h

cd ..

echo Build quazip
cd quazip-1.4

dir ..\zlib-src\build64\Release\zlib.lib

set Qt6_DIR=C:\Qt\6.5.3\msvc2019_64
dir %Qt6_DIR%

rmdir /S /Q build64
mkdir build64
cmake -S . -B build64 ^
  -G "Visual Studio 16 2019" -A x64 ^
  -D QUAZIP_QT_MAJOR_VERSION=6 ^
  -D CMAKE_INSTALL_PREFIX=..\quazip-6.5.3-1.4 ^
  -D QUAZIP_USE_QT_ZLIB=OFF ^
  -D ZLIB_INCLUDE_DIR=..\zlib-src ^
  -D ZLIB_LIBRARY=%cd%\..\zlib-src\build64\Release\zlib.lib
if not "%ERRORLEVEL%" == "0" goto failed

cmake --build build64 --config Release
if not "%ERRORLEVEL%" == "0" goto failed

cmake --build build64 --config Release --target install
if not "%ERRORLEVEL%" == "0" goto failed

cd ..

rem for Fritzing 1.0.2
echo Build clipper1 6.4.2 polyclipping
cd .\clipper1-6.4.2\cpp

rem create lib file SET(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)
powershell -Command "gc CMakeLists.txt | %% { $_ -creplace 'PROJECT\(polyclipping\)', \"PROJECT(polyclipping)`r`nSET(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)\" } > CMakeLists.tmp"
powershell -Command "Get-Content -Encoding UTF8 CMakeLists.tmp" > CMakeLists.txt
del CMakeLists.tmp

rmdir /S /Q build64
mkdir build64
cd build64
cmake .. -G "Visual Studio 16 2019" -A x64 -DBUILD_CLAR=OFF
if not "%ERRORLEVEL%" == "0" goto failed

cmake --build . --config Release
if not "%ERRORLEVEL%" == "0" goto failed

dir .\Release

mkdir ..\..\include
mkdir ..\..\include\polyclipping
copy ..\clipper.hpp ..\..\include\polyclipping\

mkdir ..\..\lib
copy .\Release\ ..\..\lib\

cd ..
cd ..

exit

:failed
@echo off
echo .
echo ===
echo failed
echo ===
:failed_beep
rem Beep
rundll32 user32.dll,MessageBeep
timeout /T 10 /NOBREAK

goto failed_beep

