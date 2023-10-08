rem 00_Download_Script.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
@echo off

cd \
mkdir \00_fritzing
cd /d \00_fritzing

rem https://github.com/FREEWING-JP/CSharp_DownloadFile
echo C# DownloadFile from URL
bitsadmin /TRANSFER hoge https://github.com/FREEWING-JP/CSharp_DownloadFile/releases/download/v0.0/DownloadFile.exe %cd%\DownloadFile.exe

rem https://github.com/FREEWING-JP/CSharp_UnZip
echo C# UnZip .Net 4.5
if not exist UnZip.exe DownloadFile https://github.com/FREEWING-JP/CSharp_UnZip/releases/download/v0.0/UnZip.exe UnZip.exe

rem https://github.com/FREEWING-JP/Build-Fritzing-1.0.0-Windows-script
echo Build Fritzing 1.0.0 Windows script
if not exist main.zip DownloadFile https://github.com/FREEWING-JP/Build-Fritzing-1.0.0-Windows-script/archive/refs/heads/main.zip main.zip

UnZip.exe main.zip .

move Build-Fritzing-1.0.0-Windows-script-main\*.* .\
rmdir Build-Fritzing-1.0.0-Windows-script-main

