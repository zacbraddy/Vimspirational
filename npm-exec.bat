@ECHO OFF
SETLOCAL

REM Speed up by checking for bin directory directly
IF NOT EXIST node_modules\.bin GOTO FINDBIN
SET BIN=.\node_modules\.bin
GOTO RUN

:FINDBIN
REM Find the current bin directory from npm, storing the result in 'BIN'
FOR /f "delims=" %%i IN ('npm bin') DO SET BIN=%%i

:RUN
SET PATH=%BIN%;%PATH%

REM Run the arguments passed into this script, including the script name
%*

ENDLOCAL
