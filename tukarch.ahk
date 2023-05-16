;;things to do add random 
#SingleInstance Force
foundnpc:= [879, 193, 933, 241,"|<>0x392018@0.92$14.Tw7z0zkDw3zUzsDy3zkzyjznzs1w7y3k2"]
ChangeChannelBtn:= [1468, 671, 1584, 743,"|<>**50$50.TU00DU01wjzzqDzzqsa95Mm8ZistpSofVRce5pAe+pzzzxzzzz006E0000001w00002|<>**50$50.TU00TU01wjzzqTzzqsWVJQOeZystlTkvVQe+5IAe+Jzzzxzzzz002E0000000s00002|<>**50$50.TU00DU01wjzzqDzzqsa95Mm8ZistpSofVRce5pAe+pzzzxzzzz006E00008"]
changechannelXbutton := [1527, 537, 1555, 563,"|<>**50$13.w7n6sqSCBWAMA6A6368qCCBXgPQ7E"]
EnterLine := [1478, 590, 1534, 610,"|<>*222$32.zzzyzltzvjxU16k8/47g8Cl5v24B9S8cU"]
EnterLine2:=[1060, 789, 1138, 827,"|<>*200$25.s001EYE8CeY4QJS2C+U17|<>**50$14.s88GPedWfseW"]
CountryList :=[1195, 639, 1219, 679,"|<>*172$8.XQq/uM"]
CountryAvailable := ["EN","TH","PH","ID","CN","VN"]
closept :=[1507, 540, 1565, 612,"|<>*173$11.DuDWCC8y3yDsDWCC8y/yk"]
worldmap :=[1351, 711, 1383, 749,"|<>**50$20.3lw3U3Vk7As3tg0nO0SPU5aE0P5kBVQTML7o5ttVT3QPMTiP3PrkxiyStnaQC0C0zy03y0U"]

Title6 := "mintabuff"
WinMove, %Title6%,,1066,491, 533,341
DetectHiddenWindows, On
SetTitleMatchMode, 3
WinGet, Title6ID, ID, %Title6%

IniRead, gui_position, %A_ScriptDir%\pos.ini, window position, gui_position, Center
IniWrite, 0,%A_ScriptDir%\pos.ini, Music, prevamt:
WaitingTime = 0
runonce := 0
;~ FileAppend, %CountNumb%`n, %A_ScriptDir%\logch.txt

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
ControlClick, x138 y158, %Title6%,, LEFT, 1, NA
return

TH:
ControlClick, x138 y172, %Title6%,, LEFT, 1, NA
return

PH:
ControlClick, x138 y188, %Title6%,, LEFT, 1, NA
return

ID:
ControlClick, x138 y205, %Title6%,, LEFT, 1, NA
return

CN:
ControlClick, x140 y220, %Title6%,, LEFT, 1, NA
return

VN:
ControlClick, x138 y234, %Title6%,, LEFT, 1, NA
return




;nurse



Start:
Gui,1:Submit, NoHide
findnpc:
Gui,1:Destroy

FindText_BindWindow(Title6ID)
if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(1066), Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x717 y68, %Title6%,, LEFT, 1, NA
}


if (runonce=0)
{
gosub openmapnurse
sleep 500
ControlClick, x376 y113, %Title6%,, LEFT, 1, NA ; pinpoint npc change ch
sleep 500

While(!ok:=FindText(foundnpc[1], foundnpc[2], foundnpc[3], foundnpc[4], 0, 0, foundnpc[5]))
{
	SetTimer, MaxTime, 1000
	sleep 1000
	if (WaitingTime=15) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x260 y180, %Title6%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x260 y180, %Title6%,, LEFT, 1, NA ; click npc change chg
				goto ChangeChannel
			}
	
	
}

				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
sleep 1000
				ControlClick, x260 y180, %Title6%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x260 y180, %Title6%,, LEFT, 1, NA ; click npc change chg
}


else
{
				ControlClick, x260 y180, %Title6%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x260 y180, %Title6%,, LEFT, 1, NA ; click npc change chg
}

ChangeChannel:

FindText_BindWindow(Title6ID)
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
				ControlClick, x376 y113, %Title6%,, LEFT, 1, NA ; pinpoint npc change ch
				 sleep 5000
				 
				 goto findnpc
				 }	
}

{
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				;~ sleep 500
				
	CoordMode, Mouse, Client
    X:=ok.1.x-(1066), Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title6%,, LEFT, 1, NA

   sleep 500
}

EnterLine:
FindText_BindWindow(Title6ID)
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
	;~ WinActivate, %Title6%
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(1066), Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title6%,, LEFT, 1, NA
 
 }

FindText_BindWindow(Title6ID)
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
	;~ WinActivate, %Title6%
	CoordMode, Mouse
    X:=ok.1.x-(1066), Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title6%,, LEFT, 1, NA
 }
 
if (runonce=0)
{
ControlSend, ,%Number%, %Title6%
	CountNumb := % Country " "Number
FileAppend, %CountNumb%`n, %A_ScriptDir%\logch.txt
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
	ControlSend, ,%Number%, %Title6%
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
ControlSend, ,%Number%, %Title6%
	}
}

sleep 500
ControlClick, x483 y124, %Title6%,, LEFT, 1, NA
sleep 500
ControlClick, x240 y253, %Title6%,, LEFT, 1, NA

FindText_BindWindow(Title6ID)
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
ControlClick, x387 y310, %Title6%,, LEFT, 1, NA
sleep 1000

changechannelXbutton:
FindText_BindWindow(Title6ID)
if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(1066), Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title6%,, LEFT, 1, NA
}
gosub openmapnurse
ControlClick, x500 y90, %Title6%,, LEFT, 1, NA ; party
sleep 500
ControlClick, x367 y65, %Title6%,, LEFT, 1, NA ; party



waitsettle := [1107, 712, 1325, 770, "|<>*230$8.rg61sLujxM|<>*230$8.rg61sLujdM|<>**50$9.yuOUA0UAUY61vQ|<>**50$10.yxBM3U20t1Y70yqU"]
waitsettle:
FindText_BindWindow(Title6ID)
while(!ok:=FindText(closept[1],closept[2],closept[3],closept[4], 0, 0, closept[5]))
{

ControlClick, x367 y65, %Title6%,, LEFT, 1, NA ; party
sleep 1000
}

While (!ok:=FindText(waitsettle[1], waitsettle[2], waitsettle[3], waitsettle[4], 0, 0, waitsettle[5]))
{	

}

While (ok:=FindText(waitsettle[1], waitsettle[2], waitsettle[3], waitsettle[4], 0, 0, waitsettle[5]))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=10 && lawan!=1) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 lawan = 1
				 jumpa = 1
				FileRead, text, %A_ScriptDir%\logch.txt
				FileDelete, %A_ScriptDir%\logch.txt
				FileAppend, % SubStr(text, 1, RegExMatch(text, "\R.*\R?$")), %A_ScriptDir%\logch.txt
				
Loop, read, %A_ScriptDir%\logch.txt
{
	LastLine := A_LoopReadLine
}

lastcountnumb := StrSplit(LastLine, A_Space, ".")  ; Omits periods.
Country := lastcountnumb[1]
Number :=  lastcountnumb[2]


				ControlClick, x478 y57, %Title6%,, LEFT, 1, NA ; party close
				sleep 1000
				runonce++
				goto Findnpc
				 
				}
}
goto repair
^k::
repair:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0	
				lawan = 0
sleep 2000
if(ok:=FindText(closept[1],closept[2],closept[3],closept[4], 0, 0, closept[5]))
{
sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(1066), Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title6%,, LEFT, 1, NA
}
sleep 1000
runonce++
goto Findnpc




^W::
Window:
DetectHiddenWindows, On
SetTitleMatchMode, 3
WinMaximize, %Title%
WinMaximize, %Title6%,
WinMaximize, %Title3%
WinMaximize, %Title4%
WinMaximize, %Title5%
sleep 1000
WinMove, %Title%,,0,0, 800, 491
WinMove, %Title6%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 

return

MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
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
Loop, Read, %A_ScriptDir%\logch.txt
{
    ++i
}
If (i>250){
    FileDelete, %A_ScriptDir%\logch.txt
	TrayTip , Deleting logch.txt, Country log has been reset, 4 ;show for 4 seconds
	
}
        ;Means 13 non empty lines in the file
        ;Indicating each value of rand from 0 to 12 has been generated once
        ;No new value can be generated, hence delete
		
Loop, Read, %A_ScriptDir%\logch.txt
{
    If (A_LoopReadLine=CountNumb){
        return 1
	}
}
;Will reach here only if rand is not in file
;Write rand to file, and return 0
FileAppend, %CountNumb%`n, %A_ScriptDir%\logch.txt
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

openmapnurse:
if(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{	
ControlClick, x491 y82, %Title6%,, LEFT, 1, NA
sleep 100
}
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
 FileDelete, %A_ScriptDir%\logch.txt
	TrayTip , Deleting logch.txt, Country log has been reset, 4 ;show for 4 seconds
	return
Q::ExitApp