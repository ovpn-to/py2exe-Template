@echo off
set SOURCEDIR=%~dp0.
call %SOURCEDIR%\set_dirs.bat %~1

echo run debug on %BITS% bits
echo PYEXE=%PYEXE%
REM pause

%PYEXE% %SOURCEDIR%\main.py %~2

echo "hit to quit"
pause
