;;things to do add random 
#SingleInstance Force
#Include %A_ScriptDir%\configurenew.ini
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
WinGet, Title3ID, ID, %Title3%
WinGet, Title4ID, ID, %Title4%
WinGet, Title5ID, ID, %Title5%

IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
IniWrite, 0,%A_ScriptDir%\pos.ini, Music, prevamt:
WaitingTime = 0
runonce := 0
;~ FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt
changechverify:= [1410, 263, 1580, 353,"|<>**50$39.0A00003yU0000kLjjrzry773VXgLTH//h2v2NNRgJLH/8AyeuNRTsJMHAAHzjzzzy0000AM00001y0U"] ; to verify size only exclusive to this script from nurse gui



;run %autogetcard% ahk_class AutoHotkey
run %deletelog% ahk_class AutoHotkey

IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
if gui_position = x y
	gui_position = x532 y490
Gui,1: New, -Resize -MaximizeBox -MinimizeBox , Automated Channel Finder by Fern
Gui,1: +AlwaysOnTop
Gui,1: Font, s9 Bold
Gui,1: Add, Text, +BackgroundTrans, Country
Gui,1: Add, Button, x15 y115 w90 h40 gStart, Find Now

Gui,1: Add, DropDownList, x10 y29 w100 h210 vCountry ,EN|TH|PH|ID|CN|VN
Gui,1: Add, Text, +BackgroundTrans, Channel Number
Gui,1: Font, s12
Gui,1: Add, Edit, x10 y79 w100 h30 -vScroll vNumber number
Gui,1: Font, s9 Bold
Gui,1: Add, Button, x15 w90 h40 gWindow, Reposition Window
Gui,1: Font, s7 cGreen
Gui,1: Add, Checkbox, w90 vCheckNearby, AutoFarm King Schmitz Memory`
Gui,1: Add, Checkbox, w90 vAutoMusic, AutoMusic When Idle`
Gui,1: Show, w124 h310 %gui_position%, fern Only
Gui,1: +Hwndgui_id
return

GuiClose:
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinClose, %autogetcard% ahk_class AutoHotkey
WinClose, %deletelog% ahk_class AutoHotkey
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptDir%\pos.ini, window position, gui_position
ExitApp

ID:
if(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(800), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
}
return

TH:
if(ok:=FindText(TH[1], TH[2], TH[3], TH[4], 0, 0, TH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(800), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA

}
return

CN:
if(ok:=FindText(CN[1], CN[2], CN[3], CN[4], 0, 0, CN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(800), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
}
return

VN:
if(ok:=FindText(VN[1], VN[2], VN[3], VN[4], 0, 0, VN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(800), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
}
return

EN:
if(ok:=FindText(EN[1], EN[2], EN[3], EN[4], 0, 0, EN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(800), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
}
return

PH:
if(ok:=FindText(PH[1], PH[2], PH[3], PH[4], 0, 0, PH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(800), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
}
return







Start:
Gui,1:Submit, NoHide

Gui,2: +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui,2: Color, CCCCCC
;~ Gui, Font, cFF0000 s15 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
Gui,2: Font, cFFFFFF s7 , verdana  ;white
FormatTime, MyTime,, hh:mm:ss tt
Gui,2: Add, Text, y0 BackgroundTrans, Start Time = %mytime%
Gui,2: Add, Text, vCounter x8 y10 BackgroundTrans, Total Kill(s) = %Kill%00000
Gui,2: Add, Text, vCounterCard x8 y20 BackgroundTrans, Total Card(s) = %Card%00000
Gui,2: Show, NoActivate x5 y188,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
#Persistent
SetTimer, RefreshD, 1000
SetTimer, autogetcard, 1000



if (CheckNearby=0){
goto FindNPC
}






Find:
gosub openmap
gosub openmapslave
gosub openmaptp

GHhallMain:

if(ok:=FindText(worldstuck[1], worldstuck[2], worldstuck[3], worldstuck[4], 0, 0, worldstuck[5]))
{

ControlClick, x35 y78, %Title%,, LEFT, 1, NA ; close world
sleep 1000

	if(ok:=FindText(worldstuck[1], worldstuck[2], worldstuck[3], worldstuck[4], 0, 0, worldstuck[5]))
{
ControlClick, x35 y78, %Title%,, LEFT, 1, NA ; close world
}
sleep 1000
gosub openmap
sleep 1000
}

FindText_BindWindow(TitleID)
while(!ok:=FindText(GHhallMain[1], GHhallMain[2], GHhallMain[3], GHhallMain[4], 0, 0, GHhallMain[5]))
{
	if repairMAIN != 1
	goto repairMAIN
	
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=600) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				repairMAIN = 0
			}
	
}


				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				
				
GHhallSlave:

if(ok:=FindText(worldstuckslave[1], worldstuckslave[2], worldstuckslave[3], worldstuckslave[4], 0, 0, worldstuckslave[5]))
{
ControlClick, x28 y62, %Title3%,, LEFT, 1, NA ; close world
sleep 1000
	if(ok:=FindText(worldstuckslave[1], worldstuckslave[2], worldstuckslave[3], worldstuckslave[4], 0, 0, worldstuckslave[5]))
{
ControlClick, x28 y62, %Title3%,, LEFT, 1, NA ; close world
sleep 1000
}
sleep 1000
gosub openmapslave
sleep 1000
}


FindText_BindWindow(Title3ID)
while(!ok:=FindText(GHhallSlave[1], GHhallSlave[2], GHhallSlave[3], GHhallSlave[4], 0, 0, GHhallSlave[5]))
{
	if repairSLAVE != 1
	goto repairSLAVE
	
	
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=600) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				repairSLAVE = 0
			}
	
}

				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
sleep 1000
repairMAIN = 0 
repairSLAVE = 0

findnpc:
Gui,1:Destroy

kenascroll = 0
FindText_BindWindow(Title2ID)
if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x717 y68, %Title2%,, LEFT, 1, NA
}


if (runonce=0)
{
gosub openmaptp
sleep 500
ControlClick, x565 y148, %Title2%,, LEFT, 1, NA ; pinpoint npc change ch
sleep 500

While(!ok:=FindText(foundnpc[1], foundnpc[2], foundnpc[3], foundnpc[4], 0, 0, foundnpc[5]))
{
	SetTimer, MaxTime, 1000
	sleep 1000
	if (WaitingTime=15) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x392 y250, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x392 y250, %Title2%,, LEFT, 1, NA ; click npc change chg
				goto ChangeChannel
			}
	
	
}

				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
sleep 1000
				ControlClick, x392 y250, %Title2%,, LEFT, 1, NA ; click npc change chg
sleep 500
				ControlClick, x392 y250, %Title2%,, LEFT, 1, NA ; click npc change chg
}


else
{
				ControlClick, x392 y250, %Title2%,, LEFT, 1, NA ; click npc change chg
sleep 500
				ControlClick, x392 y250, %Title2%,, LEFT, 1, NA ; click npc change chg
}

ChangeChannel:
FindText_BindWindow(Title2ID)
 while(!ok:=FindText(ChangeChannelBtn[1],ChangeChannelBtn[2],ChangeChannelBtn[3],ChangeChannelBtn[4], 0, 0, ChangeChannelBtn[5]))
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				ControlClick, x565 y148, %Title2%,, LEFT, 1, NA ; pinpoint npc change ch
				 sleep 5000
				 
				if(ok:=FindText(changechverify[1], changechverify[2], changechverify[3], changechverify[4], 0, 0, changechverify[5]))
					{
						gosub window
						goto ChangeChannel
					}
				
				 goto findnpc
				 }	
}

{
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				;~ sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 500
}

EnterLine:
FindText_BindWindow(Title2ID)
 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto findnpc
				}
				 
 }
 {
					
					
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				;~ sleep 500
	;~ WinActivate, %Title2%
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x667 y148, %Title2%,, LEFT, 1, NA
 
 }

FindText_BindWindow(Title2ID)
  While (!ok:=FindText(EnterLine2[1],EnterLine2[2],EnterLine2[3],EnterLine2[4], 0, 0, EnterLine2[5]))
 {
 if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto changechannelXbutton
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
 
 {
	;~ WinActivate, %Title2%
   CoordMode, Mouse
     X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
 }
 
if (runonce=0)
{
ControlSend, ,%Number%, %Title2%
	CountNumb := % Country " "Number
FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt
}
else
{
	if (jumpa=1) 
	{
	jumpa=0
	Number++
	gosub countrycycle
	CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				Number++
				gosub countrycycle
				CountNumb := % Country " "Number
			}  
	ControlSend, ,%Number%, %Title2%
	}

	else 
	{
	jumpa=0
	gosub shufflechannel
	CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				gosub shufflechannel
				CountNumb := % Country " "Number
			}  
ControlSend, ,%Number%, %Title2%
	}
}

sleep 500
ControlClick, x734 y124, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x340 y352, %Title2%,, LEFT, 1, NA

FindText_BindWindow(Title2ID)
While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto changechannelXbutton
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	

gosub %Country%
sleep 500
ControlClick, x585 y447, %Title2%,, LEFT, 1, NA
sleep 1000

changechannelXbutton:
FindText_BindWindow(Title2ID)
if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x717 y68, %Title2%,, LEFT, 1, NA
}
if (CheckNearby=0){
	sleep 30000
	runonce=1
	jumpa=1
goto FindNPC
}



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; adel

jumperavatarslave:
FindText_BindWindow(Title3ID)
While(!ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, jumperavatarslave[5]))
{	
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime>10) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 
				 goto slavestatus
				 }	
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(471), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA

FollowBtnslave:
FindText_BindWindow(Title3ID)
While(!ok:=FindText(FollowBtnslave[1], FollowBtnslave[2], FollowBtnslave[3], FollowBtnslave[4], 0, 0, FollowBtnslave[5]))
{				
					
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 
				 if(ok:=FindText(UnFollowBtnslave[1],UnFollowBtnslave[2],UnFollowBtnslave[3],UnFollowBtnslave[4], 0, 0, UnFollowBtnslave[5]))
					{
						goto UnFollowBtnslave
					}
					
				 goto slavestatus
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
		
ConfirmBtnslave:
FindText_BindWindow(Title3ID)
While(!ok:=FindText(ConfirmBtnslave[1], ConfirmBtnslave[2], ConfirmBtnslave[3], ConfirmBtnslave[4], 0, 0, ConfirmBtnslave[5]))
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto slavestatus
				}
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA

jumperavatarfollowslave:
FindText_BindWindow(Title3ID)

/*
While(((ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, jumperavatarslave[5])) and (ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))) or ((ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, jumperavatarslave[5])) and (!ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))) or ((!ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, jumperavatarslave[5])) and (!ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))))
*/
While(!ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))
{	

				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=10) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
			    ;~ ControlClick, x257 y92, %Title%,, LEFT, 1, NA
				goto slavestatus
				 }	
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
				CoordMode, Mouse
				X:=ok.1.x-(10), Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
		
UnFollowBtnslave:	
FindText_BindWindow(Title3ID)
While(!ok:=FindText(UnFollowBtnslave[1],UnFollowBtnslave[2],UnFollowBtnslave[3],UnFollowBtnslave[4], 0, 0, UnFollowBtnslave[5]))
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto slavestatus
				}
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
		sleep 500

While(ok:=FindText(UnFollowBtnslave[1],UnFollowBtnslave[2],UnFollowBtnslave[3],UnFollowBtnslave[4], 0, 0, UnFollowBtnslave[5])) ;new
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=2) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto UnFollowBtnslave
				 }	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	


while(ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))
{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime=7) {
					fail++
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					goto slavestatus
				}
			}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
	
;~ ControlClick, x463 y166, %Title3%,, LEFT, 1, NA ;run location spot upper right
gosub openmapslave
ControlClick, x397 y205, %Title3%,, LEFT, 1, NA ;location spot btm right
sleep 500

runonce++


ControlClick, x509 y287, %Title3%,, LEFT, 1, NA
sleep 1000

KingSchmitzslave:
FindText_BindWindow(Title3ID)
 If(ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
{	
	
	
	
	
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title3%,, LEFT, 1, NA
	nomob = 0
	jumpa = 1
	totalkill++
	sleep 1000
	ControlClick, x511 y446, %Title%,, LEFT, 1, NA ; prepare for elite main char
	sleep 500
			while(ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
		{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime=15) {
					fail++
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					goto Find
				}
			}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
	ControlClick, x478 y146, %Title3%,, LEFT, 1, NA	
	sleep 100
	ControlClick, x334 y316, %Title3%,, LEFT, 1, NA	
	sleep 100
	gosub openmapslave
	sleep 300
	ControlClick, x413 y206, %Title3%,, LEFT, 1, NA ;location spot btm right
	;~ ControlClick, x463 y166, %Title3%,, LEFT, 1, NA ;run location spot upper right
	sleep 2000


	goto jumperavatar
}
else
{
	if(ok:=FindText(fullmob[1], fullmob[2], fullmob[3], fullmob[4], 0, 0, fullmob[5]))
{
	if (kenascroll = 0){
	tooltip, scrolldown
	sleep 1000
		gosub slideup
		kenascroll=1
		sleep 1000
		goto KingSchmitzslave
	}
}
	
	
nomob++
}




;~ if (nomob = 5)
;~ {
;~ gosub skip5channel
;~ } 

if (nomob = 5)
{
gosub waitnextspawn

}

gosub openmapslave

goto Find







	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

jumperavatar:
debug := "ftk"
FindText_BindWindow(TitleID)
 While(!ok:=FindText(jumperavatar[1], jumperavatar[2], jumperavatar[3], jumperavatar[4], 0, 0, jumperavatar[5]))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime>10) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto jumperstatus
				 }	
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
		CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y+(30), Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA

FollowBtn:
debug := "fb"
FindText_BindWindow(TitleID)
While(!ok:=FindText(FollowBtn[1], FollowBtn[2], FollowBtn[3], FollowBtn[4], 0, 0, FollowBtn[5]))
{	
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 
				 if(ok:=FindText(UnFollowBtn[1],UnFollowBtn[2],UnFollowBtn[3],UnFollowBtn[4], 0, 0, UnFollowBtn[5]))
					{
						goto UnFollowBtn
					}
					
				 goto jumperstatus
				 }
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
		
ConfirmBtn:	
debug := "cb"
FindText_BindWindow(TitleID)
While(!ok:=FindText(ConfirmBtn[1],ConfirmBtn[2],ConfirmBtn[3],ConfirmBtn[4], 0, 0, ConfirmBtn[5]))
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto jumperstatus
				 }	
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA

jumperavatarfollow:		;;;;;;nak kena cek balik
debug := "jaf"
FindText_BindWindow(TitleID)
While(!ok:=FindText(jumperavatarfollow[1],jumperavatarfollow[2],jumperavatarfollow[3],jumperavatarfollow[4], 0, 0, jumperavatarfollow[5]))
{	
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=15) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
			    ;~ ControlClick, x257 y92, %Title%,, LEFT, 1, NA
				goto jumperstatus
				 }	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
		CoordMode, Mouse
		X:=ok.1.x-(10), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA

UnFollowBtn:	
debug := "ufb"
sleep 1000
FindText_BindWindow(TitleID)
While(!ok:=FindText(UnFollowBtn[1],UnFollowBtn[2],UnFollowBtn[3],UnFollowBtn[4], 0, 0, UnFollowBtn[5]))
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto jumperstatus
				 }	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
				CoordMode, Mouse
			  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
sleep 500

While(ok:=FindText(UnFollowBtn[1],UnFollowBtn[2],UnFollowBtn[3],UnFollowBtn[4], 0, 0, UnFollowBtn[5])) ;new
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=2) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto UnFollowBtn
				 }	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	

;~ ControlClick, x654 y170, BlueStacks,, LEFT, 1, NA ;location spot 12oc
while(ok:=FindText(jumperavatarfollow[1],jumperavatarfollow[2],jumperavatarfollow[3],jumperavatarfollow[4], 0, 0, jumperavatarfollow[5]))
{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime=7) {
					fail++
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					goto jumperstatus
				}
			}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				
gosub openmap
sleep 200
random,randX, 597, 599
random,randY, 286, 288
ControlClick, x%randX% y%randY%, BlueStacks,, LEFT, 1, NA ;location spot btm right
;~ random,randX, 691, 693
;~ random,randY, 229, 231
;~ ControlClick, x%randX% y%randY%, BlueStacks,, LEFT, 1, NA ;location spot btm right
sleep 3000
ControlClick, x594 y292, %Title%,, LEFT, 1, NA ; run a bit
sleep 2000
ControlClick, x%randX% y%randY%, BlueStacks,, LEFT, 1, NA ;location spot btm right
sleep 2000
if (CheckNearby=1){
runonce++	
gosub CheckNearby
}


runonce++
goto Find




^W::
Window:
DetectHiddenWindows, On
SetTitleMatchMode, 3
WinMaximize, %Title%
WinMaximize, %Title2%,
WinMaximize, %Title3%
WinMaximize, %Title4%
WinMaximize, %Title5%
sleep 1000
WinMove, %Title%,,0,0, 800, 491
WinMove, %Title2%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 

return

CheckNearby:

ControlClick, x767 y402, %Title%,, LEFT, 1, NA
sleep 500
FindText_BindWindow(TitleID)
 while(!ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
{
		 SetTimer, MaxTime, 1000
			 sleep 1000
			 if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto Find
				 }
}


	{
		
				setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 kill++
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
			sleep 1000
				 while(ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
				{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime=30) {
					kill--
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					goto CheckNearby
				}

				}
			
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
			;~ ControlClick, x473 y236, %Title3%,, LEFT, 1, NA ;run location spot btm right
	}
	
	
;sleep 4000 ; collect loot time

ControlClick, x713 y202, %Title%,, LEFT, 1, NA


goto Find


MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return
			
Bantai:
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
			sleep 1000
			return

Makesureclick:
ControlClick, x537 y126, %Title%,, LEFT, 1, NA
sleep 500
goto CheckNearby
return


Telegram:

chatid := "386200179" ; replace XXXXXXX with your chat_id
text := % yourmessage
param := "chat_id=" chatid "&text=" text
str =https://api.telegram.org/bot1134651420:AAHbBefCJ_y6WFvno_L5vFfuwQ_HPzRgOik/sendmessage? ; replace XXXXXXX with your API token

;msgbox, % url_tovar(str, param) ; this is useful if you need to return data

url_tovar(str, param)

url_tovar(URL, param) { 
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("POST", URL)
	WebRequest.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    WebRequest.Send(param)
    res := WebRequest.ResponseText
    return res
}
return


countrycycle:

if (Country = "EN") 
{

	if(Number>36) 
	{
		gosub nextcountry
	}
	
}

if (Country = "TH") 
{
	if(Number>180) 
	{
		gosub nextcountry
	}
	
}

if (Country = "PH") 
{
	if(Number>90) 
	{
		gosub nextcountry
	}
	
}


if (Country = "ID") 
{
	if(Number>71) 
	{
		gosub nextcountry
	}
	
}

if (Country = "CN") 
{
	if(Number>9) 
	{
		gosub nextcountry
	}
	
}

if (Country = "VN") 
{
	if(Number>9) 
	{
		gosub nextcountry
	}
	
}

return

nextcountry:

Number = 1

NextCount := % ObjIndexOf(CountryAvailable, Country)
NextCount++
if (NextCount > 6) {
NextCount = 1
}
x := % CountryAvailable[NextCount]
Country = % x

return





skip5channel:
Number+=5
return

waitnextspawn:

nomob := 0
current_hour = %A_hour%
target_hour = % (current_hour+1)
target_time = %target_hour%00
if (target_time = 2400)
{
	target_time = 0000
}

converted := SubStr("000" . target_time, -3)
target = %A_YYYY%%A_MM%%A_DD%%converted%00
if (converted = 0000)
{
EnvAdd, target, 1, d
}

EnvSub, target, %A_Now%, Seconds.

nextspawn := target * 1000 
nextspawninmin := (nextspawn/1000)/60


IniRead, prevamt , %A_ScriptDir%\pos.ini, Music, prevamt:

if (prevamt < 30) && (AutoMusic = 1) {
masa := 900000
}
else
{
masa := 600000
}

if (nextspawn < masa) {

tooltip, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond,0,0
FileDelete, %A_ScriptDir%\log.txt
ControlClick, x509 y267, %Title3%,, LEFT, 1, NA
TrayTip , Ultimate Farm Bot, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond, 4 ;show for 4 seconds

if (prevamt < 30) && (nextspawn > 300000) && (AutoMusic = 1)
{
run %gotomusic% ahk_class AutoHotkey
}


Sleep, % nextspawn
DetectHiddenWindows, On
SetTitleMatchMode, 2
WinClose, %gotomusic% ahk_class AutoHotkey
tooltip,

Country := "VN"
Number := 0
sleep 1000
ControlClick, x509 y267, %Title3%,, LEFT, 1, NA
sleep 500
goto KingSchmitzslave
}
else
{

return
}


shufflechannel:
random, NextCount, 1, 6
x := % CountryAvailable[NextCount]
Country = % x

if (Country = "EN") 
{
	random, Number, 1, 36	
}

if (Country = "TH") 
{
	random, Number, 1, 180	
}

if (Country = "PH") 
{
	random, Number, 1, 90	
	
}


if (Country = "ID") 
{
	random, Number, 1, 71	
}

if (Country = "CN") 
{
	random, Number, 1, 9	
}

if (Country = "VN") 
{
	random, Number, 1, 9
}


return


jumperstatus:
FindText_BindWindow(TitleID)
if(ok:=FindText(424, 323, 544, 361, 0, 0, ConfirmBtn[5] ))
					{
					goto, ConfirmBtn
					}


while(!checkstatus(jumperstatus))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime>10) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				
	
					goto, repairMAIN
					return
				}


}
				setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0


Loop, parse, jumperstatus, `,
{
	if((ok:=FindText(jumperavatar[1], jumperavatar[2], jumperavatar[3], jumperavatar[4], 0, 0, %A_LoopField%[5] )) or (ok:=FindText(23, 266, 217, 386, 0, 0, %A_LoopField%[5] )))
	goto, %A_LoopField%

}
return



checkstatus(jumperstatus){
global
Loop, parse, jumperstatus, `,
{
	
	
    if((ok:=FindText(jumperavatar[1], jumperavatar[2], jumperavatar[3], jumperavatar[4], 0, 0, %A_LoopField%[5] )) or (ok:=FindText(23, 266, 217, 386, 0, 0, %A_LoopField%[5] )))
	{
	return 1
	}
	
}

}

slavestatus:
FindText_BindWindow(Title3ID)
if(ok:=FindText(282, 718, 356, 740, 0, 0, ConfirmBtnSlave[5] ))
					{
					goto, ConfirmBtnSlave
					}
					
while(!checkstatus2(slavestatus))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime>10) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto repairSLAVE
				return
				}


}
				setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0


Loop, parse, slavestatus, `,
{
	if((ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, %A_LoopField%[5] )) or (ok:=FindText(15, 682, 143, 758, 0, 0, %A_LoopField%[5] )))
	goto, %A_LoopField%

}
return



checkstatus2(slavestatus){
global
Loop, parse, slavestatus, `,
{
	
	
    if((ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, %A_LoopField%[5] )) or (ok:=FindText(15, 682, 143, 758, 0, 0, %A_LoopField%[5] )))
	{
	return 1
	}
	
}

}


repairMAIN:
FindText_BindWindow(TitleID)

					if(ok:=FindText(424, 323, 544, 361, 0, 0, ConfirmBtn[5] ))
					{
					goto, ConfirmBtn
					}
if(ok:=FindText(worldstuck[1], worldstuck[2], worldstuck[3], worldstuck[4], 0, 0, worldstuck[5]))
{
ControlClick, x35 y78, %Title%,, LEFT, 1, NA ; close world
sleep 1000
gosub openmap
}

repairMAIN := 1
gosub openmap
While(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
	goto repairMAIN
}
ControlClick, x460 y339, %Title%,, LEFT, 1, NA ; worldmap
sleep 1000
ControlClick, x237 y289, %Title%,, LEFT, 1, NA ; glastheim
sleep 1000
ControlClick, x156 y262, %Title%,, LEFT, 1, NA ; glastheim hall
sleep 1000
ControlClick, x412 y121, %Title%,, LEFT, 1, NA ; quest
sleep 1000
ControlClick, x400 y331, %Title%,, LEFT, 1, NA ; map pinpoint
sleep 100
gosub openmap

if(ok:=FindText(worldstuck[1], worldstuck[2], worldstuck[3], worldstuck[4], 0, 0, worldstuck[5]))
{
ControlClick, x35 y78, %Title%,, LEFT, 1, NA ; close world
sleep 1000
gosub openmap
}

goto GHhallMain
return

repairSLAVE:
FindText_BindWindow(Title3ID)

					if(ok:=FindText(282, 718, 356, 740, 0, 0, ConfirmBtnSlave[5] ))
					{
					goto, ConfirmBtnSlave
					}
					
					
if(ok:=FindText(worldstuckslave[1], worldstuckslave[2], worldstuckslave[3], worldstuckslave[4], 0, 0, worldstuckslave[5]))
{
ControlClick, x28 y62, %Title3%,, LEFT, 1, NA ; close world
sleep 1000
gosub openmapslave
sleep 1000
}

repairSLAVE = 1
gosub openmapslave
While(!ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{
	goto repairSLAVE
}
ControlClick, x304 y243, %Title3%,, LEFT, 1, NA ; worldmap
sleep 1000
ControlClick, x157 y204, %Title3%,, LEFT, 1, NA ; glastheim
sleep 1000
ControlClick, x97 y187, %Title3%,, LEFT, 1, NA ; glastheim hall
sleep 1000
ControlClick, x273 y93, %Title3%,, LEFT, 1, NA ; quest
sleep 1000
ControlClick, x267 y234, %Title3%,, LEFT, 1, NA ; map pinpoint
sleep 500
gosub openmapslave
sleep 300

if(ok:=FindText(worldstuckslave[1], worldstuckslave[2], worldstuckslave[3], worldstuckslave[4], 0, 0, worldstuckslave[5]))
{
ControlClick, x28 y62, %Title3%,, LEFT, 1, NA ; close world
sleep 1000
gosub openmapslave
sleep 1000
}

goto GHhallSlave
return


return

;;;;;function dont kacau here
ObjIndexOf(obj, item, case_sensitive:=false)
{
	for i, val in obj {
		if (case_sensitive ? (val == item) : (val = item))
			return i
	}
}


InFile(CountNumb)
{
i:=1
Loop, Read, %A_ScriptDir%\log.txt
{
    ++i
}
If (i>250){
    FileDelete, %A_ScriptDir%\log.txt
	TrayTip , Deleting log.txt, Country log has been reset, 4 ;show for 4 seconds
	
}
        ;Means 13 non empty lines in the file
        ;Indicating each value of rand from 0 to 12 has been generated once
        ;No new value can be generated, hence delete
		
Loop, Read, %A_ScriptDir%\log.txt
{
    If (A_LoopReadLine=CountNumb){
        return 1
	}
}
;Will reach here only if rand is not in file
;Write rand to file, and return 0
FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt
return 0
}
 

openmap:
if(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{	
ControlClick, x750 y110, %Title%,, LEFT, 1, NA
sleep 100
}
return
 
openmaptp:
if(!ok:=FindText(1228, 319, 1280, 369, 0, 0, worldmap[5]))
{	
ControlClick, x750 y110, %Title2%,, LEFT, 1, NA
sleep 100
}
return
 
 
openmapslave:
if(!ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{	
ControlClick, x500 y90, %Title3%,, LEFT, 1, NA
sleep 100
}
return
RefreshD:
GuiControl,2:, Counter, Total Kill(s) = %kill%
GuiControl,2:, CounterCard, Total Card(s) = %Card%
return

autogetcard:
 if(ok:=FindText(Getcard[1],Getcard[2], Getcard[3], Getcard[4], 0, 0., Getcard[5]))
 {
 Card++
   CoordMode, Mouse
   X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
   sleep 1000
  }
  return

SlideUp:
CoordMode,Mouse, Screen
MouseGetPos, hereX, hereY
Click, 412,721, Down
sleep 300
MouseMove, 412,600 ,10
sleep 300
Click, 412, 600, Up
MouseMove, %hereX%, %hereY%
return



^T:: 
IniRead, prevamt , %A_ScriptDir%\pos.ini, Music, prevamt:
msgbox, %totalkill% %debug% %nomob% %i% Prevamt= %prevamt%
return

ESC:: 
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptDir%\pos.ini, window position, gui_position
Reload
return
^Del:: 
 FileDelete, %A_ScriptDir%\log.txt
	TrayTip , Deleting log.txt, Country log has been reset, 4 ;show for 4 seconds
	return
Q::ExitApp