#SingleInstance Force
#Include %A_ScriptDir%\configurenew.ini

farmwithslave := 60
farmalone := 60

runonce := 0





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
Gui,1: Add, Checkbox, w90 vCheckNearby, Notify When No Players Nearby`
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
 while(!ok:=FindText(ChangeChannelBtn[1],ChangeChannelBtn[2],ChangeChannelBtn[3],ChangeChannelBtn[4], 0.1, 1, ChangeChannelBtn[5]))
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
ControlClick, x565 y189, %Title%,, LEFT, 1, NA ; location spot
sleep 200
if (CheckNearby=1){
gosub CheckNearby
}

runonce++
goto Find

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


CheckNearby:


If(ok:=FindText(WindowNearbyPlayer[1], WindowNearbyPlayer[2], WindowNearbyPlayer[3], WindowNearbyPlayer[4], 0, 0, WindowNearbyPlayer[5]))
{
	sleep 1000
	If(ok:=FindText(NearbyPlayer[1], NearbyPlayer[2], NearbyPlayer[3], NearbyPlayer[4], 0, 0, NearbyPlayer[5]))
{
	yourmessage := "You have found a channel with no players nearby your farm spot!"
			gosub Telegram
			goto Jump
			^G::
			Jump:
			gosub setupgrouphunt
			sleep % farmwithslave*60*1000
			gosub closeslave
			sleep % farmalone*60*1000
			DetectHiddenWindows, On 
			SetTitleMatchMode, 2
			WinClose, %hpida% ahk_class AutoHotkey
			sleep 1000
			WinClose, %dienoti% ahk_class AutoHotkey
			sleep 1000
			WinClose, %autogetcard% ahk_class AutoHotkey
			sleep 1000
			WinClose, %chatroom% ahk_class AutoHotkey
			sleep 1000
			WinClose, %title%
						
			ExitApp
}
else
{
runonce++
goto Find
}
return
	
}
else
{
gosub makesureclick
}



Makesureclick:
ControlClick, x670 y400, %Title%,, LEFT, 1, NA
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
^T::
setupgrouphunt:
Gui,1:Destroy
run %hpida% ahk_class AutoHotkey
run %autoaccept% ahk_class AutoHotkey
sleep 1000
ControlClick, x556 y78, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x267 y443, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x282 y145, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x718 y69, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x724 y127, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x662 y270, %Title2%,, LEFT, 1, NA
sleep 500
;~ ControlClick, x522 y122, %Title%,, LEFT, 1, NA
sleep 500
WinActivate, %Title% 
ControlClick, x744 y123, BlueStacks,, LEFT, 1, NA  ; close map
sleep 500
ControlClick, x773 y125, BlueStacks,, LEFT, 1, NA ;close map
sleep 1000
gosub ZoomOut
sleep 1000
ControlClick, x771 y392, BlueStacks,, LEFT, 1, NA ; atk button
sleep 500
ControlClick, x625 y218, BlueStacks,, LEFT, 1, NA ; atk all
sleep 500

ControlClick, x744 y123, BlueStacks,, LEFT, 1, NA ; open map
send ^r
sleep 8000
;~ ControlClick, x320 y235, %Title3%,, LEFT, 1, NA ;; accept
;~ sleep 500
;~ ControlClick, x320 y235, %Title3%,, LEFT, 1, NA
;~ sleep 500
;~ ControlClick, x320 y235, %Title4%,, LEFT, 1, NA ;; accept
;~ sleep 500
;~ ControlClick, x320 y235, %Title4%,, LEFT, 1, NA
;~ sleep 500
;~ ControlClick, x320 y235, %Title5%,, LEFT, 1, NA ;; accept
;~ sleep 500
;~ ControlClick, x320 y235, %Title5%,, LEFT, 1, NA
;~ sleep 500
ControlClick, x403 y228, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x697 y336, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x697 y336, %Title2%,, LEFT, 1, NA
sleep 1000

WinActivate, %Title2%
gosub SlideUp
sleep 500

if(ok:=FindText(RachelAreaNurse[1],RachelAreaNurse[2],RachelAreaNurse[3],RachelAreaNurse[4], 0.1, 0.1, RachelAreaNurse[5]))
{
		CoordMode, Mouse
		X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
		sleep 500	
}

else
{

ControlClick, x245 y380, %Title2%,, LEFT, 1, NA
sleep 500
}

ControlClick, x618 y212, %Title2%,, LEFT, 1, NA
sleep 3000
			DetectHiddenWindows, On 
			SetTitleMatchMode, 2
			WinClose, %autoaccept% ahk_class AutoHotkey

	while(!ok:=FindText(IdaNurse[1],IdaNurse[2],IdaNurse[3],IdaNurse[4], 0.1, 0, IdaNurse[5]))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=30) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto arrivespot
				}
		}
arrivespot:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x729 y125, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x556 y78, %Title2%,, LEFT, 1, NA
sleep 1000
;~ ControlClick, x340 y134, %Title2%,, LEFT, 1, NA
;~ sleep 1000
;~ ControlClick, x430 y237, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x159 y324, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x270 y324, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x609 y324, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x714 y71, %Title2%,, LEFT, 1, NA
sleep 500

run %dienoti% ahk_class AutoHotkey
sleep 500
run %autogetcard% ahk_class AutoHotkey
sleep 1000
run %Chatroom% ahk_class AutoHotkey
sleep 1000

return

ChangeChartosnow:
ControlClick, x670 y80, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x687 y309, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x277 y148, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x103 y145, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x482 y250, %Title%,, LEFT, 1, NA
sleep 20000
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
return


ChangeChartosub1:
ControlClick, x670 y80, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x687 y309, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x277 y148, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x183 y145, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x482 y250, %Title%,, LEFT, 1, NA
sleep 20000
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
return


SlideUp:
CoordMode,Mouse, Relative
Click, 298,427, Down
sleep 500
MouseMove, 300, 185,20
sleep 500
Click, 300, 185, Up
sleep 500
return

CloseSlave:
WinClose, %Title2%
sleep 500
CoordMode, Mouse, Screen
Click, 1286, 282
sleep 500
Click, 1286, 282

WinClose, %Title3%
sleep 500
CoordMode, Mouse, Screen
Click, 356, 696
sleep 500
Click, 356, 696

WinClose, %Title4%
sleep 500
CoordMode, Mouse, Screen
Click, 889, 696
sleep 500
Click, 889, 696

WinClose, %Title5%
sleep 500
CoordMode, Mouse, Screen
Click, 1430, 701
sleep 500
Click, 1430, 701

Return


darragnarokclient:
sleep 1000
run, C:\ProgramData\BlueStacks\Client\Bluestacks.exe -vmname Android_5
sleep 15000
WinMove, darragnarok,,1065,0, 533, 341
WinActivate, darragnarok
sleep 1000
CoordMode, Mouse, Screen
MouseMove, 1386, 163
sleep 1000
Click, 1386, 163
sleep 60000


error2001:="|<>*111$25.U0W0AoVIR9GW4pZHOOmdgBNIqkgePE"
if(ok:=FindText(1284, 274, 1376, 306, 0, 0, error2001)) 
{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
		sleep 1000
		WinClose, darragnarok
		sleep 500
		CoordMode, Mouse, Screen
		Click, 1412, 207
		sleep 500
		Click, 1412, 207
		sleep 10000
		goto darragnarokclient
		return
}

signin:= "|<>*174$19.1Tzizznq64PPPZhguqq3MPTzjzy7w"
			if(ok:=FindText(1270, 183, 1424, 223, 0, 0, signin)) 
			{
				
				CoordMode, Mouse
				X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
				ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
				sleep 12000	
			}
	

	ControlClick, x272 y262, darragnarok,, LEFT, 1, NA
	sleep 10000
	ControlClick, x51 y197, darragnarok,, LEFT, 1, NA
	sleep 1000
	ControlClick, x458 y315, darragnarok,, LEFT, 1, NA
	sleep 15000
	ControlClick, x388 y79, darragnarok,, LEFT, 1, NA
	sleep 1000
	ControlClick, x388 y79, darragnarok,, LEFT, 1, NA
	sleep 1000

gotorift:="|<>*150$16.Tzxc6KjKOxRfps|<>**50$20.zk084Rnjzz/IfmpuohGj/IeHzzy"
while(!ok:=FindText(1490, 124, 1576, 248, 0.1, 0.4, gotorift))
{
}
	{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
		sleep 500
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
		
	}	

return


joinsuicideparty:
sleep 1000
ControlClick, x550 y75, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x133 y442, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x482 y254, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x670 y69, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x557 y247, %Title%,, LEFT, 1, NA
sleep 5000
ControlClick, x510 y82, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x470 y143, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x278 y240, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x732 y81, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x471 y388, %Title%,, LEFT, 1, NA
sleep 15000

teleportoutskirt:
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 1000
ControlClick, x656 y278, BlueStacks,, LEFT, 1, NA 
sleep 500
While(!ok:=FindText(353, 177, 481, 221, 0, 0, Kafra))
{
}
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 500
 }
 
ControlClick, x707 y334, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x707 y334, BlueStacks,, LEFT, 1, NA 
sleep 500
WinActivate, BlueStacks
sleep 500
gosub slideup
sleep 2000
while(!ok:=FindText(250, 130, 546, 370, 0.1, 1, GlastheimMainClient))
{
}
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 1000
}
	
ControlClick, x405 y214, BlueStacks,, LEFT, 1, NA 
sleep 15000
ControlClick, x732 y126, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x732 y126, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x732 y126, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x197 y86, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x83 y292, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x442 y336, %Title%,, LEFT, 1, NA
sleep 10000
ControlClick, x267 y210, darragnarok,, LEFT, 1, NA
sleep 500
ControlClick, x267 y210, darragnarok,, LEFT, 1, NA
sleep 500
ControlClick, x267 y210, darragnarok,, LEFT, 1, NA
sleep 500
ControlClick, x318 y211, darragnarok,, LEFT, 1, NA
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

;;;;;function dont kacau here
ObjIndexOf(obj, item, case_sensitive:=false)
{
	for i, val in obj {
		if (case_sensitive ? (val == item) : (val = item))
			return i
	}
}
























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

ESC:: Reload
Q::ExitApp