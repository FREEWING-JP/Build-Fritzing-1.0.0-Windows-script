@echo off
rem 02_Download_Requirement_Files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

rem https://git-scm.com/download/win
echo Git - Downloading Package Download for Windows
if not exist PortableGit-2.42.0.2-64-bit.7z.exe DownloadFile https://github.com/git-for-windows/git/releases/download/v2.42.0.windows.2/PortableGit-2.42.0.2-64-bit.7z.exe PortableGit-2.42.0.2-64-bit.7z.exe

rem https://www.7-zip.org/
echo 7-Zip
rem if not exist 7z2301-x64.exe DownloadFile https://www.7-zip.org/a/7z2301-x64.exe 7z2301-x64.exe
if not exist 7zr.exe DownloadFile https://7-zip.org/a/7zr.exe 7zr.exe

rem https://learn.microsoft.com/ja-jp/visualstudio/install/build-tools-container?view=vs-2019
rem Build Tools
echo Visual Studio Build Tools 2019
if not exist vs_BuildTools_2019.exe DownloadFile https://aka.ms/vs/16/release/vs_BuildTools.exe vs_BuildTools_2019.exe

rem Visual Studio Build Tools 2022
rem DownloadFile https://aka.ms/vs/17/release/vs_BuildTools.exe vs_BuildTools_2022.exe

rem https://www.qt.io/download-qt-installer-oss
echo Qt Qt6
if not exist qt-unified-windows-x64-4.6.1-online.exe DownloadFile https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-unified-windows-x64-4.6.1-online.exe qt-unified-windows-x64-4.6.1-online.exe

rem https://www.boost.org/users/history/version_1_85_0.html
echo Boost Version 1.85.0
rem April 15th, 2024 17:38 GMT
if not exist boost_1_85_0.zip DownloadFile https://archives.boost.io/release/1.85.0/source/boost_1_85_0.zip boost_1_85_0.zip

if not exist boost_1_85_0.zip DownloadFile https://sourceforge.net/projects/boost/files/boost/1.85.0/boost_1_85_0.zip boost_1_85_0.zip

echo Check file hash for validate
certutil -hashfile .\boost_1_85_0.zip SHA256 | findstr e712fe7eb1b9ec37ac25102525412fb4d74e638996443944025791f48f29408a
if not "%ERRORLEVEL%" == "0" goto failed

rem https://www.zlib.net/
rem zlib Home Site
echo zlib most recent release
if not exist zlib.tar.gz DownloadFile https://www.zlib.net/current/zlib.tar.gz zlib.tar.gz

rem https://sourceforge.net/projects/ngspice/files/ng-spice-rework/42/
echo ngspice-42 ngspice Files
if not exist ngspice-42.tar.gz DownloadFile https://jaist.dl.sourceforge.net/project/ngspice/ng-spice-rework/old-releases/42/ngspice-42.tar.gz ngspice-42.tar.gz

if not exist ngspice-42_dll_64.7z DownloadFile https://master.dl.sourceforge.net/project/ngspice/ng-spice-rework/old-releases/42/ngspice-42_dll_64.7z ngspice-42_dll_64.7z

rem for Fritzing 1.0.2
rem https://kb.firedaemon.com/support/solutions/articles/4000121705
rem OpenSSL 3.0.12
echo OpenSSL 3.0.12
if not exist openssl-3.0.12.zip DownloadFile https://download.firedaemon.com/FireDaemon-OpenSSL/openssl-3.0.12.zip openssl-3.0.12.zip

rem https://ports.macports.org/port/polyclipping/
rem polyclipping v6.4.2
echo polyclipping v6.4.2
if not exist clipper_ver6.4.2.zip DownloadFile https://jaist.dl.sourceforge.net/project/polyclipping/clipper_ver6.4.2.zip clipper_ver6.4.2.zip

rem check download files
if not exist PortableGit-2.42.0.2-64-bit.7z.exe goto failed
if not exist 7zr.exe goto failed
if not exist vs_BuildTools_2019.exe goto failed
if not exist qt-unified-windows-x64-4.6.1-online.exe goto failed
if not exist boost_1_85_0.zip goto failed
if not exist zlib.tar.gz goto failed
if not exist ngspice-42.tar.gz goto failed
if not exist ngspice-42_dll_64.7z goto failed
rem for Fritzing 1.0.2
if not exist openssl-3.0.12.zip goto failed
if not exist clipper_ver6.4.2.zip goto failed

exit

:failed
@echo off
echo .
echo ===
echo Download Error
echo ===
rundll32 user32.dll,MessageBeep
pause

