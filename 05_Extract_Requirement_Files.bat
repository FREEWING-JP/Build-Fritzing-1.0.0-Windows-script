@echo off
rem 05_Extract_Requirement_Files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023-2024 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

UnZip.exe boost_1_85_0.zip .

tar -xf zlib.tar.gz
for /f "usebackq delims=" %%A in (`dir /b ZLIB-*`) do set ZLIB_DIR=%%A
echo %ZLIB_DIR%
ren %ZLIB_DIR% zlib-src

tar -xf ngspice-42.tar.gz

if not exist 7zr.exe goto 7z_inst

7zr x PortableGit-2.42.0.2-64-bit.7z.exe -o.\PortableGit
7zr x ngspice-42_dll_64.7z -o.\

rem for Fritzing 1.0.2
UnZip.exe clipper_ver6.4.2.zip .\clipper1-6.4.2

UnZip.exe openssl-3.0.12.zip .
ren openssl-3.0 openssl-3.0.12
cd openssl-3.0.12
xcopy /R /S .\x64\* .
ren lib lib64

exit


:7z_inst

@echo off
echo Check Admin Plivilege
whoami /groups | find "S-1-16-12288" > nul
if %ErrorLevel% == 0 goto is_admin

echo .
echo ===
echo User Account Control
echo ===
echo Select Yes
rem Beep
rundll32 user32.dll,MessageBeep
pause

:is_admin

echo cd /d %cd%>7z_inst.bat
echo 7z2301-x64.exe /S /D=%cd%\7z>>7z_inst.bat

start /wait powershell "Start-Process -FilePath '7z_inst.bat' -WorkingDirectory '%cd%' -Verb RunAs -Wait"

.\7z\7z x PortableGit-2.42.0.2-64-bit.7z.exe -o.\PortableGit
.\7z\7z x ngspice-42_dll_64.7z -o.\

exit

