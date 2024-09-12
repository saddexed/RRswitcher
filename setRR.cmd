@ECHO off

REM Find the current refresh rate and set it to the variable
FOR /f "skip=2 tokens=5 delims= " %%a in ('qres /s') do SET rate=%%a

REM Check if %1 is null
IF "%1" == "" goto :min_max

REM Check if %1 is a valid refresh rate
IF "%1" == "60" goto :set_rate
IF "%1" == "75" goto :set_rate
IF "%1" == "90" goto :set_rate
IF "%1" == "120" goto :set_rate
IF "%1" == "144" goto :set_rate

REM If %1 is not a valid refresh rate, then exit
ECHO %1 is an Invalid refresh rate

REM If no arguments are passed, then toggle between 60 and 144
:min_max
IF "%rate%" == "60" (
    SET newrate=144
) ELSE (
    SET newrate=60
)
qres /r:%newrate% > nul
goto :end

:set_rate
SET newrate=%1
qres /r:%newrate% > nul
goto :end

:end
powershell -File "notifyRRchange.ps1" %rate% %newrate%
ECHO Refresh rate changed from %rate% to %newrate%
