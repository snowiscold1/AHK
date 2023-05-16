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










Find:
ControlClick, x742 y128, %Title%,, LEFT, 1, NA
sleep 100
ControlClick, x497 y97, %Title3%,, LEFT, 1, NA
sleep 100





findnpc:
Gui,1:Destroy

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
				ControlClick, x389 y240, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x389 y240, %Title2%,, LEFT, 1, NA ; click npc change chg
				goto ChangeChannel
			}
	
	
}

				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
sleep 1000
ControlClick, x389 y240, %Title2%,, LEFT, 1, NA ; click npc change ch
sleep 500
ControlClick, x389 y240, %Title2%,, LEFT, 1, NA ; click npc change ch
}


else
{
ControlClick, x389 y240, %Title2%,, LEFT, 1, NA ; click npc change ch
sleep 500
ControlClick, x389 y240, %Title2%,, LEFT, 1, NA ; click npc change ch
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
				WaitingTime=0	
				setTimer, MaxTime, off
				Tooltip, 

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

waitsettle := [919, 45, 965, 75, "|<>**50$8.znuXcO6kUh6"]
waitsettle:
FindText_BindWindow(Title2ID)
While (ok:=FindText(waitsettle[1], waitsettle[2], waitsettle[3], waitsettle[4], 0, 0, waitsettle[5]))
{
}
sleep 1000
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
Click, 418,751, Down
sleep 300
MouseMove, 418,600 ,10
sleep 300
Click, 418, 600, Up
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