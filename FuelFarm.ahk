;remake of the  old version for rom may 2023
Version := "1"
#SingleInstance Force
Menu, Tray, Icon, %A_ScriptDir%\fuel.ico
Menu, Tray, NoStandard
Menu, Tray, Color, red
global Title := "nurse" ; mainchar
global Title2:= "asd" ; dummy spawners
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
WinMove, %Title%,,0,0, 533, 331
WinMove, %Title2%,,533,0, 533, 331
Menu, Tray, Icon, %A_ScriptDir%\fuel.ico
DetectHiddenWindows, On
SetTitleMatchMode, 2
fuel := 0
branch := 0

atkon:=[209, 440, 315, 484,"|<>**50$17.kQ7UECU0t01D07rUQa0FU050UG20g60E00U"]
cameramenu:=[420, 122, 448, 144,"|<>0xF2FFFE@0.94$14.lzzzb0sk6MtySTbbslz0zwzzzy"]
camerashutter:=[473, 269, 501, 301,"|<>0xFFF7B9@0.94$17.TzWsD5UDPCDySTtwztty0000E4"]
fueldrop:=[226, 122, 288, 172,"|<>0xDDDCE1@0.94$29.U00k0V2U8IE40G0h/0K01000E"] ; ikut mainchar


#NoEnv
IniRead, gui_position, %A_ScriptFullPath%:Stream:$DATA, window position, gui_position, Center
if gui_position = x y
	gui_position = x772 y315
Gui New, -Resize -MaximizeBox -MinimizeBox , Magic Gear Fuel Bot
Gui +AlwaysOnTop
Gui Font, s9 Bold
Gui, Add, Button, x12 y19 w120 h50 gturnoncamera, Start
Gui, Add, Button, x12 y79 w120 h50 gPause , Pause
Gui, Add, Text,x12 +BackgroundTrans, Wait to summon (sec)
Gui, Add, Edit, x12 w120 -vScroll vWaitDelay number, 13
Gui, Add, Text,x12 +BackgroundTrans, Current Fuel
Gui, Add, Edit, x12 w120 -vScroll vFuel number, 0
Gui, Add, Button, x12 y229 w120 h50 gResetCounter , Reset Counter


Gui, Show, w146 h300 %gui_position%, Magic Gear Fuel Bot

Gui, +Hwndgui_id
return


Gui,2: +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui,2: Color, CCCCCC
Gui,2: Font, cFFFFFF s7 , verdana  ;white
FormatTime, MyTime,, hh:mm:ss tt
Gui,2: Add, Text, y0 BackgroundTrans, Start Time = %mytime%
Gui,2: Add, Text, vCounter x8 y10 BackgroundTrans, Total Fuel(s) = %Fuel%00000
Gui,2: Add, Text, vCounter2 x8 y20 BackgroundTrans, Total Branches(s) = %branch%00000
Gui,2: Show, NoActivate x5 y124,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
#Persistent
setTimer, fuelcounter, 200

if (!ok := FindText(camerashutter[1], camerashutter[2], camerashutter[3], camerashutter[4], 0, 0, camerashutter[5]))
{
    gosub turnoncamera
}
gosub spambranch
return

turnoncamera:

if (!ok := FindText(cameramenu[1], cameramenu[2], cameramenu[3], cameramenu[4], 0, 0, cameramenu[5]))
{
    ClickCoord(445, 56) ; menu
}
ClickCoordWhenFound(cameramenu)
sleep 1000

return

spambranch:
    initialFuel := fuel ; Store the initial value of fuel

    ClickCoord(474, 270,,Title2) ; item slot 1
    branch++

    GuiControl, 2:, Counter2, Total Branches(s) = %branch%
    gosub checkghost
    sleep 1000
    ; Check the value of fuel before and after the ClickCoord action
    if (fuel = initialFuel)
        goto spambranch
    else
        sleep %waitDelay%
        goto spambranch
return

checkghost:
ClickCoordWhenFound(camerashutter)
sleep 1000
while (!ok := FindText(camerashutter[1], camerashutter[2], camerashutter[3], camerashutter[4], 0, 0, camerashutter[5])) {
    ClickCoord(415,291) ; X
    sleep 500
}
return

fuelcounter:
fueldrop:= GenerateCoordinate(fueldrop, Title2)
if (ok := FindText(fueldrop[1], fueldrop[2], fueldrop[3], fueldrop[4], 0, 0, fueldrop[5]))
{
    fuel += 4
    GuiControl,2:, Counter, Total Fuel(s) = %fuel%
}
return

ResetCounter:
branch := 0
fuel:= 0

return

Pause:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptFullPath%:Stream:$DATA, window position, gui_position
MsgBox, 4144, Bot Paused, Hit OK to Resume.
return

GuiClose:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptFullPath%:Stream:$DATA, window position, gui_position
ExitApp


ClickCoord(x, y, sleep := 500, customTitle := "") {
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    ControlClick, x%x% y%y%, %TitleToUse%,, LEFT, 1, NA
    Sleep, %sleep%
    return
}


ClickCoordWhenFound(var, coordinateX:="", coordinateY:="", delay:=500, customTitle:="") {
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    while !(ok := FindText(var[1], var[2], var[3], var[4], 0, 0, var[5])) {
        Sleep, 100
    }

    X := ok.1.x
    Y := ok.1.y
    WinGetPos, WinX, WinY, WinWidth, WinHeight, %TitleToUse%
    realX := X - WinX
    realY := Y - WinY
    if (coordinateX = "")
        coordinateX := realX
    if (coordinateY = "")
        coordinateY := realY
    ControlClick, x%coordinateX% y%coordinateY%, %TitleToUse%,, LEFT, 1, NA
    Sleep, %delay%
    return
}

ClickCoordWhenGone(var, coordinateX:="", coordinateY:="", delay:=500, customTitle:="") {
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    while (ok := FindText(var[1], var[2], var[3], var[4], 0, 0, var[5])) {
        Sleep, 100
    }

    X := ok.1.x
    Y := ok.1.y
    WinGetPos, WinX, WinY, WinWidth, WinHeight, %TitleToUse%
    realX := X - WinX
    realY := Y - WinY
    if (coordinateX = "")
        coordinateX := realX
    if (coordinateY = "")
        coordinateY := realY
    ControlClick, x%coordinateX% y%coordinateY%, %TitleToUse%,, LEFT, 1, NA
    Sleep, %delay%
    return
}

GenerateCoordinate(var, title) { ; title would be the new window to generate
    global
    pict := var
    WinGetPos, x, y, w, h, %Title1% ; the title for first window 0,0
    WinGetPos, x2, y2, w2, h2, %title%
    offsetX := x2 - x
    offsetY := y2 - y
    ; Calculate the absolute coordinates for the button in the specified window
    x1 := offsetX + var[1]
    y1 := offsetY + var[2]
    x2 := offsetX + var[3]
    y2 := offsetY + var[4]
    image := var[5]

    var := [x1, y1, x2, y2, image]

    return var
}


