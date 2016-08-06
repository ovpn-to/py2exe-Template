@echo off
set PY32=C:\Python27
set PY64=C:\Python27_64
set DEFAULT_TO_BITS=32

set INNOCOMPILE="C:\Program Files (x86)\Inno Setup 5\Compil32.exe"
set EXE7Z="%PROGRAMFILES%\7-Zip\7z.exe"

set SIGNTOOL="E:\codesign\bin_w10sdk\signtool.exe"
set SIGNCERTSHA1=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

:: IF NOT EXIST %SIGNTOOL% (echo %SIGNTOOL% NOT FOUND && PAUSE && EXIT)

REM DONT CHANGE DOWN HERE !

set SIGNTOOLCMD1=%SIGNTOOL% sign /v /sha1 %SIGNCERTSHA1% /fd sha1 /t http://timestamp.comodoca.com/?td=sha1
::set SIGNTOOLCMD2=%SIGNTOOL% sign /v /as /sha1 %SIGNCERTSHA1% /fd sha256 /td sha256 /tr http://timestamp.comodoca.com/?td=sha256
::set SIGNTOOLCMD3=%SIGNTOOL% sign /v /as /sha1 %SIGNCERTSHA1% /fd sha384 /td sha384 /tr http://timestamp.comodoca.com/?td=sha384
set SIGNTOOLCMD4=%SIGNTOOL% sign /v /as /sha1 %SIGNCERTSHA1% /fd sha512 /td sha512 /tr http://timestamp.comodoca.com/?td=sha512
set SIGNTOOLVERI=%SIGNTOOL% verify /v /a /all /pa /tw /sha1 %SIGNCERTSHA1% 



set BITS=%~1
set PY32EXE=%PY32%\python.exe
set PY64EXE=%PY64%\python.exe
set PY32GET=%PY32%\Tools\i18n
set PY64GET=%PY64%\Tools\i18n

IF NOT DEFINED "%~1" ( 
	echo '%~0 BITS' not defined, default to %DEFAULT_TO_BITS%
	set BITS=%DEFAULT_TO_BITS%
)

IF "%BITS%" == "32" (
	set PYEXE=%PY32EXE%
	set PYGET=%PY32GET%
)

IF "%BITS%" == "64" (
	set PYEXE=%PY64EXE%
	set PYGET=%PY64GET%
)

IF NOT DEFINED PYEXE (echo MISSING BITS && PAUSE && EXIT)
IF NOT EXIST %PYEXE% (echo PYEXE %PYEXE% NOT FOUND && PAUSE && EXIT)

set INCLUDESDIR=%SOURCEDIR%\includes
set DISTDIR=%SOURCEDIR%\dist%BITS%
set WORKPATH=%SOURCEDIR%\build%BITS%
set BINARY=%DISTDIR%\main.exe

set PY2EXE_LOG=%SOURCEDIR%\py2exe_%BITS%.log
set PY2EXE_ERR=%SOURCEDIR%\py2exe_ERR_%BITS%.log

echo dir vars loaded
echo %SOURCEDIR%
