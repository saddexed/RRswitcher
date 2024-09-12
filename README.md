# RRswitcher
Command line based refresh rate switcher for Windows machines.
Uses [Qres]("https://github.com/Xcraft-Inc/QRes") to set refresh rate and [Windows Powertoys]("https://github.com/microsoft/PowerToys/") to create a keyboard shortcut

## Prerequisite
- Windows PowerToys v0.84.0 or above

## Installation
1. Either clone the repo or download the repo to C:\ (Any portable apps directory is fine)
2. Add directory to PATH (Optional, only needed for advanced refresh rates)
3. Change switchRR to suit your needs 
    - Change the following code in switchRR as per the the valid refresh rates in your system
        ```cmd
        if "%1" == "60" goto :set_rate
        if "%1" == "75" goto :set_rate
        if "%1" == "90" goto :set_rate
        if "%1" == "120" goto :set_rate
        if "%1" == "144" goto :set_rate
        ```
    - If you only have 2 refresh rates you want to switch between then change the following min_max to your refresh rates. <br> The logic here is: <br>
`if refreshrate is 60, change to 144. else change to 60`
        ```cmd
        :min_max
        IF "%rate%" == "60" (
            SET newrate=144
        ) ELSE (
            SET newrate=60
        )
        ```
    - In Powertoys, go to `Keyboard Manager` and select `Remap a shortcut`
    <br><image src="images\keyboard_remap.jpg"><br>
    Set your preferred shortcut key (Win+F1 in my case). Add switchRR.cmd path to `App` and the folder path to `Start in`. Set `Visibility` to Hidden.
    <br><image src="images\shortcut.jpg">

## Useage
- Use your defined shortcut key to trigger RR change.
- If added to PATH :
    - `getRR` to get current refresh rate
    - `switchRR` to change between your minimum and maximum refresh rate
    - `switchRR (your refresh rate)` to change to defined rate. e.g. `switchRR 90`

## Credits
QRes by Anders Kjersem

## TODO
- Make a script/find a way to automatically add dir to path
- Include CRU (Custom Resolution Utility) if needed with instructions