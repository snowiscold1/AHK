;;things to do add random 
#SingleInstance Force
#Include %A_ScriptDir%\configure.ini
IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
WaitingTime = 0
runonce := 0
;~ FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt



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
Gui,1: Show, w124 h280 %gui_position%, fern Only
Gui,1: +Hwndgui_id
return

GuiClose:
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

While(!ok:=FindText(906, 223, 972, 273, 0, 0, foundnpc))
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
 while(!ok:=FindText(1406, 261, 1584, 367, 0.1, 1, ChangeChannelBtn))
{
}
{
   CoordMode, Mouse
   X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 500
}

EnterLine:
 While (!ok:=FindText(1428, 99, 1510, 185, 0, 0, EnterLine))
 {

 }
 {
	WinActivate, %Title2%
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x667 y145, %Title2%,, LEFT, 1, NA
 
 }
 
  While (!ok:=FindText(881, 437, 923, 471, 0, 0, EnterLine2))
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
	WinActivate, %Title2%
   CoordMode, Mouse
     X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
 }
 
if (runonce=0)
{
	Send, %Number%
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
	Send, %Number%
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
	Send, %Number%
	}
}

sleep 500
ControlClick, x734 y124, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x340 y352, %Title2%,, LEFT, 1, NA


While (!ok:=FindText(991, 204, 1037, 230, 0, 0, CountryList))
{
}

gosub %Country%
sleep 500
ControlClick, x585 y447, %Title2%,, LEFT, 1, NA
sleep 1000

changechannelXbutton:
if(ok:=FindText(1488, 48, 1542, 104, 0, 0, changechannelXbutton))
{
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x717 y68, %Title2%,, LEFT, 1, NA
}


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; adel

jumperavatarslave:
While(!ok:=FindText(68, 533, 276, 581, 0, 0, jumperavatarslave))
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
While(!ok:=FindText(15, 682, 145, 732, 0, 0, FollowBtnslave))
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
While(!ok:=FindText(269, 713, 365, 747, 0, 0, ConfirmBtnslave))
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
While(!ok:=FindText(68, 533, 276, 581, 0, 0, jumperavatarfollowslave))
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
While(!ok:=FindText(15, 682, 145, 732, 0, 0, UnFollowBtnslave))
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
		
if(ok:=FindText(68, 533, 276, 581, 0, 0, jumperavatarfollowslave))
{
goto jumperavatarfollowslave
}
	

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
 If(ok:=FindText(342, 619, 492, 781, 0.1, 0.1, KingSchmitzslave))
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
		while(ok:=FindText(342, 619, 492, 781, 0.1, 0.1, KingSchmitzslave))
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

if (nomob = 10)
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
 While(!ok:=FindText(103, 47, 395, 113, 0, 0, jumperavatar))
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
While(!ok:=FindText(17, 231, 229, 349, 0, 0, FollowBtn))
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
While(!ok:=FindText(240, 304, 566, 364, 0, 0, ConfirmBtn))
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
While(!ok:=FindText(108, 47, 392, 107, 0, 0, jumperavatarfollow))
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
While(!ok:=FindText(17, 231, 229, 349, 0, 0, UnFollowBtn))
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
if(ok:=FindText(17, 231, 229, 349, 0, 0, jumperavatarfollow))
{
goto jumperavatarfollow
}

ControlClick, x774 y124, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x774 y128, %Title%,, LEFT, 1, NA
sleep 200
random,randX, 689, 691
random,randY, 334, 336
ControlClick, x%randX% y%randY%, BlueStacks,, LEFT, 1, NA ;location spot btm right
sleep 1000
if (CheckNearby=1){
runonce++	
gosub CheckNearby
}


runonce++
goto Find





Window:
DetectHiddenWindows, On
SetTitleMatchMode, 3
WinMove, %Title%,,0,0, 533, 341
WinMove, %Title2%,,0,0, 533, 341
WinMove, %Title3%,,0,0, 533, 341
WinMove, %Title4%,,0,0, 533, 341
WinMove, %Title5%,,0,0, 533, 341
sleep 500
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

 while(!ok:=FindText(525, 172, 739, 408, 0.1, 0.1, GhostCap))
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
				 while(ok:=FindText(525, 172, 739, 408, 0.1, 0.1, GhostCap))
				{
				}
			;~ ControlClick, x473 y236, %Title3%,, LEFT, 1, NA ;run location spot btm right
	}
	
	
sleep 5000 ; collect loot time

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
converted := SubStr("000" . target_time, -3)
target = %A_YYYY%%A_MM%%A_DD%%converted%00
EnvSub, target, %A_Now%, Seconds.

nextspawn := target * 1000 
nextspawninmin := (nextspawn/1000)/60


if (nextspawn < 600000) {

tooltip, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond,0,0
FileDelete, %A_ScriptDir%\log.txt
ControlClick, x509 y267, %Title3%,, LEFT, 1, NA
TrayTip , Ultimate Farm Bot, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond, 4 ;show for 4 seconds
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
						
					if(ok:=FindText(14, 179, 778, 411, 0, 0, %A_LoopField% ))
					{
					goto, %A_LoopField%
					}
					
					if(ok:=FindText(537, 63, 569, 83, 0, 0, %A_LoopField% ))
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
    if(ok:=FindText(101, 43, 399, 115, 0, 0, %A_LoopField% ))
	goto, %A_LoopField%
}
return



checkstatus(jumperstatus){
Loop, parse, slavestatus, `,
{
    if(ok:=FindText(101, 43, 399, 115, 0, 0, %A_LoopField% ))
	return 1
}

}

slavestatus:

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
					
					if(ok:=FindText(12, 623, 514, 773, 0, 0, %A_LoopField% ))
					{
					goto, %A_LoopField%
					}
                    
                    if(ok:=FindText(363, 546, 377, 558, 0, 0, %A_LoopField% ))
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
    if(ok:=FindText(9, 533, 265, 589, 0, 0, %A_LoopField% ))
	goto, %A_LoopField%
}
return



checkstatus2(slavestatus){
Loop, parse, slavestatus, `,
{
    if(ok:=FindText(9, 533, 265, 589, 0, 0, %A_LoopField% ))
	return 1
}

}

invitewindow:

if(ok:=FindText(537, 63, 569, 83, 0, 0, invitewindow))
{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title1%,, LEFT, 1, NA
				goto, Find
}

				
return

invitewindowslave:

if(ok:=FindText(363, 546, 377, 558, 0, 0, invitewindowslave))
{	

				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
				goto, Find
}
				
return


repairMAIN:

repairMAIN := 1
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 300

While(!ok:=FindText(516, 380, 586, 412, 0, 0, worldmap))
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
repairSLAVE = 1
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 300

While(!ok:=FindText(343, 762, 385, 776, 0, 0, worldmapslave))
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
If (i>200){
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
 









^T:: msgbox, %totalkill% %debug% %nomob% %i%
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