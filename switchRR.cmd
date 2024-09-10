@echo off

REM Find the current refresh rate and set it to the variable
FOR /f "skip=2 tokens=5 delims= " %%a in ('qres /s') do SET rate=%%a

REM Check if %1 is not null
if "%1" == "" goto :min_max
REM Check if %1 is a valid refresh rate
if "%1" == "60" goto :set_rate
if "%1" == "75" goto :set_rate
if "%1" == "90" goto :set_rate
if "%1" == "120" goto :set_rate
if "%1" == "144" goto :set_rate
REM If %1 is not a valid refresh rate, then exit
echo %1 is an Invalid option
goto :EOF

REM If no arguments are passed, then toggle between 60 and 144
:min_max
if "%rate%" == "60" (
    qres /r:144 > nul
    set newrate=144
    goto :end
) else (
    qres /r:60 > nul
    set newrate=60
    goto :end
)

:set_rate
qres /r:%1 > nul
set newrate=%1
goto :end

:end
powershell -File "C:\Programs\Qres\notifyRRchange.ps1" %rate% %newrate%
echo Refresh rate changed from %rate% to %newrate%
