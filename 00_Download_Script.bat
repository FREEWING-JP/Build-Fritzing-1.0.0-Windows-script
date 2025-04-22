@echo off
rem 00_Download_Script.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
@echo off

rem Configure Qt installation directory (default is C:\Qt)
rem To change the Qt directory, set the QT_INSTALL_DIR environment variable before running this script
rem See README_QT_DIRECTORY.md for detailed instructions
if "%QT_INSTALL_DIR%" == "" set QT_INSTALL_DIR=F:\Qt
echo Using Qt installation directory: %QT_INSTALL_DIR%

rem Configure Fritzing workspace directory (default is \00_fritzing)
rem To change the workspace directory, set the FRITZING_WORKSPACE_DIR environment variable before running this script
rem See README_WORKSPACE_DIRECTORY.md for detailed instructions
if "%FRITZING_WORKSPACE_DIR%" == "" set FRITZING_WORKSPACE_DIR=F:\00_fritzing
echo Using Fritzing workspace directory: %FRITZING_WORKSPACE_DIR%

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

rem Create environment variable file for other scripts
echo set QT_INSTALL_DIR=%QT_INSTALL_DIR%> qt_config.bat
echo set FRITZING_WORKSPACE_DIR=%FRITZING_WORKSPACE_DIR%>> qt_config.bat


