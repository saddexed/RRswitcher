@echo off
REM Skip two lines, break at every space, output after 5th space
FOR /f "skip=2 tokens=5 delims= " %%a in ('qres /s') do SET rate=%%a
echo Running at %rate%Hz