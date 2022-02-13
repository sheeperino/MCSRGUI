#NoEnv
#SingleInstance Force
#Include settings.ahk

Gui, Add, Button, x102 y-1 w90 h30 , OBS
Gui, Add, Button, x2 y-1 w100 h30 , Multi MC
Gui, Add, Button, x2 y29 w100 h30 , Reset Macro
Gui, Add, Button, x102 y29 w90 h30 , Ninjabrain Bot
Gui, Add, Button, x102 y59 w90 h30 , Launch Instance(s)
Gui, Add, Button, x2 y59 w100 h30 , Delete Worlds
Gui, Add, Button, x2 y89 w100 h30 , Open Config
Gui, Add, Button, x102 y89 w90 h30 , Change Seed
Gui, Add, Button, x197 y14 w100 h30 , Launch All
Gui, Add, Button, x197 y44 w100 h30 , End All
Gui, Add, Button, x197 y74 w100 h30 , Exit
Gui, Add, Text, x2 y125 w260 h30 , Please press "Open Config" and configure the script if you haven't yet.
Gui, Show, h155 w307, SRSU
Return


ButtonOBS:
Run, %obsDir%
return
ButtonMultiMC:
Run, %multimcDir%
return
ButtonResetMacro:
Run, %resetDir%
return
ButtonNinjabrainBot:
Run, %calcDir%
return

ButtonDeleteWorlds:
Warning("remove", "world")
Run, %A_WorkingDir%\resources\DeleteWorlds.py,, Hide
return

ButtonChangeSeed:
Warning("change", "seed")
Run, %A_WorkingDir%\resources\ChangeSeed.py,, Hide
return

ButtonLaunchInstance(s):
Run, %A_WorkingDir%\resources\InstanceLaunch.py ;,, Hide
return

ButtonExit:
ExitApp

ButtonOpenConfig:
Run, notepad settings.ahk
Return

ButtonLaunchAll:
If (launchObs)
    run, % obsDir
If (launchMMC)
    run, % multimcDir
If (launchCalc)
    run, % calcDir
If (launchMacro)
    run, % resetDir
If (deleteWorld)
    Run, %A_WorkingDir%\resources\DeleteWorlds.py,, Hide
If (launchInst)
    Run, %A_WorkingDir%\resources\InstanceLaunch.py ;,, Hide
WinWait, Minecraft
WinKill, ahk_exe C:\Windows\py.exe
return

ButtonEndAll:
if (killObs)
    WinKill, OBS
if (killInst) {
    GroupAdd instances, Minecraft
    WinKill, ahk_group instances
}
if (killMMC)
    WinKill, ahk_exe MultiMC.exe
if (killCalc)
    WinKill, Ninjabrain Bot
if (killMacro) {
    DetectHiddenWindows, On 
    WinKill, %resetdir% ahk_class AutoHotkey
}
if (killtracker)
   WinKill, %trackerDir%
return

GuiClose:
ExitApp

global instanceFolder := instanceFolder
Warning(action, element) {
    MsgBox, 4, , This will %action% every %element% in %instanceFolder%.`nDo you wish to continue?
    IfMsgBox No
        return
}