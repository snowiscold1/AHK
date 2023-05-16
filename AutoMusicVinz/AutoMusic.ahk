Menu, Tray, Icon, shell32.dll, 44
Menu, Tray, NoStandard
Menu, Tray, Add, config
Menu, Tray, Add, Exit
Menu, Tray, Color, red
#NoEnv

#SingleInstance, force

iFNotExist settings.ini
gosub config

IniRead, Title , %A_ScriptDir%\settings.ini, EmuTitle, Title:
WinMove, %Title%,,0,0, 800, 491
DetectHiddenWindows, On
SetTitleMatchMode, 3
Gui, New, -Resize -MaximizeBox -MinimizeBox , Automusic by Fern
Gui, Font, s9 Bold
Gui, Add, Edit, x26 y54 w110 h30 +Number -vScroll vDelayClick, 2
Gui, Add, Edit, x26 y119 w110 h30 -vScroll  vSwitchTime, 0630
Gui, Add, Edit, x26 y189 w110 h30 -vScroll  vSwitchTime2, 0705
Gui, Add, Button, x31 y239 w100 h50 gStart, Start
Gui, Add, Text, x21 y19 w120 h30 +Center , Delay between clicks (sec)
Gui, Add, Text, x22 y89 w120 h30 +Center , First Switch Time (HHMM)
Gui, Add, Text, x22 y159 w120 h30 +Center , Second Switch Time (HHMM)
Gui, Show, w166 h300, AutoMusic by Fern
return

GuiClose:
ExitApp






Start:
Gui, Submit, Destroy
delay := % DelayClick*1000
IniRead, moreX , %A_ScriptDir%\settings.ini, Hotkeys, moreX:
IniRead, moreY , %A_ScriptDir%\settings.ini, Hotkeys, moreY:
IniRead, settingsX , %A_ScriptDir%\settings.ini, Hotkeys, settingsX:
IniRead, settingsY , %A_ScriptDir%\settings.ini, Hotkeys, settingsY:
IniRead, avatarX , %A_ScriptDir%\settings.ini, Hotkeys, avatarX:
IniRead, avatarY , %A_ScriptDir%\settings.ini, Hotkeys, avatarY:
IniRead, char1X , %A_ScriptDir%\settings.ini, Hotkeys, char1X:
IniRead, char1Y , %A_ScriptDir%\settings.ini, Hotkeys, char1Y:
IniRead, confirmX , %A_ScriptDir%\settings.ini, Hotkeys, confirmX:
IniRead, confirmY , %A_ScriptDir%\settings.ini, Hotkeys, confirmY:
IniRead, closeeventX , %A_ScriptDir%\settings.ini, Hotkeys, closeeventX:
IniRead, closeeventY , %A_ScriptDir%\settings.ini, Hotkeys, closeeventY:
IniRead, char2X , %A_ScriptDir%\settings.ini, Hotkeys, char2X:
IniRead, char2Y , %A_ScriptDir%\settings.ini, Hotkeys, char2Y:






switch1:
timer(switchtime)
tooltip, switching..
ControlClick, x%moreX% y%moreY%, %Title%,, LEFT, 1, NA ;more
sleep %delay%
ControlClick, x%settingsX% y%settingsY%, %Title%,, LEFT, 1, NA ;settings
sleep %delay%
ControlClick, x%avatarX% y%avatarY%, %Title%,, LEFT, 1, NA ;avatar
sleep %delay%
ControlClick, x%char1X% y%char1Y%, %Title%,, LEFT, 1, NA ;char 1
sleep %delay%
ControlClick, x%confirmX% y%confirmY%, %Title%,, LEFT, 1, NA ;confirm
tooltip,
sleep 40000
ControlClick, x%closeeventX% y%closeeventY%, %Title%,, LEFT, 1, NA ;closeevent


switch2:
timer(switchtime2)
tooltip, switching...
ControlClick, x%moreX% y%moreY%, %Title%,, LEFT, 1, NA ;more
sleep %delay%
ControlClick, x%settingsX% y%settingsY%, %Title%,, LEFT, 1, NA ;settings
sleep %delay%
ControlClick, x%avatarX% y%avatarY%, %Title%,, LEFT, 1, NA ;avatar
sleep %delay%
ControlClick, x%char2X% y%char2Y%, %Title%,, LEFT, 1, NA ;char 2
sleep %delay%
ControlClick, x%confirmX% y%confirmY%, %Title%,, LEFT, 1, NA ;confirm
tooltip,
sleep 40000
ControlClick, x%closeeventX% y%closeeventY%, %Title%,, LEFT, 1, NA ;closeevent

return





^O::
Config:
MsgBox, 4112, File not found, You have no saved configuration. Login to your MAIN character and press OK when you are ready to configure your hotkey.

Tooltip, Plese click on your emulator window you wish to use this app.
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, xpos, ypos, id, control
WinGetTitle, title, ahk_id %id%
IniWrite, % Title, settings.ini, EmuTitle, Title:
Tooltip, Your emulator window is %title%
sleep 1000
IniRead, Title , %A_ScriptDir%\settings.ini, EmuTitle, Title:
WinMove, %Title%,,0,0, 800, 491

sleep 2000

Tooltip, Please Select More
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, MoreX, MoreY
IniWrite, % moreX, settings.ini, Hotkeys, moreX:
IniWrite, % moreY, settings.ini, Hotkeys, moreY:
ToolTip, Your More button is at %moreX% %moreY%!
sleep 2000

Tooltip, Please Select Settings
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, settingsX, settingsY
IniWrite, % settingsX, settings.ini, Hotkeys, settingsX:
IniWrite, % settingsY, settings.ini, Hotkeys, settingsY:
ToolTip, Your Settings button is at %settingsX% %settingsY%!
sleep 2000


Tooltip, Please Select your avatar on Settings
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, avatarX, avatarY
IniWrite, % avatarX, settings.ini, Hotkeys, avatarX:
IniWrite, % avatarY, settings.ini, Hotkeys, avatarY:
ToolTip, Your avatar is at %avatarX% %avatarY%!
sleep 2000

Tooltip, Please Select your 1st char to switch
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, char1X, char1Y
IniWrite, % char1X, settings.ini, Hotkeys, char1X:
IniWrite, % char1Y, settings.ini, Hotkeys, char1Y:
ToolTip, Your 1st char avatar is at %char1X% %char1Y%!
sleep 2000

Tooltip, Click Confirm button to switch
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, confirmX, confirmY
IniWrite, % confirmX, settings.ini, Hotkeys, confirmX:
IniWrite, % confirmY, settings.ini, Hotkeys, confirmY:
ToolTip, Your confirm button is at %confirmX% %confirmY%!
sleep 2000

Tooltip, Please wait and close the event window when it pops up. Do not use your mouse till then.
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, closeeventX, closeeventY
IniWrite, % closeeventX, settings.ini, Hotkeys, closeeventX:
IniWrite, % closeeventY, settings.ini, Hotkeys, closeeventY:
ToolTip, Your close event button is at %closeeventX% %closeeventY%!
sleep 2000
msgbox, Please go to More > Settings > Tap on switch avatar and Press OK when you are there.
sleep 1000

Tooltip, Now select the 2nd character to switch.
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, char2X, char2Y
IniWrite, % char2X, settings.ini, Hotkeys, char2X:
IniWrite, % char2Y, settings.ini, Hotkeys, char2Y:
ToolTip, Your 2nd char avatar is at %char2X% %char2Y%!
sleep 2000
Tooltip,

msgbox, New configuration saved. Please park all your character at music box. 


return













;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
timer(sec){
 
target_time = %sec%
target = %A_YYYY%%A_MM%%A_DD%%target_time%00
if (target < A_Now)
{  
    EnvAdd, target, 1, d
}
EnvSub, target, %A_Now%, Seconds.
Sleep, % target * 1000 
}

Exit:
ExitApp
Esc::ExitApp


;~ #NoEnv
;~ #NoTrayIcon
;~ #SingleInstance, force
;~ NumberOfHotkeys=7

;~ iFNotExist settings.ini
;~ Loop %NumberOfHotkeys%
;~ {
    ;~ InputBox, Hotkey%A_Index%, Hotkeys, Enter hotkey %A_Index%:
    ;~ IniWrite, % Hotkey%A_Index%, settings.ini, Hotkeys, Hotkey%A_Index%
	;~ msgbox, % A_Index
;~ }
;~ else Loop %NumberOfHotkeys%
    ;~ IniRead, Hotkey%A_Index%, settings.ini, Hotkeys, Hotkey%A_Index%
;~ Loop %NumberOfHotkeys%
    ;~ Gui, Add, Hotkey,% "x22 y" 59+(40*A_Index) " w70 h30 vHotkey" A_Index,% Hotkey%A_Index%
;~ Gui, Add, Button, x112 y439 w70 h30 gbuttonclick, Click Me
;~ Gui, Add, GroupBox, x2 y419 w100 h60 +Center, Check
;~ Gui, Add, GroupBox, x102 y419 w90 h60 +Center, Activate
;~ Gui, Show, x299 y156 h489 w193, test
;~ Return

;~ GuiClose:
;~ ExitApp

;~ buttonclick:
;~ Gui, submit, nohide
;~ Loop %NumberOfHotkeys%
;~ {
    ;~ iF(Hotkey%A_Index%="")
        ;~ MsgBox, 16,, Hotkey number %A_Index% is invalid/missing
    ;~ else Hotkey,% Hotkey%A_Index%,slot1
;~ }
;~ return

;~ slot1:
;~ MsgBox This works
;~ iFWinActive, My job review
    ;~ Click, 256 457
;~ return    

;~ CapsLock::Suspend, toggle
;~ return