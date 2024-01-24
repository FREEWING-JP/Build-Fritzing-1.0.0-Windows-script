@echo off
rem 00_Execute_Script.bat
rem http://www.neko.ne.jp/~freewing/software/build_fritzing_100_windows/
rem Copyright (c) 2023 FREE WING,Y.Sakamoto
echo %0
cd /d \00_fritzing

start /wait 02_Download_Requirement_Files.bat
start /wait 03_Install_Qt_653.bat
start /wait 04_Install_Visual_Studio_Build_Tools_2019.bat
start /wait 05_Extract_Requirement_Files.bat
start /wait 06_Download_from_Git.bat
start /wait 07_Build_Library.bat
start /wait 08_Fix_Library_place_Fritzing.bat

start /wait 09_Download_Fritzing_Source_code.bat
start /wait 10_Download_Fritzing_Parts_Library.bat
start /wait 11_Fix_Fritzing_Source_code.bat
start /wait 12_Fix_Fritzing_Header_files.bat

start /wait 13_Build_phoenix_pro_with_Qt.bat
start /wait 15_Copy_Fritzing_Requirement_DLL_files.bat
start /wait 16_Copy_Qt_Requirement_DLL_files.bat

start /wait 17_1st_Build_Parts_DB_file.bat
start /wait 18_2nd_Launch_Fritzing.bat

start /wait 19_Organize_unnecessary_files.bat
start /wait 20_Create_Fritzing_zip_package.bat

exit

