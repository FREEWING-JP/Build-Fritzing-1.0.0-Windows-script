@echo off
rem 00_Download_Script.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
@echo off

rem Load configuration from directories_config.bat if it exists
rem Otherwise, use default values
if exist directories_config.bat (
    echo Loading configuration from directories_config.bat
    call directories_config.bat
) else (
    echo directories_config.bat not found, creating with default values
    rem Configure Qt installation directory (default is C:\Qt)
    if "%QT_INSTALL_DIR%" == "" set QT_INSTALL_DIR=C:\Qt

    rem Configure Fritzing workspace directory (default is \00_fritzing)
    if "%FRITZING_WORKSPACE_DIR%" == "" set FRITZING_WORKSPACE_DIR=\00_fritzing

    rem Configure Visual Studio installation directory
    if "%VS_INSTALL_DIR%" == "" set VS_INSTALL_DIR=C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools

    rem Create the configuration file
    echo @echo off> directories_config.bat
    echo rem directories_config.bat>> directories_config.bat
    echo rem Configuration file for directory paths used in Fritzing build scripts>> directories_config.bat
    echo rem This file is meant to be persistent and can be edited manually>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Qt installation directory>> directories_config.bat
    echo set QT_INSTALL_DIR=%QT_INSTALL_DIR%>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Fritzing workspace directory>> directories_config.bat
    echo set FRITZING_WORKSPACE_DIR=%FRITZING_WORKSPACE_DIR%>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Visual Studio installation directory>> directories_config.bat
    echo set VS_INSTALL_DIR=%VS_INSTALL_DIR%>> directories_config.bat
)

echo Using Qt installation directory: %QT_INSTALL_DIR%
echo Using Fritzing workspace directory: %FRITZING_WORKSPACE_DIR%
echo Using Visual Studio directory: %VS_INSTALL_DIR%

cd \
mkdir %FRITZING_WORKSPACE_DIR%
cd /d %FRITZING_WORKSPACE_DIR%

rem https://github.com/FREEWING-JP/CSharp_DownloadFile
rem echo C# DownloadFile from URL
rem bitsadmin /TRANSFER hoge https://github.com/FREEWING-JP/CSharp_DownloadFile/releases/download/v0.0/DownloadFile.exe %cd%\DownloadFile.exe

echo C# DownloadFile source code from URL
bitsadmin /TRANSFER hoge https://raw.githubusercontent.com/FREEWING-JP/CSharp_DownloadFile/main/DownloadFile.cs %cd%\DownloadFile.cs

echo Build DownloadFile.exe
C:\Windows\Microsoft.NET\Framework\v4.0.30319\csc DownloadFile.cs

rem https://github.com/FREEWING-JP/CSharp_UnZip
echo C# UnZip .Net 4.5
if not exist UnZip.exe DownloadFile https://github.com/FREEWING-JP/CSharp_UnZip/releases/download/v0.0/UnZip.exe UnZip.exe

rem https://github.com/FREEWING-JP/Build-Fritzing-1.0.0-Windows-script
echo Build Fritzing 1.0.0 Windows script
if not exist main.zip DownloadFile https://github.com/FREEWING-JP/Build-Fritzing-1.0.0-Windows-script/archive/refs/heads/main.zip main.zip

UnZip.exe main.zip .

move Build-Fritzing-1.0.0-Windows-script-main\*.* .\
rmdir Build-Fritzing-1.0.0-Windows-script-main

rem Update directories_config.bat if it already exists
if not exist directories_config.bat (
    rem Create the configuration file
    echo @echo off> directories_config.bat
    echo rem directories_config.bat>> directories_config.bat
    echo rem Configuration file for directory paths used in Fritzing build scripts>> directories_config.bat
    echo rem This file is meant to be persistent and can be edited manually>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Qt installation directory>> directories_config.bat
    echo set QT_INSTALL_DIR=%QT_INSTALL_DIR%>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Fritzing workspace directory>> directories_config.bat
    echo set FRITZING_WORKSPACE_DIR=%FRITZING_WORKSPACE_DIR%>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Visual Studio installation directory>> directories_config.bat
    echo set VS_INSTALL_DIR=%VS_INSTALL_DIR%>> directories_config.bat
    echo.>> directories_config.bat
    echo rem Created by 00_Download_Script.bat>> directories_config.bat
)

