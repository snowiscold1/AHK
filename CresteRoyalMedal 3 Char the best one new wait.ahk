;;things to do add random 
#SingleInstance Force
#Include %A_ScriptDir%\configurenew.ini
IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
IniWrite, 0,%A_ScriptDir%\pos.ini, Music, prevamt:
WaitingTime = 0
runonce := 0
;~ FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt
changechverify:= [1410, 263, 1580, 353,"|<>**50$39.0A00003yU0000kLjjrzry773VXgLTH//h2v2NNRgJLH/8AyeuNRTsJMHAAHzjzzzy0000AM00001y0U"] ; to verify size only exclusive to this script from nurse gui


run %autogetcard% ahk_class AutoHotkey
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

EN:
ControlClick, x214 y214, %Title2%,, LEFT, 1, NA
return

TH:
ControlClick, x214 y235, %Title2%,, LEFT, 1, NA
return

PH:
ControlClick, x214 y259, %Title2%,, LEFT, 1, NA
return

ID:
ControlClick, x214 y283, %Title2%,, LEFT, 1, NA
return

CN:
ControlClick, x214 y305, %Title2%,, LEFT, 1, NA
return

VN:
ControlClick, x214 y328, %Title2%,, LEFT, 1, NA
return







Start:
Gui,1:Submit, NoHide


Find:
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 100
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 100



GHhallMain:

while(!ok:=FindText(584, 109, 704, 141, 0, 0, GHhallMain))
{
	if repairMAIN != 1
	goto repairMAIN
}

GHhallSlave:
while(!ok:=FindText(391, 572, 469, 596, 0, 0, GHhallSlave))
{
	if repairSLAVE != 1
	goto repairSLAVE
}

repairMAIN = 0 
repairSLAVE = 0

findnpc:
Gui,1:Destroy



if (runonce=0)
{
ControlClick, x720 y128, %Title2%,, LEFT, 1, NA ; map title
sleep 500
ControlClick, x657 y193, %Title2%,, LEFT, 1, NA ; pinpoint npc change ch
sleep 500

While(!ok:=FindText(foundnpc[1], foundnpc[2], foundnpc[3], foundnpc[4], 0, 0, foundnpc[5]))
{
	SetTimer, MaxTime, 1000
	sleep 1000
	if (WaitingTime=15) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				goto ChangeChannel
			}
	
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
sleep 1000
ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change ch
sleep 500
}


else
{
ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change ch
}

ChangeChannel:
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
				 ControlClick, x657 y193, %Title2%,, LEFT, 1, NA ; pinpoint npc change ch
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
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title2, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title2%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA 
   sleep 500
}

EnterLine:
 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {

 }
 {
	;~ WinActivate, %Title2%
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x667 y145, %Title2%,, LEFT, 1, NA
 
 }
 
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
if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x717 y68, %Title2%,, LEFT, 1, NA
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; adel

jumperavatarslave:
While(!ok:=FindText(jumperavatarslave[1], jumperavatarslave[2], jumperavatarslave[3], jumperavatarslave[4], 0, 0, jumperavatarslave[5]))
{	
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=20) {
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

FollowBtnslave:
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
While(!ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))
{	
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=14) {
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
		
UnFollowBtnslave:	
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
		
if(ok:=FindText(jumperavatarfollowslave[1],jumperavatarfollowslave[2],jumperavatarfollowslave[3],jumperavatarfollowslave[4], 0, 0, jumperavatarfollowslave[5]))
{
goto jumperavatarfollowslave
}
	
;~ ControlClick, x463 y166, %Title3%,, LEFT, 1, NA ;run location spot upper right
ControlClick, x457 y238, %Title3%,, LEFT, 1, NA ;location spot btm right
sleep 500

runonce++
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 500
ControlClick, x514 y97, %Title3%,, LEFT, 1, NA
sleep 500

ControlClick, x509 y267, %Title3%,, LEFT, 1, NA
sleep 1000

KingSchmitzslave:
 If(ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
{	
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%X% y%Y%, %Title3%,, LEFT, 1, NA
	nomob = 0
	jumpa = 1
	totalkill++
	sleep 1000
	ControlClick, x466 y446, %Title%,, LEFT, 1, NA ; prepare for elite main char
	sleep 500
			while(ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
		{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime=7) {
					fail++
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					goto KingSchmitzSlave
				}
			}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				
	ControlClick, x482 y96, %Title3%,, LEFT, 1, NA
	sleep 300
	ControlClick, x482 y96, %Title3%,, LEFT, 1, NA
	sleep 300
	ControlClick, x473 y236, %Title3%,, LEFT, 1, NA ;run location spot btm right
	;~ ControlClick, x463 y166, %Title3%,, LEFT, 1, NA ;run location spot upper right
	sleep 2000


	goto jumperavatar
}
else
{
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

ControlClick, x482 y96, %Title3%,, LEFT, 1, NA
sleep 500
ControlClick, x482 y96, %Title3%,, LEFT, 1, NA

goto Find







	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


jumperavatar:
debug := "ftk"
 While(!ok:=FindText(jumperavatar[1], jumperavatar[2], jumperavatar[3], jumperavatar[4], 0, 0, jumperavatar[5]))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=14) {
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
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA

FollowBtn:
debug := "fb"
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
				 goto jumperstatus
				 }
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		
ConfirmBtn:	
debug := "cb"
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
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA

jumperavatarfollow:		;;;;;;nak kena cek balik
debug := "jaf"
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
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA

UnFollowBtn:	
debug := "ufb"
sleep 1000
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
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
sleep 500

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
				
ControlClick, x774 y124, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x774 y128, %Title%,, LEFT, 1, NA
sleep 200
random,randX, 689, 691
random,randY, 334, 336
ControlClick, x%randX% y%randY%, BlueStacks,, LEFT, 1, NA ;location spot btm right
;~ random,randX, 691, 693
;~ random,randY, 229, 231
;~ ControlClick, x%randX% y%randY%, BlueStacks,, LEFT, 1, NA ;location spot btm right
sleep 1000
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
sleep 2500
WinMove, %Title%,,0,0, 800, 491
WinMove, %Title2%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 

return

CheckNearby:
ControlClick, x742 y124, %Title%,, LEFT, 1, NA
sleep 500

ControlClick, x774 y128, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x767 y386, %Title%,, LEFT, 1, NA
sleep 500

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
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
			sleep 1000
				 while(ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
				{
				}
			;~ ControlClick, x473 y236, %Title3%,, LEFT, 1, NA ;run location spot btm right
	}
	
	
sleep 7000 ; collect loot time

ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x742 y128, %Title%,, LEFT, 1, NA

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
				
				if (WaitingTime=15) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
					Loop, parse, jumperstatus, `,
					{
						
					if(ok:=FindText(26, 271, 216, 357, 0, 0, %A_LoopField%[5] ))
					{
					goto, %A_LoopField%
					}
					
					if(ok:=FindText(548, 44, 798, 80, 0, 0, %A_LoopField%[5] ))
					{
					goto, %A_LoopField%
					}
					
					if(ok:=FindText(424, 323, 544, 361, 0, 0, %A_LoopField%[5] ))
					{
					goto, %A_LoopField%
					}
					
					
					}
					goto, Find
					return
				}
}
				setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 
Loop, parse, jumperstatus, `,
{
    if(ok:=FindText(101, 43, 399, 115, 0, 0, %A_LoopField%[5] ))
	goto, %A_LoopField%
}
return



checkstatus(jumperstatus){
Loop, parse, jumperstatus, `,
{
    if(ok:=FindText(101, 43, 399, 115, 0, 0, %A_LoopField%[5] ))
	return 1
}

}

slavestatus:
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
				
				if (WaitingTime=15) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
			 
					Loop, parse, slavestatus, `,
					{
					
					if(ok:=FindText(18, 689, 142, 761, 0, 0, %A_LoopField%[5] ))
					{
					goto, %A_LoopField%
					}
                    
                    if(ok:=FindText(364, 537, 528, 561, 0, 0, %A_LoopField%[5] ))
					{
					goto, %A_LoopField%
					}
					
					if(ok:=FindText(275, 715, 359, 743, 0, 0, %A_LoopField%[5] ))
					{
					goto, %A_LoopField%
					}
					
					
					}
					goto, Find
					return
					
					
					
				}
}
				setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 
Loop, parse, slavestatus, `,
{
    if(ok:=FindText(9, 533, 265, 589, 0, 0, %A_LoopField%[5] ))
	goto, %A_LoopField%
}
return



checkstatus2(slavestatus){
Loop, parse, slavestatus, `,
{
    if(ok:=FindText(9, 533, 265, 589, 0, 0, %A_LoopField%[5] ))
	return 1
}

}

invitewindow:

if(ok:=FindText(invitewindow[1], invitewindow[2], invitewindow[3], invitewindow[4], 0, 0, invitewindow[5]))
{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title1%,, LEFT, 1, NA
				goto, Find
}

if(ok:=FindText(ConfirmBtn[1], ConfirmBtn[2], ConfirmBtn[3], ConfirmBtn[4], 0, 0, ConfirmBtn[5]))

{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title1%,, LEFT, 1, NA
				goto, Find
}

				
return

invitewindowslave:

if(ok:=FindText(invitewindowslave[1], invitewindowslave[2], invitewindowslave[3], invitewindowslave[4], 0, 0, invitewindowslave[5]))
{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
				goto, Find
}

if(ok:=FindText(ConfirmBtnslave[1], ConfirmBtnslave[2], ConfirmBtnslave[3], ConfirmBtnslave[4], 0, 0, ConfirmBtnslave[5]))

{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
				goto, Find
}




return


repairMAIN:

if(ok:=FindText(invitewindow[1], invitewindow[2], invitewindow[3], invitewindow[4], 0, 0, invitewindow[5]))
			{

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
			}


					if(ok:=FindText(424, 323, 544, 361, 0, 0, ConfirmBtn[5] ))
					{
					goto, ConfirmBtn
					}
			
repairMAIN := 1
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 300

While(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
	goto repairMAIN
}
ControlClick, x550 y400, %Title%,, LEFT, 1, NA ; worldmap
sleep 1000
ControlClick, x237 y289, %Title%,, LEFT, 1, NA ; glastheim
sleep 500
ControlClick, x156 y262, %Title%,, LEFT, 1, NA ; glastheim hall
sleep 500
ControlClick, x412 y121, %Title%,, LEFT, 1, NA ; quest
sleep 500
ControlClick, x400 y331, %Title%,, LEFT, 1, NA ; map pinpoint
sleep 500
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 500
goto GHhallMain
return

repairSLAVE:
if(ok:=FindText(invitewindowslave[1], invitewindowslave[2], invitewindowslave[3], invitewindowslave[4], 0, 0, invitewindowslave[5]))
			{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
			}
			
					if(ok:=FindText(282, 718, 356, 740, 0, 0, ConfirmBtnSlave[5] ))
					{
					goto, ConfirmBtnSlave
					}

repairSLAVE = 1
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300

While(!ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{
	goto repairSLAVE
}
ControlClick, x366 y277, %Title3%,, LEFT, 1, NA ; worldmap
sleep 1000
ControlClick, x157 y204, %Title3%,, LEFT, 1, NA ; glastheim
sleep 500
ControlClick, x97 y187, %Title3%,, LEFT, 1, NA ; glastheim hall
sleep 500
ControlClick, x273 y93, %Title3%,, LEFT, 1, NA ; quest
sleep 500
ControlClick, x267 y234, %Title3%,, LEFT, 1, NA ; map pinpoint
sleep 500
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300
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