#SingleInstance Force
#Include %A_ScriptDir%\configure.ahk
WinGetPos, EmuX, EmuY, Width, Height, %Title%
Menu, Tray, Icon, %A_ScriptDir%\icon.ico
IniRead, gui_position, %A_ScriptFullPath%:Stream:$DATA, window position, gui_position, Center
DetectHiddenWindows, On
SetTitleMatchMode, 3
;~ Winclose, %A_ScriptDir%\FernMVPv6_Prontera.ahk - AutoHotkey v1.1.30.01 ahk_class AutoHotkey

FlyTime := 0
MVPTele := 0
mvpspawn := 0
FlyTime2 := 0
mvpspawn2 := 0


GuiStart:
IniRead, gui_position, %A_ScriptFullPath%:Stream:$DATA, window position, gui_position, Center
Gui,1: New, -Resize -MaximizeBox -MinimizeBox , Automated MVP/Mini Hunter by Fern 
Gui,1: +AlwaysOnTop
Gui,1:Font, s8 Bold, Arial
Gui,1: Margin, 10, 10
Gui,1: Color, E26665
Gui,1: Add, Text, center cWhite w210 , Use at your own risk.
Gui,1: Add, Button, x12 y29 w100 h30 vStart gscanner, Start
Gui,1: Add, Button, x122 y29 w100 h30 gResetPos, Reset Position
Gui,1: Add, Button, x12 y60 w100 h30 gIFMVPSpawn, Find MVP
Gui,1: Add, Button, x122 y60 w100 h30 gInfo , Info
Gui,1: Add, Button, x12 y114 w210 h30 gGroupTeleport, Group Teleport
Gui,1: Add, Button, x12 y145 w210 h30 gReloadBot, ReloadBot
Gui,1: Add,DropDownList, x12 y91 w210  vMVPLIST sort,Smokie|EclipseSouthGate|EclipseLabyrinth|Mastering|VocalWestGate|VocalLabyrinth|Angeling|GoldenThiefBug|Deviling|Ghostring|Drake|Toad|Strouf|RotarZairo|GoblinLeader|DragonFly|Mistress|VagabondWolf|Maya|Phreeoni|WoodGoblin|Edgga|Gryphon|Anubis|Osiris|Hyegun|MoonlightFlower|OrcBaby|OrcHero|Jakk|Doppelganger|Atroce|MutantDragon|OrcLord|Rafflesia|Detarderous|OwlDuke|Mystletainn|Alice|OwlBaron|Zherlthsh|DarkIllusion|Baphomet|DarkLord|Clock|ClockTowerManager|StormyKnight|Chepet
Gui,1:Font, s7, Arial
Gui,1: Add, Checkbox, x12 y180 w210 vMusic, Listen music after killing MVP.(Only at PronteraSouth)
Gui,1: Show, x1364 y753 %gui_position% , MVP/Mini Bot by Fern
Gui,1: +Hwndgui_id
return

ResetPos:
WinMove, %Title%,,0,0, 800, 491	
WinGetPos, EmuX, EmuY, Width, Height, %Title%
return

GroupTeleport:
Gui,1: Submit, NoHide
gosub Teleport
gosub %MVPList%	
return

Q::
ReloadBot:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptFullPath%:Stream:$DATA, window position, gui_position
reload
return

Teleport:
x:=ButterflyWingArea[1], y:=ButterflyWingArea[2], w:=ButterflyWingArea[3], h:=ButterflyWingArea[4]
While(!ok:=FindText(x,y,w,h,0,0,ButterflyWing)) {
}

{
CoordMode, Mouse
 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}

sleep 500
x:=KafraArea[1], y:=KafraArea[2], w:=KafraArea[3],h:=KafraArea[4]
While(!ok:=FindText(x,y,w,h,0,0,Kafra)) {
	Tooltip, WaitingForKafra
}
sleep 500
{
CoordMode, Mouse
 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}

x:=KafraMenuArea[1], y:=KafraMenuArea[2], w:=KafraMenuArea[3], h:=KafraMenuArea[4]
While(!ok:=FindText(x,y,w,h,0,0,KafraMenu)) {
	Tooltip, WaitingForMenu
}

{
CoordMode, Mouse
 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
sleep 300
return
}

;;Mini/mvp list

Smokie:
gosub Area1
gosub Map2
return

EclipseSouthGate:
gosub Area1
gosub Map2
return

EclipseLabyrinth:
gosub Area1
gosub slideup
gosub Map2
return

Mastering:
gosub Area1
gosub slideup
gosub Map2
return

VocalWestGate:
gosub Area1
gosub slideup
gosub Map1
return

VocalLabyrinth:
gosub Area1
gosub slideup
gosub Map2
return

Angeling:
gosub Area1
gosub Map2
return

GoldenThiefBug:
gosub Area1
gosub Map4
return

Deviling:
gosub Area1
gosub slideup
gosub Map2
return

Ghostring:
gosub Area1
gosub slideup
gosub slideup
gosub Map1
return

Drake:
gosub Area1
gosub slideup
gosub slideup
gosub Map1
return

Toad:
gosub Area1
gosub slideup
gosub slideup
gosub Map3
return

Strouf:
gosub Area1
gosub slideup
gosub slideup
gosub Map4
return

RotarZairo:
gosub Area2
gosub slideup
gosub Map2
return

GoblinLeader:
gosub Area2
gosub slideup
gosub Map2
return

DragonFly:
gosub Area2
gosub Map2
return

Mistress:
gosub Area2
gosub Map2
return

VagabondWolf:
gosub Area3
gosub Map2
return

Maya:
gosub Area3
gosub Map1
return

Phreeoni:
gosub Area3
gosub slideup
gosub Map2
return

WoodGoblin:
gosub Area4
gosub Map2
return

Edgga:
gosub Area4
gosub slideup
gosub Map2
return

Gryphon:
gosub Area4
gosub slideup
gosub Map2
return

Anubis:
gosub Area3
gosub Map4
return

Osiris:
gosub Area3
gosub Map4
return

Hyegun:
gosub Area4
gosub Map4
return

MoonlightFlower:
gosub Area4
gosub Map4
return

OrcBaby:
gosub Area2
gosub Map3
return

OrcHero:
gosub Area2
gosub Map3
return

Jakk:
gosub Area2
gosub Map4
return

Doppelganger:
gosub Area2
gosub Map4
return

Atroce:
gosub Area4
gosub Map2
return

MutantDragon:
gosub slideup
gosub Area1
gosub Map1
return

OrcLord:
gosub Area2
gosub slideup
gosub Map1
return

Rafflesia:
gosub Area1
gosub slideup
gosub slideup
gosub slideup
gosub Map4
return

Detarderous:
gosub slideup
gosub Area1
gosub Map1
return

OwlDuke:
gosub slideup
gosub Area1
gosub Map2
return

OwlBaron:
gosub slideup
gosub Area1
gosub Map2
return

Zherlthsh:
gosub slideup
gosub Area1
gosub slideup
gosub Map1
return

Mystletainn:
gosub slideup
gosub Area1
gosub Map3
return

Alice:
gosub slideup
gosub Area1
gosub Map4
return

DarkIllusion:
gosub slideup
gosub Area1
gosub Map2
return

Baphomet:
gosub slideup
gosub Area1
gosub slideup
gosub Map1
return

DarkLord:
gosub slideup
gosub Area1
gosub Map2
return

Clock:
gosub slideup
gosub Area2
gosub Map2
return

ClockTowerManager:
gosub slideup
gosub Area2
gosub Map3
return

Chepet:
gosub slideup
gosub Area3
gosub Map3
return

StormyKnight:
gosub slideup
gosub Area3
gosub Map2
return

;Area Teleport

Area1:
ControlClick, x410 y225, %Title%,, LEFT, 1, NA
sleep 500
return

Area2:
ControlClick, x410 y272, %Title%,, LEFT, 1, NA
sleep 500
return

Area3:
ControlClick, x410 y321, %Title%,, LEFT, 1, NA
sleep 500
return

Area4:
ControlClick, x410 y370, %Title%,, LEFT, 1, NA
sleep 500
return

Map1:
gosub TeleportButtonLocationX
ControlClick, x%x% y222, %Title%,, LEFT, 1, NA
sleep 500
return

Map2:
gosub TeleportButtonLocationX
ControlClick, x%x% y272, %Title%,, LEFT, 1, NA
sleep 500
return

Map3:
gosub TeleportButtonLocationX
ControlClick, x%x% y322, %Title%,, LEFT, 1, NA
sleep 500
return

Map4:
gosub TeleportButtonLocationX
ControlClick, x%x% y372, %Title%,, LEFT, 1, NA
sleep 500
return

SlideUp:
CoordMode,Mouse, Screen
Click, 340,387, Down
sleep 300
Click, 340, 200, 0
sleep 300
Click, 340, 200, Up
sleep 300
return


TeleportButtonLocationX:
x:=TeleportZArea[1], y:=TeleportZArea[2], w:=TeleportZArea[3], h:=TeleportZArea[4]
		if (ok:=FindText(x,y,w,h, 0, 0, TeleportZ))  
		{
		CoordMode, Mouse
		X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		}
		else
		{
			msgbox, notfound
		}
return

GuiClose:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%, %A_ScriptFullPath%:Stream:$DATA, window position, gui_position
ExitApp


Scanner:
Gui,1: Submit, NoHide
FirstTime=0
if (Music=1)
{
Run %A_ScriptDir%/FernMVPv6_Prontera.ahk ahk_class AutoHotkey
}

x:=MVPpopupArea[1], y:=MVPpopupArea[2], w:=MVPpopupArea[3], h:=MVPpopupArea[4]
While(!ok:=FindText(x,y,h,w,0,0,MVPpopup)) {
	if (FirstTime=0)
	{
	TrayTip , FernBot, Waiting For MVP/Mini... , 4 ;show for 4 seconds
	FirstTime++
	}
}

goto IfMVPSpawn


IfMVPSpawn:
Gui,1: Submit, NoHide
WinActivate, %Title%
TrayTip , FernBot, Locating MVP/Mini.. , 4 ;show for 4 seconds
mvpspawn++
mvpspawn2++

x:=AttackButtonArea[1], y:=AttackButtonArea[2], w:=AttackButtonArea[3], h:=AttackButtonArea[4]
if (ok:=FindText(x,y,w,h, 0, 0, AttackButtonOff))  
		{
		CoordMode, Mouse
		 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 300
		goto AttackMVP
		}
	
if (ok:=FindText(x,y,w,h, 0, 0, AttackButtonOn))  
		{
		CoordMode, Mouse
		 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		Sleep 500
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 300
		goto AttackMVP
		}

Flywing:

if (Flytime<25)
	{
		x:=FlywingArea[1], y:=FlywingArea[2], w:=FlywingArea[3], h:=FlywingArea[4]
		if (ok:=FindText(x,y,w,h,0,0, Flywing))  
		{
		FlyTime++
		FlyTime2++
		CoordMode, Mouse
		 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		Sleep 300
		x:=AttackButtonArea[1], y:=AttackButtonArea[2], w:=AttackButtonArea[3], h:=AttackButtonArea[4]
		if (ok:=FindText(x,y,w,h, 0, 0, AttackButtonOff))  
		{
		CoordMode, Mouse
		 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		}
		Sleep 300
		goto AttackMVP
		}
		
		else
			
		{
		Sleep 100
		goto Flywing
		}
	}
		
		else
			
	{	
		x:=AttackButtonArea[1], y:=AttackButtonArea[2], w:=AttackButtonArea[3], h:=AttackButtonArea[4]
		if (ok:=FindText(x,y,w,h, 0, 0, AttackButtonOff))  
		{
		CoordMode, Mouse
		 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		}
		if (Music=1)
			{
		WinActivate, %Title%
		Sleep 1000
		Send %MiniMapClick%
		Sleep 1000
		Send %MiniMapPos%
		Sleep 1000
		Send %MiniMapClick%
		MVPTele := 0
		FlyTime := 0
		WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
		IniWrite, x%gui_x% y%gui_y%,%A_ScriptFullPath%:Stream:$DATA, window position,gui_position
		Goto scanner
			}
		else 
		{
		MVPTele := 0
		FlyTime := 0
		WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
		IniWrite, x%gui_x% y%gui_y%,%A_ScriptFullPath%:Stream:$DATA, window position, gui_position
		Goto GuiStart
		}
	}
	

		AttackMVP:
		x:=MVPattackArea[1], y:=MVPattackArea[2], w:=MVPattackArea[3], h:=MVPattackArea[4]
		if (ok:=FindText(x,y,w,h, 0, 0, MVPattack))
		{
			CoordMode, Mouse
			 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
			ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
			Sleep 500
			goto CheckMVPTele
		}
		else
		{
		GoTo Flywing
		}

		CheckMVPTele:
	MVPTele++
		if (MVPTele<20)
		{
		x:=AttackButtonArea[1], y:=AttackButtonArea[2], w:=AttackButtonArea[3],h:=AttackButtonArea  [4]
		While(!ok:=FindText(x,y,w,h,0,0,AttackButtonOn)) {
		}
		CoordMode, Mouse
		 X:=ok.1.1-(EmuX), Y:=ok.1.2-(EmuY), W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 500
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 500
		goto AttackMVP
		}
		
		else
			
		{
			if (Music=1)
			{
		WinActivate, %Title%		
		send {space}
		Sleep 1000	
		Send %MiniMapClick%
		Sleep 1000
		Send %MiniMapPos%
		Sleep 1000
		Send %MiniMapClick%
		MVPTele := 0
		FlyTime := 0
		Goto scanner
			}
		else
		{
		send {space}
		TrayTip , FernBot, Move to next MVP/Mini?, 4 ;show for 4 seconds
		WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
		IniWrite, x%gui_x% y%gui_y%,%A_ScriptFullPath%:Stream:$DATA, window position, gui_position
		Goto GuiStart
		}
		}


Esc::ExitApp
^W::goto GuiStart
^E::goto IFMVPSpawn

^Q::
info:
msgbox, ,Automated Mini/MVP Killer by Fern, Total MVP/MINI has spawned is %mvpspawn2% and total flywing used is %FlyTime2%.





