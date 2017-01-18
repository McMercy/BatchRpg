@echo off
(
set /p var1=
set /p var2=
set /p var3=
)<test.txt

echo %var1%
echo %var2%
echo %var3%
set /p dummy=press enter to exit...