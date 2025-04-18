# RR&B Switcher
Command line based refresh rate and brightness switcher for Windows machines.
Uses [Qres](https://github.com/Xcraft-Inc/QRes) to set refresh rate and [Windows Powertoys](https://github.com/microsoft/PowerToys/) to create a keyboard shortcut

## Prerequisite
- Windows PowerToys v0.84.0 or above

## Installation
- In Powertoys, go to `Keyboard Manager` and select `Remap a shortcut` <br><image src="images\keyboard_remap.jpg"><br>
- Set your preferred shortcut key (Win+F1 in my case). Add switchRR.cmd path to `App` and the folder path to `Start in`. Set `Visibility` to Hidden.
<br><image src="images\shortcut.jpg">
- Do the same for `brightness.cmd` with args 1 to increase and 0/no args to decrease brightness by 10.

## Usage
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