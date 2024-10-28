@echo off
rem 04_Install_Visual_Studio_Build_Tools_2019.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
timeout /T 10 /NOBREAK
cd /d \00_fritzing

if exist "C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools" exit


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

echo { > VSBT_VS2019.vsconfig
echo   "version": "1.0", >> VSBT_VS2019.vsconfig
echo   "components": [ >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.Roslyn.Compiler", >> VSBT_VS2019.vsconfig
echo     "Microsoft.Component.MSBuild", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.CoreBuildTools", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Workload.MSBuildTools", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.Windows10SDK", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.VC.CoreBuildTools", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.VC.Tools.x86.x64", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.VC.Redist.14.Latest", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.Windows10SDK.19041", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.VC.CMake.Project", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.TestTools.BuildTools", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.VC.ASAN", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.TextTemplating", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Component.VC.CoreIde", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.ComponentGroup.NativeDesktop.Core", >> VSBT_VS2019.vsconfig
echo     "Microsoft.VisualStudio.Workload.VCTools" >> VSBT_VS2019.vsconfig
echo   ] >> VSBT_VS2019.vsconfig
echo } >> VSBT_VS2019.vsconfig

set VSDIR=%cd%
vs_BuildTools_2019.exe --config %VSDIR%\VSBT_VS2019.vsconfig ^
  --norestart --passive --wait

exit

