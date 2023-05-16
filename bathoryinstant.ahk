#SingleInstance Force
#Include %A_ScriptDir%\configurenew.ini
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
WinGet, Title3ID, ID, %Title3%
WinGet, Title4ID, ID, %Title4%
WinGet, Title5ID, ID, %Title5%


runonce := 0
Kill := 0
FlyTime2:= 0
Card := 0


bathory:=[521, 171, 733, 413,"|<>*77$46.zzzzzzzrzzzzzzz8znDzzzw1zAzzzzW|<>*100$9.xzbss0kC3kStU"]
bathoryicon:=[100, 118, 292, 166,"|<>**50$32.30000En0008MU000C0000B20000G000250001X0000k0000M000Dw007U407VA10v+pzE6GDEE0Yc12Adz0EnbrzzrhJeepVJSvzQpIeYbrzzxtz202CIFU0GJ2|<>**50$15.4BLxv+g3IlRaicTU"]

flywing := [434, 357, 730, 411,"|<>0xE6F6FE@0.75$10.0k70S1sDUy3wTlz7wTnzDwznzTxzrzzy"]
autoatkon :=[728, 347, 794, 417,"|<>**50$28.tMMMqYzTAzKakhFuvGpZch8s"]
check := [534, 209, 562, 379,"|<>*93$18.zztzzkzzUzz0ry1Xw31s70UDU0Tk0zs1zw3zy7zzDzU|<>*88$18.zzlzzUzz0zy0nw1Vs30k700DU0Tk0zs1zw3zy7zzDzU|<>*87$18.zzlzzUzz0zy0Xw11s30k700DU0Tk0zs1zw3zy7zzDzU|<>*86$18.zzvzzkzzUzz0zy0Xw11s30k700DU0Tk0zs1zw3zy7zU|<>*94$18.zzvzzkzzUzz0zy1Xw31s70kDU0Tk0zs1zw3zy7zzDzU"]

bag := [544, 50, 690, 102,"|<>**50$10.sk/0K1A0s1wDHwMH1M70U"]
aldef1 := [603, 110, 697, 142,"|<>*126$22.zza0vyM03xjkzq43zMHDxj0zqwPzPs"]
worldmap :=[519, 383, 603, 411,"|<>**50$31.00073zz02VRyzzLiqQzi5PNcq2YhpvRNKuJignB+qKPtZQ9zjyzy"]
clocktower:=[434, 131, 544, 191,"|<>**50$27.1kzzXz7zzk8U0S1A03k9U0PlATz69W00FAE029XzUFA0429U0UFA0429VzUFATs29W00FAE029W00FAE028W00F4E03sy04|<>*116$25.wT00k70003U001k03UsTzkQDzsC7zw73zy3U0T1k0DUs07kQ03sC7zw73zy3Vzz3kzzVsTzkwDzsS7zk"]
GetCard := "|<>**50$23.100szs1FUrmyzwwT0atm1SrYyVd9A3PTvyy5kSL7xybwzDU|<>**50$21.0073y0ssLxqzX2jvhpjRgjMRYvTjkMCPzzzU"



Gui,2: +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui,2: Color, CCCCCC
;~ Gui, Font, cFF0000 s15 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
Gui,2: Font, cFFFFFF s7 , verdana  ;white
FormatTime, MyTime,, hh:mm:ss tt
Gui,2: Add, Text, y0 BackgroundTrans, Start Time = %mytime%
Gui,2: Add, Text, vCounter x8 y10 BackgroundTrans, Total Kill(s) = %Kill%00000
Gui,2: Add, Text, vCounterFlywing x8 y20 BackgroundTrans, Total Flywing Used = %FlyTime2%00000
Gui,2: Add, Text, vCounterCard x8 y30 BackgroundTrans, Total Card(s) = %Card%00000
Gui,2: Show, NoActivate x5 y188,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
#Persistent
SetTimer, RefreshD, 1000
SetTimer, autogetcard, 1000




Gui,1: New, -Resize -MaximizeBox -MinimizeBox , Automated Channel Finder by Fern
Gui,1: +AlwaysOnTop
Gui,1: Font, s9 Bold
Gui,1: Add, Text, +BackgroundTrans, Country
Gui,1: Add, Button, x15 y115 w90 h40 gStart, Find Now
Gui,1: Add, Button, x15 w90 h40 gResetCounter, Reset Counter
Gui,1: Add, DropDownList, x10 y29 w100 h210 vCountry ,EN|TH|PH|ID|CN|VN
Gui,1: Add, Text, +BackgroundTrans, Channel Number
Gui,1: Font, s12
Gui,1: Add, Edit, x10 y79 w100 h30 -vScroll vNumber number
Gui,1: Font, s9
Gui,1: Add, Text, x10 +BackgroundTrans, Wait for mob (sec)
Gui,1: Add, Edit, x12 w100 -vScroll vWaitDelay number, 4
Gui,1: Add, Text, x10 +BackgroundTrans, Max Kill Time (sec)
Gui,1: Add, Edit, x12 w100 -vScroll vKillTime number, 10
Gui, Add, Text,x12 +BackgroundTrans, Auto Stop at
Gui, Add, DateTime,1 x12 w100 vAutoStop ChooseNone , HH:mm


Gui,1: Font, s7 cRed
Gui,1: Add, Checkbox, w120 vCheckNearby , Auto Change Channel`
Gui,1: Show, w124 h380, fern Only
return

GuiClose:
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

ResetCounter:
Kill := 0
FlyTime2:= 0
Card:= 0
return



Start:

NtpSvr := "my.pool.ntp.org"
NetTime := UTC_ToLocalTime(GetNetworkTime(NtpSvr))
Y := SubStr(NetTime, 1, 4)
M := SubStr(NetTime, 5, 2)
H := SubStr(NetTime, 9, 2)

if (H<21){

target_hour = 21
target_time = %target_hour%00
converted := SubStr("000" . target_time, -3)
target = %A_YYYY%%A_MM%%A_DD%%converted%00
EnvSub, target, %A_Now%, Seconds.
nextspawn := target * 1000 
nextspawninmin := (nextspawn/1000)/60
tooltip , %nextspawninmin% before event starts, 0 , 0
sleep, % nextspawn
}

Gui,1:Submit, NoHide








Find:
FindText_BindWindow(Title2ID)
flytime=0
locked=0	

Formattime, StopHHMM, %Autostop%, HHmm
FormatTime, NowHHMM,,HHmm

if (NowHHMM > StopHHMM)
{
traytip, Event's Over, How many Memory Gem did you get today?
ExitApp
}

;~ ControlClick, x740 y125, %Title%,, LEFT, 1, NA ; map title
;~ sleep 500
 ;~ if(!ok:=FindText(aldef1[1],aldef1[2],aldef1[3],aldef1[4], 0, 0, aldef1[5]))
;~ {
;~ gosub comeback
;~ }
;~ else
;~ {
;~ ControlClick, x771 y125, %Title%,, LEFT, 1, NA ; map title
;~ }




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
	if (WaitingTime=20) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500				
				goto ChangeChannel
			}
	
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
sleep 1000
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500	
}

else
{
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change chg
				sleep 500	
}

ChangeChannel:
FindText_BindWindow(Title2ID)
 while(!ok:=FindText(ChangeChannelBtn[1],ChangeChannelBtn[2],ChangeChannelBtn[3],ChangeChannelBtn[4], 0, 0, ChangeChannelBtn[5]))
{
}
{
   CoordMode, Mouse
   X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 500
}

 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {
 }
 {
	WinActivate, %Title2%
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x667 y145, %Title2%,, LEFT, 1, NA
 }


sleep 500

SetKeyDelay, 100, 50

if (runonce=0){
ControlSend, ,%Number%, %Title2%
}
else
{
	number++
	gosub countrycycle
ControlSend, ,%Number%, %Title2%
	
}

sleep 500
ControlClick, x734 y124, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x340 y352, %Title2%,, LEFT, 1, NA


While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
}

gosub %Country%

sleep 500
ControlClick, x585 y447, %Title2%,, LEFT, 1, NA

WinActivate, %Title%

 While(!ok:=FindText(jumperavatar[1], jumperavatar[2], jumperavatar[3], jumperavatar[4], 0, 0, jumperavatar[5]))
{
}

		CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
While(!ok:=FindText(FollowBtn[1], FollowBtn[2], FollowBtn[3], FollowBtn[4], 0, 0, FollowBtn[5]))
{	
}

CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
While(!ok:=FindText(ConfirmBtn[1],ConfirmBtn[2],ConfirmBtn[3],ConfirmBtn[4], 0, 0, ConfirmBtn[5]))
{
}
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		
While(!ok:=FindText(jumperavatarfollow[1],jumperavatarfollow[2],jumperavatarfollow[3],jumperavatarfollow[4], 0, 0, jumperavatarfollow[5]))
{	
}
;~ sleep 1000
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		
While(!ok:=FindText(UnFollowBtn[1],UnFollowBtn[2],UnFollowBtn[3],UnFollowBtn[4], 0, 0, UnFollowBtn[5]))
{
}
CoordMode, Mouse
			  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x766 y388, %Title%,, LEFT, 1, NA ; autoatk
sleep 500
goto checknearby

SelectMap:

MsgBox, 0x40000,, Please pinpoint your farm location on minimap!
IfMsgBox = OK 
{ 
KeyWait, LButton, D ; Wait for the left mouse button to be pressed down.
MouseGetPos, CoordX, CoordY
ToolTip, Your farm location is set at %CoordX% %CoordY%!
SetTimer, RemoveToolTip, 2000
return

RemoveToolTip:
ToolTip
return
}

^P::
CheckNearby:
FindText_BindWindow(TitleID)

if (locked=1)
{
	goto flywing
}


if(ok:=FindText(bathory[1],bathory[2],bathory[3],bathory[4], 0, 0, bathory[5])) ; checkmob
{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 500
		;ControlClick, x719 y188, %Title%,, LEFT, 1, NA

		flytime=0
		locked=1
		goto Afterkill
}
else
{
goto flywing
}

Afterkill:
;~ FindText_BindWindow(TitleID)
;~ if (locked=1)
;~ {
;~ while(!ok:=FindText(bathoryicon[1],bathoryicon[2],bathoryicon[3],bathoryicon[4], 0, 0, bathoryicon[5]))
		;~ {
			
		;~ if (WaitingTime<1)
			;~ {
				;~ WaitingTime++
				;~ SetTimer, MaxTime, 1000
			;~ }
		
		;~ if (WaitingTime=2) 
			;~ {
				;~ setTimer, MaxTime, off
				;~ Tooltip, 
				;~ WaitingTime=0
				;~ goto CheckNearby
			;~ }
			
		;~ }
				;~ setTimer, MaxTime, off
				;~ Tooltip, 
				;~ WaitingTime=0
		;~ goto Afterkill
;~ }


FindText_BindWindow(TitleID)
	while(ok:=FindText(bathoryicon[1],bathoryicon[2],bathoryicon[3],bathoryicon[4], 0, 0, bathoryicon[5]))
	{
	flytime=0
		
		if (WaitingTime<1)
			{
				WaitingTime++
				kill++
				SetTimer, MaxTime, 1000
			}
		
	
		if (WaitingTime>KillTime) 
			{
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto CheckNearby
			}
	
		}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				
				
				
		while(!ok:=FindText(bathoryicon[1],bathoryicon[2],bathoryicon[3],bathoryicon[4], 0, 0, bathoryicon[5]))
		{
			
		if (WaitingTime<1)
			{
				WaitingTime++
				SetTimer, MaxTime, 1000
			}
		
		if (WaitingTime>WaitDelay) 
			{
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto CheckNearby
			}
			
		}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
		goto Afterkill



Flywing:
FindText_BindWindow(TitleID)

if(!ok:=FindText(bag[1],bag[2],bag[3],bag[4], 0, 0, bag[5]))
{
gosub comeback
}

if (Flytime<6)
	{
		while(!ok:=FindText(flywing[1],flywing[2],flywing[3],flywing[4], 0, 0, flywing[5])) ; flywing
		{
		}
		
		{
		FlyTime++
		FlyTime2++
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		Sleep 500
		
		if (locked=1)
		{
			goto Afterkill
		}	
		
		
		if(ok:=FindText(autoatkon[1],autoatkon[2],autoatkon[3],autoatkon[4], 0, 0, autoatkon[5])) ; autoatkon
		{
				ControlClick, x766 y388, %Title%,, LEFT, 1, NA ; autoatk
				sleep 500
		}
				ControlClick, x766 y388, %Title%,, LEFT, 1, NA ; autoatk
		Sleep 500
		goto CheckNearby
		}
				
		
	}
else
{
	if (CheckNearby=0)
		{
			goto CheckNearby
		}

	runonce++
	goto Find
}

		








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

;;;;;function dont kacau here
ObjIndexOf(obj, item, case_sensitive:=false)
{
	for i, val in obj {
		if (case_sensitive ? (val == item) : (val = item))
			return i
	}
}


checkstatus(darragnarokstatus){
Loop, parse, darragnarokstatus, `,
{
    if(ok:=FindText(1067, 40, 1595, 338, 0, 0, %A_LoopField% ))
	return 1
}

}

^R::
comeback:
FindText_BindWindow(TitleID)
while(!ok:=FindText(bag[1],bag[2],bag[3],bag[4], 0, 0, bag[5]))
{
}

ControlClick, x740 y125, %Title%,, LEFT, 1, NA ; map title
sleep 1000

if(ok:=FindText(aldef1[1],aldef1[2],aldef1[3],aldef1[4], 0, 0, aldef1[5])) ; check if map is correct
{
ControlClick, x773 y127, %Title%,, LEFT, 1, NA ; map title
return
}
 if(ok:=FindText(worldmap[1],worldmap[2],worldmap[3],worldmap[4], 0, 0, worldmap[5]))
{

	ControlClick, x552 y396, %Title%,, LEFT, 1, NA ; world
	sleep 1000
	ControlClick, x461 y200, %Title%,, LEFT, 1, NA ; map title
	sleep 1000
	ControlClick, x164 y171, %Title%,, LEFT, 1, NA ; map titlev
	sleep 1000
	ControlClick, x412 y123, %Title%,, LEFT, 1, NA ; quest
	sleep 1000
	ControlClick, x377 y241, %Title%,, LEFT, 1, NA ; location
	sleep 1000
	while(ok:=FindText(bag[1],bag[2],bag[3],bag[4], 0, 0, bag[5]))
	{	
	}	
	
	while(!ok:=FindText(bag[1],bag[2],bag[3],bag[4], 0, 0, bag[5]))
	{	
	}
	ControlClick, x401 y311, %Title%,, LEFT, 1, NA ; status
	sleep 1000
	ControlClick, x401 y311, %Title%,, LEFT, 1, NA ; status
	locked = 1
}
else
{
goto comeback
}




return


MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return		

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

^I::
msgbox, % flytime " " kill
return


RefreshD:
GuiControl,2:, Counter, Total Kill(s) = %kill%
GuiControl,2:, CounterFlywing, Total Flywing Used = %FlyTime2%
GuiControl,2:, CounterCard, Total Card(s) = %Card%
return

autogetcard:
 if(ok:=FindText(1, 42, 435, 828, 0.1, 0., Getcard))
 {
 Card++
   CoordMode, Mouse
   X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
   sleep 1000
  }
  return


ESC:: Reload
Q:: ExitApp
