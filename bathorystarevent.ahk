#SingleInstance Force
#Include %A_ScriptDir%\configurenew.ini
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
WinGet, Title3ID, ID, %Title3%
WinGet, Title4ID, ID, %Title4%
WinGet, Title5ID, ID, %Title5%


runonce := 0

bathory:=[521, 171, 733, 413,"|<>*77$46.zzzzzzzrzzzzzzz8znDzzzw1zAzzzzW|<>*100$9.xzbss0kC3kStU"]
bathoryicon:=[154, 119, 200, 169,"|<>**50$34.U00600000A3sjiMsOaAI+kWJM0Ba0Jb0XySqI07zTtk0803U01s0M0E3s1U103k408010k00043A000UMU0003U0000o8000AG00021E000O"]

flywing := [434, 357, 730, 411,"|<>0xE8FAFE@0.79$9.10Q3kS3ky7szDtzDtzTvzTzzzzzzw"]
autoatkon :=[728, 347, 794, 417,"|<>**50$35.jzzvfzQ6nNBCixirLR73JcUvpyfTTn9hKE3U"]
check := [535, 229, 567, 381,"|<>*86$18.zzlzzUzz0zy0nw1Vs30k700DU0Tk0zs1zw3zy7zzDzU|<>*87$18.zzlzzUzz0zy0nw1Vs30k700DU0Tk0zs1zw3zy7zzDzU|<>*93$18.zzlzzUzz0zy0nw1Vs30k700DU0Tk0zs1zw3zy7zU|<>*82$19.zztzzsTzsDzs3zs37s31s3UM3k03w03z03zk3zw3zz3zzrzw|<>*96$18.zzvzzkzzUzz0zy1Xw31s70kDU0Tk0zs1zw3zy7zzDzU"]

aldef1 := [596, 105, 714, 139,"|<>*117$55.0TzzzzznUNwTywzTlryw2TQ4DmvzStBguTzQzjSYqNDzi1rjGP0bzrTvr9BbnzvjxsA0k9zxryyD0yCzyvw"]
worldmap :=[516, 380, 586, 412,"|<>*127$28.zzzrtyzzT7nbpwT84K0waLH2GRRA0NpokNaLH3b3RUU"]
clocktower:=[255, 124, 381, 186,"|<>**50$62.3zwAU000003k7v8000001k06m000000kC1gU3k0008TyP87zk0zuS1wm7UC1yT600AXU0kw010038kw6A00E00m8zla7yA00AWAC9XXn0039a1WNU0k00mNU8aM0A00AaE29Y030039Y0WN00k00mN08aE0A00AaE29Y010039a0WN00M00mNU8aM0707AWA69b0szzv8Xz6Mzz3y6mAD1X3ss01gXU0ks07U1v8S0s70C"]

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
Gui,1: Add, Button, x15 w90 h40 gSelectMap, Select Map
Gui,1: Font, s7 cGreen
Gui,1: Add, Checkbox, w90 vCheckNearby, Auto Change Channel`
Gui,1: Show, w124 h280, fern Only
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







Start:
Gui,1:Submit, NoHide


Find:
FindText_BindWindow(Title2ID)
flytime=0

ControlClick, x740 y125, %Title%,, LEFT, 1, NA ; map title
sleep 500
 if(!ok:=FindText(aldef1[1],aldef1[2],aldef1[3],aldef1[4], 0, 0, aldef1[5]))
{
gosub comeback
}
else
{
ControlClick, x771 y125, %Title%,, LEFT, 1, NA ; map title
}




if (runonce=0)
{
ControlClick, x720 y128, %Title2%,, LEFT, 1, NA ; map title
sleep 500
ControlClick, x657 y193, %Title2%,, LEFT, 1, NA ; pinpoint npc change ch
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
				ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change ch
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
ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change ch
}

else
{
ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change ch
sleep 500
ControlClick, x390 y245, %Title2%,, LEFT, 1, NA ; click npc change ch
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
Send, %Number%
}
else
{
	number++
	gosub countrycycle
	Send, %Number%
	
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

if(ok:=FindText(bathory[1],bathory[2],bathory[3],bathory[4], 0, 0, bathory[5])) ; checkmob
{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		kill++
		flytime=0
		sleep 1000
		goto Afterkill
}
else
{
goto flywing
}

Afterkill:
FindText_BindWindow(TitleID)
		while(ok:=FindText(bathoryicon[1],bathoryicon[2],bathoryicon[3],bathoryicon[4], 0, 0, bathoryicon[5]))
		{
		SetTimer, MaxTime, 1000
		sleep 1000
		if (WaitingTime=7) {
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
		SetTimer, MaxTime, 1000
		sleep 1000
		if (WaitingTime=3) {
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
if (Flytime<10)
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
			flytime=0		
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
ControlClick, x740 y125, %Title%,, LEFT, 1, NA ; map title
sleep 1000
 if(ok:=FindText(worldmap[1],worldmap[2],worldmap[3],worldmap[4], 0, 0, worldmap[5]))
{

	ControlClick, x552 y396, %Title%,, LEFT, 1, NA ; world
	sleep 1000
	ControlClick, x461 y200, %Title%,, LEFT, 1, NA ; map title
	sleep 1000
	ControlClick, x164 y171, %Title%,, LEFT, 1, NA ; map titlev
	sleep 1000
	ControlClick, x552 y193, %Title%,, LEFT, 1, NA ; map titlev
	sleep 1000
	 while(!ok:=FindText(clocktower[1],clocktower[2],clocktower[3],clocktower[4], 0, 0, clocktower[5]))
	{
	}
	ControlClick, x771 y125, %Title%,, LEFT, 1, NA ; map title
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








ESC:: Reload
Q:: ExitApp
