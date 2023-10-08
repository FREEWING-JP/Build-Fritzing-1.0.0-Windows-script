rem 04_Extract_Requirement_Files.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

UnZip.exe boost_1_81_0.zip .
UnZip.exe zlib13.zip .
tar -xf ngspice-40.tar.gz

if not exist 7zr.exe goto 7z_inst

7zr x PortableGit-2.42.0.2-64-bit.7z.exe -o.\PortableGit
7zr x ngspice-40_dll_64.7z -o.\

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
.\7z\7z x ngspice-40_dll_64.7z -o.\

exit

