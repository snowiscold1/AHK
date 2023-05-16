#SingleInstance Force
#Include %A_ScriptDir%\configure.ahk
Menu, Tray, Icon, %A_ScriptDir%\icon.ico
IniRead, gui_position, settings.ini, window position, gui_position, Center
DetectHiddenWindows, On
SetTitleMatchMode, 3

Title:= "BlueStacks"
FlyTime := 0
MVPTele := 0
mvpspawn := 0
FlyTime2 := 0
mvpspawn2 := 0
Rel1 := 0
Rel2 := 0
Stop := 0


Gui,1: New, -Resize -MaximizeBox -MinimizeBox , Automated MVP/Mini Hunter by Fern 
Gui,1: +AlwaysOnTop
Gui,1:Font, s8 Bold, Arial
Gui,1: Margin, 10, 10
Gui,1: Color, E26665
Gui,1: Add, Button, x12 y9 w100 h30 vStart gscanner, Start
Gui,1: Add, Button, x122 y9 w100 h30 gResetPos, Reset Position
Gui,1: Add, Button, x12 y40 w100 h30 gIfMVPSpawn, Find MVP
Gui,1: Add, Button, x122 y40 w100 h30 gInfo , Info
Gui,1: Add, Button, x12 y94 w210 h30 gGroupTeleport, Group Teleport
Gui,1: Add, Button, x12 y125 w210 h30, ReloadBot
Gui,1: Add,DropDownList, x12 y71 w210  vMVPLIST sort,Smokie|EclipseSouthGate|EclipseLabyrinth|Mastering|VocalWestGate|VocalLabyrinth|Angeling|GoldenThiefBug|Deviling|Ghostring|Drake|Toad|Strouf|RotarZairo|GoblinLeader|DragonFly|Mistress|VagabondWolf|Maya|Phreeoni|WoodGoblin|Edgga|Gryphon|Anubis|Osiris|Hyegun|MoonlightFlower|OrcBaby|OrcHero|Jakk|Doppelganger|Atroce|MutantDragon|OrcLord|Rafflesia|Detarderous|OwlDuke|Mystletainn|Alice|DarkIllusion|Baphomet|DarkLord|Clock|ClockTowerManager|Chepet
Gui,1: Show, x1364 y753 %gui_position% , MVP/Mini Bot by Fern
Gui,1: +Hwndgui_id
return

ResetPos:
/*CoordMode, Mouse
MouseGetPos, bx, by
if (ok:=FindText(446,360,150000,150000, 0, 0, AttackButtonOff))  {
	CoordMode, Mouse
	X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
	px:= x+20, py:= y+20
	click, %px%,%py%
	MouseMove, %bx%, %by%
	WinGetTitle, Title, A

}
*/
WinMove, %Title%,,0,0, 830, 553	
return

GroupTeleport:
Gui,1: Submit, NoHide
gosub Teleport
gosub %MVPList%	
return

ButtonReloadBot(){

reload
}

Teleport:
/*CoordMode, Mouse
MouseGetPos, bx, by
if (ok:=FindText(446,360,150000,150000, 0, 0, AttackButtonOff))  {
	CoordMode, Mouse
	X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
	px:= x+20, py:= y+20
	click, %px%,%py%
	MouseMove, %bx%, %by%
	WinGetTitle, Title, A
	WinMove, %Title%,,0,0, 830, 553	
}
*/
While(!ok:=FindText(514,369,60,61,0,0,ButterflyWing)) {

}
ControlClick, x547 y399, %Title%,, LEFT, 1, NA 
sleep 500
While(!ok:=FindText(596,237,139,35,0,0,Kafra)) {
	Tooltip, WaitingForKafra
}
sleep 500
ControlClick, x665 y254, %Title%,, LEFT, 1, NA 
While(!ok:=FindText(629,327,180,39,0,0,KafraMenu)) {
	Tooltip, WaitingForMenu
}
ControlClick, x724 y347, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x724 y347, %Title%,, LEFT, 1, NA 
sleep 300
return

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
ControlClick, x429 y222, %Title%,, LEFT, 1, NA
sleep 500
return

Map2:
ControlClick, x429 y272, %Title%,, LEFT, 1, NA
sleep 500
return

Map3:
ControlClick, x429 y322, %Title%,, LEFT, 1, NA
sleep 500
return

Map4:
ControlClick, x429 y372, %Title%,, LEFT, 1, NA
sleep 500
return

^U::
SlideUp:
CoordMode,Mouse, Screen
Click, 340,387, Down
sleep 800
Click, 340, 200, 0
sleep 300
Click, 340, 200, Up
sleep 500
return


GuiClose:
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%, settings.ini, window position, gui_position
ExitApp



Scanner:
While(!ok:=FindText(19,171,248,381,0,0,MVPpopup)) {
	Tooltip, :D
}

IfMVPSpawn:
mvpspawn++
mvpspawn2++

if (ok:=FindText(446,360,823,497, 0, 0, AttackButtonOff))  
		{
		CoordMode, Mouse
		X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
			if (Rel1=0){
			Rel1++
			Click, %X%, %Y%
			DetectHiddenWindows On
			WinGetTitle, EmuTitle, A
			CoordMode, Mouse, Window
			MouseGetPos, Rel1X, Rel1Y
			}
			ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
			sleep 300
			goto AttackMVP
		}
	
if (ok:=FindText(446,360,823,497, 0, 0, AttackButtonOn))  
		{
		CoordMode, Mouse
		X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
			if (Rel1=0){
			Rel1++
			Click, %X%, %Y%
			DetectHiddenWindows On
			WinGetTitle, EmuTitle, A
			CoordMode, Mouse, Window
			MouseGetPos, Rel1X, Rel1Y
			;msgbox, %Rel1X%, %Rel1Y% %EmuTitle% %Rel1%
			}		
			ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
			Sleep 500
			ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
			sleep 300
			goto AttackMVP
		}

Flywing:

if (Flytime<25)
	{
		if (ok:=FindText(448,367,65,68,0,0, Flywing))  
		{
		FlyTime++
		FlyTime2++
		CoordMode, Mouse
		X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
		if (Rel2=0){
			Rel2++
			Random, X, X+0,X+15
			Random, Y, Y+0,Y+15
			Click, %X%, %Y%
			DetectHiddenWindows On
			WinGetTitle, EmuTitle, A
			CoordMode, Mouse, Window
			MouseGetPos, Rel2X, Rel2Y
			Random, Rel2X, Rel2X+0, Rel2X+15
			Random, Rel2Y, Rel2Y+0, Rel2Y+15
			;msgbox, %Rel2X%, %Rel2Y% %EmuTitle% %Rel2%
			}
			ControlClick, x%Rel2X% y%Rel2Y%, %EmuTitle%,, LEFT, 1, NA 
			Sleep 300
			ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
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
		ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
		Sleep 1000	
		Send %MiniMapClick%
		Sleep 1000
		Send %MiniMapPos%
		Sleep 1000
		Send %MiniMapClick%
		MVPTele := 0
		FlyTime := 0
		Goto Scanner
		
	}	
			
		AttackMVP:

		if (ok:=FindText(667,213,751,407, 0, 0, MVPattack))
		{
			CoordMode, Mouse
			X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
			Random, X, X+0,X+10
			Random, Y, Y+0,Y+10
			Click, %X%, %Y%
			Sleep 500 
			goto CheckMVPTele
		}
		
		else
			
		{
			if (ok:=FindText(667,213,751,407, 0, 0, MVPattack))
		{
			CoordMode, Mouse
			X:=ok.1.1, Y:=ok.1.2, W:=ok.1.3, H:=ok.1.4, Comment:=ok.1.5, X+=W//2, Y+=H//2
			Click, %X%, %Y%
			Sleep 1000 
			goto CheckMVPTele
		}	
			
			
			
		GoTo Flywing
		}
		

		CheckMVPTele:
		MVPTele++
		
		if (MVPTele<20)
		{
		ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
		sleep 500
		ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
		sleep 500
		goto AttackMVP
		}
		else
		{
		ControlClick, x%Rel1X% y%Rel1Y%, %EmuTitle%,, LEFT, 1, NA 
		Sleep 1000	
		Send %MiniMapClick%
		Sleep 1000
		Send %MiniMapPos%
		Sleep 1000
		Send %MiniMapClick%
		MVPTele := 0
		FlyTime := 0
		Goto Scanner
		}
Esc::ExitApp
^W::goto Scanner
^E::goto AttackMVP
Q::reload
^Q::
info:
msgbox, ,Automated Mini/MVP Killer by Fern, Total MVP/MINI has spawned is %mvpspawn2% and total flywing used is %FlyTime2%.





