@echo off
bitsadmin /TRANSFER %2 %1 %cd%\%2

exit /b

