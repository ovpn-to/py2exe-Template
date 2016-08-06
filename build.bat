@echo off
set SOURCEDIR=%~dp0.

call %SOURCEDIR%\set_dirs.bat %~1

IF NOT DEFINED PYEXE (EXIT)

del %SOURCEDIR%\*.pyc
del %SOURCEDIR%\*.pyo

IF EXIST %DISTDIR% rmdir /S /Q %DISTDIR%\
IF EXIST %WORKPATH% rmdir /S /Q %WORKPATH%\

echo hit to compile py2exe: %BINARY%
pause
echo compiling...
%PYEXE% -OO setup.py py2exe 1> %PY2EXE_LOG% 2> %PY2EXE_ERR%
echo py2exe compiled with exitcode %errorlevel%: logfile: %PY2EXE_LOG%

for %%F in (%SOURCEDIR%\py2exe*.log) do if %%~zF equ 0 del %%F
IF EXIST %PY2EXE_ERR% (
	echo errors in py2exe
	notepad.exe %PY2EXE_ERR%
	exit
)

echo py2exe completed


:: cd %DISTDIR%\
:: ..\upx.exe --best *.*
:: cd..

echo py2exe compiled main.py 

if exist %WORKPATH% rmdir /S/Q %WORKPATH%\
pause
