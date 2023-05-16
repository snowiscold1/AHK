;;things to do add random 
#SingleInstance Force
char:= "backup"
#Include %A_ScriptDir%\botschmitzcfg.ini

WinMove, %Title3%,,1066,331, 533, 331

DetectHiddenWindows, On
SetTitleMatchMode, 3

WinGet, Title3ID, ID, %Title3%

WaitingTime=0
jumpa=0
SetTitleMatchMode, 2
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
IfWinNotExist, %deletelog% ahk_class AutoHotkey
{
run %deletelog% ahk_class AutoHotkey
}


f7::
Find:
IniRead, Stop , %A_ScriptDir%\pos.ini, Backup, Stop:
				if (Stop=1) {
				gosub logfullgoalt
			}

FindText_BindWindow(Title3ID)
while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	sleep 1000
	ControlClick, x477 y52, %Title3%,, LEFT, 1, NA
}
gosub openmapslave



FindText_BindWindow(Title3ID)
while(!ok:=FindText(GHhallSlave[1], GHhallSlave[2], GHhallSlave[3], GHhallSlave[4], 0, 0, GHhallSlave[5]))
{
	if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
	if (WaitingTime=3) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto Find
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
	ControlClick, x334 y77, %Title3%,, LEFT, 1, NA ;chgechatmap
	sleep 1000
EnterLine:
log(Title3 " is looking for available channel ...")
FindText_BindWindow(Title3ID)
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
				 goto Find
				}
				 
 }
 {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				sleep 500
				ControlClick, x440 y100, %Title3%,, LEFT, 1, NA  ; enterline
 }

FindText_BindWindow(Title3ID)
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
				CoordMode, Mouse
				X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
 }
 SetKeyDelay, 200
 
	if (jumpa=1) 
	{
		jumpa=0
		Number++
		gosub countrycycle
		CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				IniRead, Stop , %A_ScriptDir%\pos.ini, Backup, Stop:
				if (Stop=1) {
				goto logfullgoalt
			}
				Number++
				gosub countrycycle
				CountNumb := % Country " "Number
			}  
		ControlSend, ,%Number%, %Title3%
	}

	else 
	{
		jumpa=0
		gosub shufflechannel
		CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				IniRead, Stop , %A_ScriptDir%\pos.ini, Backup, Stop:
				if (Stop=1) {
				goto logfullgoalt
			}
				gosub shufflechannel
				CountNumb := % Country " "Number
			}  
		ControlSend, ,%Number%, %Title3%
	}

sleep 500
ControlClick, x496 y306, %Title3%,, LEFT, 1, NA
sleep 500
ControlClick, x239 y245, %Title3%,, LEFT, 1, NA ; open country list
sleep 500
FindText_BindWindow(Title3ID)
While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				ControlClick, x239 y245, %Title3%,, LEFT, 1, NA ; open country list
				sleep 500
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


while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	c++
	ControlClick, x382 y303, %Title3%,, LEFT, 1, NA
	sleep 1000
	if (c>4) {
		c=0
		runonce++
		goto changechannelXbutton
		}
}
runonce++
c=0



changechannelXbutton:
FindText_BindWindow(Title3ID)

if(ok:=FindText(dontremind[1], dontremind[2], dontremind[3], dontremind[4], 0, 0, dontremind[5]))
{
				CoordMode, Mouse
				X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
				sleep 500
				ControlClick, x318 y259, %Title3%,, LEFT, 1, NA
}


while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	sleep 1000
	ControlClick, x477 y52, %Title3%,, LEFT, 1, NA
}
gosub openmapslave
sleep 1000
random,randX, 408,409
random,randY, 194, 196
ControlClick, x%randX% y%randY%, %Title3%,, LEFT, 1, NA ;location spot btm right

waitjump:

While (!ok:=FindText(skillbarjumpch[1],skillbarjumpch[2],skillbarjumpch[3],skillbarjumpch[4], 0, 0, skillbarjumpch[5]))
 {
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime=10) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 failjump++
				
				 if (failjump<5)
				{
					goto Find
				}
				 if (failjump>4)
				{
					gosub resetguildch
					failjump=0
					goto Find
				}
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				failjump=0
While (ok:=FindText(skillbarjumpch[1],skillbarjumpch[2],skillbarjumpch[3],skillbarjumpch[4], 0, 0, skillbarjumpch[5]))
 {
}
				if (!ok:=FindText(atkon[1],atkon[2],atkon[3],atkon[4], 0, 0, atkon[5]))
				{
					goto KingSchmitzslave
				}

			

checkavatarexist:
gosub checkchanges
While (!ok:=FindText(atkcd[1],atkcd[2],atkcd[3],atkcd[4], 0, 0, atkcd[5]))
 {
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				
				if (WaitingTime>4) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				random,randX, 408,409
				random,randY, 194, 196
				ControlClick, x%randX% y%randY%, %Title3%,, LEFT, 1, NA ;location spot btm right
				nomob++
				log(Title3 " is unable to find King Schmitz at " CountNumb " ...")
				gosub openmapslave
				goto Find
				}
}

{
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				nomob = 0
				jumpa = 1
				totalkill++
				log(Title3 " has found King Schmitz at " CountNumb " ...")
				gosub movetilstop
				DetectHiddenWindows, On
				SetTitleMatchMode, 2
				FileAppend, %CountNumb%`n, %A_ScriptDir%\logfoundbackup.txt
				sleep 1000 ; killtime
				ControlClick, x336 y305, %Title3%,, LEFT, 1, NA ; kill
				sleep 3000

				goto Find
}

KingSchmitzslave:

while(!ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				ControlClick, x511 y270, %Title3%,, LEFT, 1, NA
				sleep 2000
}
FindText_BindWindow(Title3ID)

 while(!ok:=FindText(KingSchmitzslave[1], KingSchmitzslave[2], KingSchmitzslave[3], KingSchmitzslave[4], 0.1, 0.1, KingSchmitzslave[5]))
{
			 SetTimer, MaxTime, 1000
			 sleep 1000
			 if (WaitingTime=9) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
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

			 if(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
			 {		
				CoordMode, Mouse
				X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
				sleep 1000
			 }
				
			random,randX, 408,409
			random,randY, 194, 196
			ControlClick, x%randX% y%randY%, %Title3%,, LEFT, 1, NA ;location spot btm right
			nomob++
			log(Title3 " is unable to find King Schmitz at " CountNumb " ...")
			 if (nomob = 5)
			{
				gosub waitnextspawn
				goto KingSchmitzslave
				
			}
			gosub openmapslave
			goto Find
			 }
}
	
	
	
{	
			setTimer, MaxTime, off
			Tooltip, 
			WaitingTime=0
			CoordMode, Mouse
			X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
			random, randX, x-3, x+3
			random, randY, y-1, y+1
			ControlClick, x%randX% y%randY%, %Title3%,, LEFT, 1, NA
			sleep 1000
			nomob = 0
			jumpa = 1
			totalkill++
			log(Title3 " has found King Schmitz at " CountNumb " ...")
			while(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				CoordMode, Mouse
				X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
}
			sleep 1000
			gosub movetilstop
				DetectHiddenWindows, On
				SetTitleMatchMode, 2
				FileAppend, %CountNumb%`n, %A_ScriptDir%\logfoundbackup.txt
				sleep 1000 ; killtime
				ControlClick, x336 y305, %Title3%,, LEFT, 1, NA ; kill
				sleep 3000

goto Find

}

return



countrycycle:

if (Country = "EN") 
{

	if(Number>14) 
	{
		gosub nextcountry
	}
	
}

if (Country = "TH") 
{
	if(Number>60) 
	{
		gosub nextcountry
	}
	
}

if (Country = "PH") 
{
	if(Number>28) 
	{
		gosub nextcountry
	}
	
}


if (Country = "ID") 
{
	if(Number>22) 
	{
		gosub nextcountry
	}
	
}

if (Country = "CN") 
{
	if(Number>3) 
	{
		gosub nextcountry
	}
	
}

if (Country = "VN") 
{
	if(Number>3) 
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

;ControlClick, x509 y267, %Title3%,, LEFT, 1, NA
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

;Country := "VN"
;Number := 0
sleep 1000
;goto KingSchmitzslave
}

return



shufflechannel:
random, NextCount, 1, 6
x := % CountryAvailable[NextCount]
Country = % x

if (Country = "EN") 
{
	random, Number, 1, 14	
}

if (Country = "TH") 
{
	random, Number, 1, 60	
}

if (Country = "PH") 
{
	random, Number, 1, 28	
	
}


if (Country = "ID") 
{
	random, Number, 1, 22	
}

if (Country = "CN") 
{
	random, Number, 1, 3
}

if (Country = "VN") 
{
	random, Number, 1, 3
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
	global
i:=1
Loop, Read, %A_ScriptDir%\log.txt
{
    ++i
}
If (i>128){
  
gosub logfullgoalt


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
 
 
 

; Get the RGB value of all the points of the picture to the array
FindText_ShowArea(x:="", y:="", Active_width:="", Active_height:="")
{
  local
  if (x="")
  {
    VarSetCapacity(pt,16,0), DllCall("GetCursorPos","ptr",&pt)
    x:=NumGet(pt,0,"uint"), y:=NumGet(pt,4,"uint")
  }
  x:=Round(x), y:=Round(y), w:=Round(Active_width)  h:=Round(Active_height)
  ;-------------------------
  Gui, _ShowArea_: +AlwaysOnTop -Caption +ToolWindow +Hwndmyid +E0x08000000
  Gui, _ShowArea_: Show, Hide w%w% h%h%
  ;-------------------------
  dhw:=A_DetectHiddenWindows
  DetectHiddenWindows, On
  d:=4, i:=w-d, j:=h-d
  s=0-0 %w%-0 %w%-%h% 0-%h% 0-0
  s=%s%  %d%-%d% %i%-%d% %i%-%j% %d%-%j% %d%-%d%
  WinSet, Region, %s%, ahk_id %myid%
  DetectHiddenWindows, %dhw%
  ;-------------------------
  Gui, _ShowArea_: Show, NA x%x% y%y%
  Loop, 4
  {
    Gui, _ShowArea_: Color, % A_Index & 1 ? "Red" : "Blue"
    Sleep, 500
  }
  Gui, _ShowArea_: Destroy
}

GetPicArr(x, y, w, h)
{
  ListLines, % (lls:=A_ListLines=0?"Off":"On") ? "Off":"Off"
  SetBatchLines, % (bch:=A_BatchLines) ? "-1":"-1"
  FindText_ScreenShot(x, y, x+w-1, y+h-1)
  arr:=[], i:=1
  Loop, % h {
    yy:=y+A_Index-1
    Loop, % w {
      xx:=x+A_Index-1
      , arr[i++]:=FindText_ScreenShot_GetColor(xx, yy)
    }
  }
  SetBatchLines, %bch%
  ListLines, %lls%
  return arr
}

; Check whether all change points in the picture exceed the percentage

ComparePicArr(arr1, arr2, n:=0.3)
{
  diff:=0, diffMax:=Round(arr1.MaxIndex()*n)
  For k,v in arr1
    if (diff+=(arr2[k]!=v))>diffMax
      return, 1
  return, 0
}

Tip(s:="") {
  SetTimer, %A_ThisFunc%, % s="" ? "Off" : -2000
  ToolTip, %s%, 0, 0
}




log(msg){
	global
	FormatTime, TimeString, A_Now, yyyyMMdd HH:mm:ss  ; 
	controlgettext, Console, Edit1, Fern Bot ahk_class AutoHotkeyGUI
	
	static oArrayText := [] 
	Loop, parse, Console, `n, `r  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.
{
	i++
	nc:= TF_ReadLines(Console,A_Index,A_Index,1)
	oArrayText.push(nc)

	if (i>=100)
		break
}

	str := "" 
	for each, line in oArrayText
	{
		If (str <> "") ; str is not empty, so add a line feed
		str .= "`r`n"
		str .= line
	}
	
	controlsettext, Edit1, %TimeString% - %msg%`r`n%str%, Fern Bot ahk_class AutoHotkeyGUI
	sendError(msg)
	if oArrayText.MinIndex() != ""  ; Not empty.
    oArrayText.Delete(oArrayText.MinIndex(), oArrayText.MaxIndex())
	return
}


sendError(msg){
	url:="https://discord.com/api/webhooks/950759671063515136/xVk8HNfLk3RTrXgTKHcO5AXilpOWitLIuQy6xXuzL7RfeXn2dW6R-ImtLStZKcMqt-Za"
	postdata=
	(
	{
	  "content": "%msg%"
	}
	) ;Use https://leovoel.github.io/embed-visualizer/ to generate above webhook code
	
	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("POST", url, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
	WebRequest.Send(postdata)  
}

resetguildch:
log(Title3 " is entering guildhall to reset gui")

if(ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{	
ControlClick, x498 y75, %Title3%,, LEFT, 1, NA ;map
sleep 1000
}

while(!ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x446 y60, %Title3%,, LEFT, 1, NA ;menu
	sleep 1000
}
while(ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x361 y165, %Title3%,, LEFT, 1, NA ;guild
	sleep 1000
}

while(!ok:=FindText(enterhall[1], enterhall[2], enterhall[3], enterhall[4], 0, 0, enterhall[5]))
{
}
while(ok:=FindText(enterhall[1], enterhall[2], enterhall[3], enterhall[4], 0, 0, enterhall[5]))
{
	ControlClick, x352 y301, %Title3%,, LEFT, 1, NA ; enterguild
	sleep 1000
}
sleep 20000
gosub openmapslave
while(!ok:=FindText(leaveguild[1], leaveguild[2], leaveguild[3], leaveguild[4], 0, 0, leaveguild[5]))
{
}
while(ok:=FindText(leaveguild[1], leaveguild[2], leaveguild[3], leaveguild[4], 0, 0, leaveguild[5]))
{
	ControlClick, x318 y238, %Title3%,, LEFT, 1, NA ;leave
	sleep 1000
}
while(!ok:=FindText(confirmleave[1], confirmleave[2], confirmleave[3], confirmleave[4], 0, 0, confirmleave[5]))
{
}
while(ok:=FindText(confirmleave[1], confirmleave[2], confirmleave[3], confirmleave[4], 0, 0, confirmleave[5]))
{
	ControlClick, x315 y170, %Title3%,, LEFT, 1, NA ; confirm leave
	sleep 1000
}

sleep 10000
return
 
openmapslave:
while(!ok:=FindText(worldmapslave[1], worldmapslave[2], worldmapslave[3], worldmapslave[4], 0, 0, worldmapslave[5]))
{	
ControlClick, x498 y75, %Title3%,, LEFT, 1, NA
sleep 1000
}
return


MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return
			

checkchanges:
FindText_BindWindow(Title3ID)
sleep 6000
loop, {
	cou++
	
  pic1:=GetPicArr(1229,604,20,20)
  Sleep, 2000
  pic2:=GetPicArr(1229,604,20,20)
  if (!ComparePicArr(pic1, pic2, n:=0.001)) {
	break
	}
	if cou>15)
	{
		cou=0
		break
	}
}

loop, {
	cou++
	
  pic1:=GetPicArr(1229,604,20,20)
  Sleep, 2000
  pic2:=GetPicArr(1229,604,20,20)
  if (!ComparePicArr(pic1, pic2, n:=0.001)) {
	break
	}
	if cou>15)
	{
		cou=0
		break
	}
}

return
  

movetilstop:
ControlClick, x430 y208, %Title3%,, LEFT, 1, NA ;location far btm right
sleep 10000
loop, {
	cou++
ControlClick, x430 y208, %Title3%,, LEFT, 1, NA ;location far btm right
  pic1:=GetPicArr(1229,604,20,20)
  Sleep, 1000
  pic2:=GetPicArr(1229,604,20,20)
  if (!ComparePicArr(pic1, pic2, n:=0.001)) {
	break
	}
	if cou>15)
	{
		cou=0
		break
	}
}


loop, {
	cou++
ControlClick, x430 y208, %Title3%,, LEFT, 1, NA ;location far btm right
  pic1:=GetPicArr(1229,604,20,20)
  Sleep, 1000
  pic2:=GetPicArr(1229,604,20,20)
  if (!ComparePicArr(pic1, pic2, n:=0.001)) {
	break
	}
	if cou>15)
	{
		cou=0
		break
	}
}


return

SlideUp:
CoordMode,Mouse, Screen
MouseGetPos, hereX, hereY
Click, 1481,564, Down
sleep 300
MouseMove, 1481,463 ,10
sleep 300
Click, 1481, 463, Up
MouseMove, %hereX%, %hereY%
return

logfullgoalt:

while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	
	ControlClick, x477 y52, %Title3%,, LEFT, 1, NA
	sleep 1000
}
gosub openmapslave

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
tooltip, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond,0,0
	sleep % nextspawn
IniWrite, 0,%A_ScriptDir%\pos.ini, Backup, Stop:
tooltip,

return


ID:
while(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
	sleep 500
}

return

TH:
while(ok:=FindText(TH[1], TH[2], TH[3], TH[4], 0, 0, TH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
	sleep 500
}
return

CN:
while(ok:=FindText(CN[1], CN[2], CN[3], CN[4], 0, 0, CN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
	sleep 500

}
return

VN:
while(ok:=FindText(VN[1], VN[2], VN[3], VN[4], 0, 0, VN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
	sleep 500

}
return

EN:
while(ok:=FindText(EN[1], EN[2], EN[3], EN[4], 0, 0, EN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
	sleep 500
}
return

PH:
while(ok:=FindText(PH[1], PH[2], PH[3], PH[4], 0, 0, PH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y-(331), Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title3%,, LEFT, 1, NA
	sleep 500
}
return



f8::
reload



