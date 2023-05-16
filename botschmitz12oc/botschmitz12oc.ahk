;;things to do add random 
#SingleInstance Force
char:= "first"
#Include %A_ScriptDir%\botschmitz12oc_config.ini
WinGet, TitleID, ID, %Title%
SetControlDelay, -1
runonce=0
kill=0
#Persistent
SetTimer, autogetcard, 1000
SetTimer, refreshD, 1000
SetTimer, backtologin, 5000

Gui,2: +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui,2: Color, CCCCCC
;~ Gui, Font, cFF0000 s15 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
Gui,2: Font, cFFFFFF s7 , verdana  ;white
FormatTime, MyTime,, hh:mm:ss tt
Gui,2: Add, Text, y0 BackgroundTrans, Start Time = %mytime%
Gui,2: Add, Text, vCounter x8 y10 BackgroundTrans, Total Kill(s) = %Kill%00000
Gui,2: Add, Text, vCounterCard x8 y20 BackgroundTrans, Total Card(s) = %Card%00000
Gui,2: Show, NoActivate x1071 y123,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime



ID:
while(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

TH:
while(ok:=FindText(TH[1], TH[2], TH[3], TH[4], 0, 0, TH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA

}
return

CN:
while(ok:=FindText(CN[1], CN[2], CN[3], CN[4], 0, 0, CN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

VN:
while(ok:=FindText(VN[1], VN[2], VN[3], VN[4], 0, 0, VN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

EN:
while(ok:=FindText(EN[1], EN[2], EN[3], EN[4], 0, 0, EN[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

PH:
while(ok:=FindText(PH[1], PH[2], PH[3], PH[4], 0, 0, PH[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
}
return

f1::
Find:

gosub inpost

while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	sleep 1000
	ControlClick, x477 y52, %Title%,, LEFT, 1, NA
}

FindText_BindWindow(TitleID)
while(!ok:=FindText(GHhallMain[1], GHhallMain[2], GHhallMain[3], GHhallMain[4], 0, 0, GHhallMain[5]))
{
	if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
	if (WaitingTime=3) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 goto find
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
	ControlClick, x334 y77, %Title%,, LEFT, 1, NA ;chgechatmap
	sleep 1000
EnterLine:
FindText_BindWindow(TitleID)
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
				 goto find
				}
				 
 }
 {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				sleep 500
				ControlClick, x440 y100, %Title%,, LEFT, 1, NA  ; enterline
 }

FindText_BindWindow(TitleID)
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
				X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
 }
 SetKeyDelay, 200
runonce=0
if (runonce=0)
{
gosub shufflechannel
	CountNumb := % Country " "Number
		while(InFile(CountNumb))
			{
				gosub shufflechannel
				CountNumb := % Country " "Number
			}  
ControlSend, ,%Number%, %Title%
;FileAppend, %CountNumb%`n, %A_ScriptDir%\log.txt

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
	ControlSend, ,%Number%, %Title%
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
ControlSend, ,%Number%, %Title%
	}
}

sleep 500
ControlClick, x496 y306, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x239 y245, %Title%,, LEFT, 1, NA ; open country list

FindText_BindWindow(TitleID)
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
ControlClick, x382 y303, %Title%,, LEFT, 1, NA
sleep 1000

changechannelXbutton:
FindText_BindWindow(TitleID)

while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	sleep 1000
	ControlClick, x477 y52, %Title%,, LEFT, 1, NA
}

runonce++
gosub inpost


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
				 goto Find
				}
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0


KingSchmitz:
FindText_BindWindow(TitleID)
while(!ok:=FindText(KingSchmitz[1], KingSchmitz[2], KingSchmitz[3], KingSchmitz[4], 0.1, 0.1, KingSchmitz[5]))
{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime>2) {
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					nomob++
					if (nomob = 5)
						{
							gosub waitnextspawn
						}

						gosub openmap
						runonce++
						goto Find
				}
			}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				nomob = 0
				jumpa = 1


KingSchmitzhit:
sleep 1000
	ControlClick, x336 y306, %Title%,, LEFT, 1, NA ; prepare for elite main char
	sleep 500
	kill++
gosub ChainPaused
sleep 500
	ControlClick, x370 y306, %Title%,, LEFT, 1, NA ; 2nd slot
	sleep 7000
		
	ControlClick, x370 y306, %Title%,, LEFT, 1, NA ; 2nd slot
sleep 1000
	ControlClick, x370 y306, %Title%,, LEFT, 1, NA ; 2nd slot
sleep 1500
	gosub ChainPlay
	nomob = 0
	jumpa = 1
	totalkill++
	sleep 17000 ;loot
	goto Find


	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ChainPaused:
ControlClick, x59 y102, %Title%,, LEFT, 1, NA ; status
sleep 500

while(!ok:=FindText(ChainPaused[1], ChainPaused[2], ChainPaused[3], ChainPaused[4], 0, 0, ChainPaused[5]))
{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime>0) {
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					if(ok:=FindText(ChainPlay[1], ChainPlay[2], ChainPlay[3], ChainPlay[4], 0, 0, ChainPlay[5]))
					{
					ControlClick, x59 y102, %Title%,, LEFT, 1, NA ; status
					return
					}
					goto ChainPaused
				}	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
		CoordMode, Mouse
		X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 500
		ControlClick, x59 y102, %Title%,, LEFT, 1, NA ; status

	return

ChainPlay:
ControlClick, x59 y102, %Title%,, LEFT, 1, NA ; status
sleep 500


while(!ok:=FindText(ChainPlay[1], ChainPlay[2], ChainPlay[3], ChainPlay[4], 0, 0, ChainPlay[5]))
{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime>0) {
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					if(ok:=FindText(ChainPaused[1], ChainPaused[2], ChainPaused[3], ChainPaused[4], 0, 0, ChainPaused[5]))
					{
					ControlClick, x59 y102, %Title%,, LEFT, 1, NA ; status
					return
					}
					goto ChainPlay
				}	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
		CoordMode, Mouse
		X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA	
		sleep 500
		ControlClick, x59 y102, %Title%,, LEFT, 1, NA ; status


return









MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
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



inpost:
gosub openmap
ControlClick, x374 y85, %Title%,, LEFT, 1, NA ;location spot upper right
sleep 1500
ControlClick, x374 y85, %Title%,, LEFT, 1, NA ;location spot upper right
while(!ok:=FindText(inpost[1], inpost[2], inpost[3], inpost[4], 0, 0, inpost[5]))
{
				if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}
				
				if (WaitingTime>2) {
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					goto inpost

				}
			

}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
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
;ControlClick, x509 y267, %Title%,, LEFT, 1, NA
TrayTip , Ultimate Farm Bot, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond, 4 ;show for 4 seconds



Sleep, % nextspawn
tooltip,

Country := "VN"
Number := 0
sleep 1000

goto KingSchmitz
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


backtologin:

if(ok:=FindText(login[1], login[2], login[3], login[4], 0, 0, login[5]))
{
	Critical
	while(ok:=FindText(login[1], login[2], login[3], login[4], 0, 0, login[5]))
	{
		ControlClick, x266 y205, %Title%,, LEFT, 1, NA ; back to login
		sleep 1000
	}
sleep 30000
ControlClick, x270 y253, %Title%,, LEFT, 1, NA ; press to start
sleep 10000
ControlClick, x270 y253, %Title%,, LEFT, 1, NA ; press to start
sleep 10000
ControlClick, x39 y185, %Title%,, LEFT, 1, NA ; choose char
sleep 5000
ControlClick, x39 y185, %Title%,, LEFT, 1, NA ; choose char
sleep 600000

ControlClick, x465 y300, %Title%,, LEFT, 1, NA ; start
sleep 1000
	while(!ok:=FindText(popupstart[1], popupstart[2], popupstart[3], popupstart[4], 0, 0, popupstart[5]))
	{
	}
sleep 1000
ControlClick, x413 y63, %Title%,, LEFT, 1, NA ; closepopup
sleep 1000
Critical, Off
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

RefreshD:

GuiControl,2:, Counter, Total Kill(s) = %kill%
GuiControl,2:, CounterCard, Total Card(s) = %Card%
return

openmap:
if(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{	
ControlClick, x498 y75, %Title%,, LEFT, 1, NA
sleep 100
}
return
 
autogetcard:
 if(ok:=FindText(Getcard[1],Getcard[2], Getcard[3], Getcard[4], 0, 0, Getcard[5]))
 {
 Card++
   CoordMode, Mouse
   X:=ok.1.x-(1066), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
   sleep 1000
  }
  
  return
  


SlideDown:
CoordMode,Mouse, Screen
MouseGetPos, hereX, hereY
Click, 412,485, Down
sleep 300
MouseMove, 412,590,10
sleep 300
Click, 412,590,Up
MouseMove, %hereX%, %hereY%
return




f2:: 
WinGetPos, gui_x, gui_y,,, ahk_id %gui_id%
IniWrite, x%gui_x% y%gui_y%,%A_ScriptDir%\pos.ini, window position, gui_position
Reload
return

^Del:: 
 FileDelete, %A_ScriptDir%\log.txt
	TrayTip , Deleting log.txt, Country log has been reset, 4 ;show for 4 seconds
	return

