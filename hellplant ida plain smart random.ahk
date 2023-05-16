#SingleInstance Force
Title:= "BlueStacks"
Title2:= "nurse"
Title3:= "ADEL"
Title4:= "SoulSlayers"
Title5:= "sundalmalam"
Menu, Tray, Icon, %A_ScriptDir%\icon.ico
WinMove, %Title%,,0,0, 800, 491
WinMove, %Title2%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 
DetectHiddenWindows, On
SetTitleMatchMode, 3

fullScriptPath = %A_ScriptDir%\dienotify.ahk ; edit with your full script path
fullScriptPath2 = %A_ScriptDir%\autogetcard240dpi 360 width.ahk  ; edit with your full script path
fullScriptPath3 = %A_ScriptDir%\autofindchannel.ahk ; edit with your full script path


Stapo:="|<>0xB1ACA4@1.00$1.k|<>0xC4BCB4@1.00$1.k|<>0xC5BDB5@1.00$1.k|<>0xD4CCC2@1.00$1.k|<>0xE0D8D0@1.00$1.k|<>0xD4CCC2@1.00$1.k|<>0xC1B9B1@1.00$1.k|<>0xA0988F@1.00$1.k|<>0xCCC4BC@1.00$1.k|<>0xC4BCB4@1.00$1.k|<>0xA9A69E@1.00$1.k|<>0xAEA69D@1.00$6.VU|<>0x9A968C@1.00$9.081040U|<>0xCEC7BB@1.00$1.k|<>0xD5CDC3@1.00$4.UM|<>0xBEB6AA@1.00$1.k|<>0xD9D1C7@1.00$12.UVU|<>0xC8BFB2@1.00$1.k|<>0xBDB4A2@1.00$1.k|<>0xC6BDAC@1.00$1.k|<>0xCFBDA1@1.00$1.k|<>0x99987F@1.00$71.k|<>0xB7B1A7@1.00$1.k|<>0xB8B0A8@1.00$3.g|<>0x929088@1.00$1.k|<>0xD4CCC4@1.00$4.UM|<>0xB1A9A0@1.00$3.g|<>0xA69E96@1.00$1.k|<>0xE5DCD4@1.00$4.Yc"


MinimizeQuest:
sidearrow:="|<>**50$9.w7kb4AsnXC9lQT7lYMy7UU"
gosub closemap

 if (ok:=FindText(769, 160, 795, 264, 0.1, 1, sidearrow))
 {
   CoordMode, Mouse
   X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
 }


^T::
Run %fullScriptPath% ahk_class AutoHotkey
Run %fullScriptPath2% ahk_class AutoHotkey
Run %fullScriptPath3% ahk_class AutoHotkey
return

^R::
Loop,{
	alternate = 0
lifemerge()	
cartboost()
gosub openmap
movemap(573,191)
sleep 500
gosub closemap
sleep 1000
acidbomb(317,349)
hellplant(226,272)

if(ok:=FindText(36, 323, 132, 371, 0.1, 0.1, Stapo))
	{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x705 y450, %Title%,, LEFT, 1, NA		
		sleep 500
		ControlClick, x158 y343, %Title%,, LEFT, 1, NA
		sleep 1000
		
		alternate = 1
	}

sleep 3000
hellplant(288,183)
sleep 1000

if(ok:=FindText(293, 133, 463, 167, 0.1, 0.1, Stapo))
	{	
		crazyweed(378,165)
	}
else
{
	
	if(ok:=FindText(131, 187, 209, 225, 0.1, 0.1, Stapo))
	{	
		crazyweed(159,211)
	}
	
}
;~ crazyweed(372,179)
gosub openmap
movemap(571,189)
sleep 500
gosub closemap
sleep 500
hellplant(474,293)
sleep 500


demonicfire(614,233)


crazyweed(713,301)
sleep 1000
demonicfire(527,352)

if(ok:=FindText(424, 163, 768, 337, 0, 0, Stapo))
	{
		
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x705 y450, %Title%,, LEFT, 1, NA		
		sleep 500
		ControlClick, x%X% y%Y%, %Title%,, LEFT, 1, NA
		sleep 500
	}
else	
{
crazyweed(733,318)
}


sleep 1000

gosub openmap
movemap(581,189)
sleep 500
gosub closemap
demonicfire(426,305)

if (alternate = 0) {
	
	if(ok:=FindText(478, 223, 764, 333, 0, 0, Stapo))
	{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x705 y450, %Title%,, LEFT, 1, NA		
		sleep 500
		ControlClick, x%X% y%Y%, %Title%,, LEFT, 1, NA
		sleep 1500
		
	}
	
	else	
	{
	crazyweed(642,287)
	sleep 1500
	}
	

}



}

;~ ^U::
;~ Loop,{
;~ lifemerge()	

;~ lifepsych()
;~ cartboost()
;~ movemap(565,188)

;~ sleep 4500
;~ hellplant(357,240)
;~ sleep 2000
;~ hellplant(274,388)
;~ sleep 1000
;~ movemap(574,191)
;~ sleep 2000
;~ acidbomb(267,359)

;~ hellplant(439,249)
;~ msgbox, yes


;~ movemap(565,191)
;~ sleep 3000


;~ sleep 2000
;~ hellplant(329,295)
;~ sleep 500

;~ movemap(577,183)
;~ sleep 1500
;~ demonicfire(406,246)
;~ sleep 500
;~ demonicfire(400,417)
;~ demonicfire(453,318)
;~ movemap(567,187)
;~ sleep 2000
;~ movemap(575,187)
;~ sleep 500
;~ }







;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
openmap:
ControlClick, x738 y128, %Title%,, LEFT, 1, NA
sleep 100
ControlClick, x738 y128, %Title%,, LEFT, 1, NA
sleep 300
return

closemap:
ControlClick, x738 y128, %Title%,, LEFT, 1, NA
sleep 100
ControlClick, x773 y126, %Title%,, LEFT, 1, NA
sleep 300
return

hellplant(posX,posY) {
	global
		ControlClick, x470 y450, %Title%,, LEFT, 1, NA
		sleep 500
		random, randX, posX-0, posX+1
		random, randY, posY-0, posY+1
		ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
		sleep 1000
		
}


demonicfire(posX,posY) {
	global
		ControlClick, x525 y450, %Title%,, LEFT, 1, NA
		sleep 500
		;~ random, randY, posY-10, posY+15
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA
		sleep 1500
		
}

acidbomb(posX,posY) {
	global
		ControlClick, x763 y450, %Title%,, LEFT, 1, NA 
		sleep 500
		random, randX, posX-20, posX+1
		ControlClick, x%randX% y%posY%, %Title%,, LEFT, 1, NA
		sleep 1000
		
}


lifemerge() {
	global
		ControlClick, x648 y450, %Title%,, LEFT, 1, NA		
		sleep 1000
}


cartboost() {
	global
		ControlClick, x589 y450, %Title%,, LEFT, 1, NA		
		sleep 1000
}


crazyweed(posX,posY) {
	global
		ControlClick, x705 y450, %Title%,, LEFT, 1, NA		
		sleep 500
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA
		sleep 500
		
}



movemap(posX,posY) {
	global
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA 
		return
}


^Z::
ZoomOut:
WinActivate, BlueStacks
sleep 1000
Send {Ctrl Down}
sleep 500
send {- Down}
Sleep 2000 ;wait 2 s
Send {Ctrl Up}
send {- Up}
return

Esc::Reload
        