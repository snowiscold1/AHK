#SingleInstance Force
#Include %A_ScriptDir%\configure.ini

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

While(!ok:=FindText(906, 223, 972, 273, 0, 0, foundnpc))
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
 while(!ok:=FindText(1406, 261, 1584, 367, 0.1, 1, ChangeChannelBtn))
{
}
{
   CoordMode, Mouse
   X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 500
}

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


While (!ok:=FindText(991, 204, 1037, 230, 0, 0, CountryList))
{
}

gosub %Country%

sleep 500
ControlClick, x585 y447, %Title2%,, LEFT, 1, NA

WinActivate, %Title%

 While(!ok:=FindText(103, 47, 395, 113, 0, 0, jumperavatar))
{
}

		CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
While(!ok:=FindText(17, 231, 229, 349, 0, 0, FollowBtn))
{	
}

CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
While(!ok:=FindText(240, 304, 566, 364, 0, 0, ConfirmBtn))
{
}
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		
While(!ok:=FindText(108, 47, 392, 107, 0, 0, jumperavatarfollow))
{	
}
;~ sleep 1000
CoordMode, Mouse
		  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
While(!ok:=FindText(17, 231, 229, 349, 0, 0, UnFollowBtn))
{
}
CoordMode, Mouse
			  X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x680 y288, %Title%,, LEFT, 1, NA
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


If(ok:=FindText(366, 108, 418, 138, 0, 0, WindowNearbyPlayer))
{
	sleep 1000
	If(ok:=FindText(385, 273, 409, 289, 0, 0, NearbyPlayer))
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
			WinClose, %hpculvert% ahk_class AutoHotkey
			sleep 1000
			WinClose, %dienoti% ahk_class AutoHotkey
			sleep 1000
			WinClose, %autogetcard% ahk_class AutoHotkey
			sleep 1000
			WinClose, %chatroom% ahk_class AutoHotkey
			sleep 1000
			WinClose, %stopfollow% ahk_class AutoHotkey
				
			gosub offhpdischarge
			gosub ChangeChartosnow
			sleep 1000
			
			gosub darragnarokclient
			sleep 30*60*1000

			gosub ChangeChartosub1	
			sleep 30*60*1000

			gosub ChangeChartosub2
			sleep 1000
			gosub joinsuicideparty
			sleep 60000
			Run %A_ScriptDir%/autosuicideRift.ahk ahk_class AutoHotkey
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
return
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

setupgrouphunt:
Gui,1:Destroy
run %hpculvert% ahk_class AutoHotkey
;~ run %autoaccept% ahk_class AutoHotkey
sleep 1000
ControlClick, x556 y78, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x267 y443, %Title2%,, LEFT, 1, NA

sleep 1000
ControlClick, x718 y69, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x724 y127, %Title2%,, LEFT, 1, NA
sleep 1000
ControlClick, x662 y270, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x282 y145, %Title%,, LEFT, 1, NA
sleep 500
;~ ControlClick, x522 y122, %Title%,, LEFT, 1, NA
sleep 500



WinActivate, %Title% 
ControlClick, x773 y126, BlueStacks,, LEFT, 1, NA ;close map
sleep 500
ControlClick, x758 y381, %Title%,, LEFT, 1, NA ; autoatk
sleep 500
ControlClick, x630 y216, %Title%,, LEFT, 1, NA  ;atk all
sleep 500
ControlClick, x773 y126, BlueStacks,, LEFT, 1, NA ;open map
sleep 500
send, ^r
sleep 8000
ControlClick, x320 y235, %Title3%,, LEFT, 1, NA
;~ sleep 500
;~ ControlClick, x320 y235, %Title3%,, LEFT, 1, NA
sleep 500
ControlClick, x320 y235, %Title4%,, LEFT, 1, NA
;~ sleep 500
;~ ControlClick, x320 y235, %Title4%,, LEFT, 1, NA
sleep 500
ControlClick, x320 y235, %Title5%,, LEFT, 1, NA
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
sleep 500

if(ok:=FindText(1033, 189, 1155, 437, 0.1, 0.1, GlastheimAreaNurse))
{
		CoordMode, Mouse
		X:=ok.1.x-(830), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
		sleep 500	
		
}
else
{
ControlClick, x292 y378, %Title2%,, LEFT, 1, NA
sleep 500

}

ControlClick, x620 y312, %Title2%,, LEFT, 1, NA
sleep 3000
			;~ DetectHiddenWindows, On 
			;~ SetTitleMatchMode, 2
			;~ WinClose, %autoaccept% ahk_class AutoHotkey

while(!ok:=FindText(1357, 97, 1539, 141, 0.1, 0, Culvert))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=20) {
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
ControlClick, x675 y287, %Title2%,, LEFT, 1, NA ; nurse position to afk
sleep 500
ControlClick, x556 y78, %Title2%,, LEFT, 1, NA
sleep 5000
;~ ControlClick, x340 y134, %Title2%,, LEFT, 1, NA
;~ sleep 1000
;~ ControlClick, x430 y237, %Title2%,, LEFT, 1, NA
;~ sleep 500
;~ ControlClick, x159 y324, %Title2%,, LEFT, 1, NA ; stop follow
;~ sleep 500
;~ ControlClick, x270 y324, %Title2%,, LEFT, 1, NA ; stop follow
;~ sleep 500
;~ ControlClick, x609 y324, %Title2%,, LEFT, 1, NA ; stop follow
;~ sleep 500
;~ ControlClick, x714 y71, %Title2%,, LEFT, 1, NA
;~ sleep 500


run %stopfollow% ahk_class AutoHotkey
sleep 500
run %dienoti% ahk_class AutoHotkey
sleep 500
run %autogetcard% ahk_class AutoHotkey
sleep 1000
run %Chatroom% ahk_class AutoHotkey
sleep 1000

return

offhpdischarge:
ControlClick, x66 y85, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x537 y236, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x537 y285, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x719 y72, %Title%,, LEFT, 1, NA
sleep 1000

return

ChangeChartosnow:

;;icon



while(!ok:=FindText(8, 47, 796, 489, 0, 0, More))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosnowSettings
				}
		}
		
changetosnowSettings:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x670 y80, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, Settings))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosnowSwitchMenu
				}
		}

changetosnowSwitchMenu:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x687 y309, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, SwitchMenu))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosnowChange
				}
		}

changetosnowChange:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x277 y148, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x103 y145, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x482 y250, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, CloseEventWindow))
		{
		}
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
return

ChangeChartosub2:

while(!ok:=FindText(8, 47, 796, 489, 0, 0, More))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosub2Settings
				}
		}

changetosub2Settings:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x670 y80, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, Settings))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosub2SwitchMenu
				}
		}

changetosub2SwitchMenu:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x687 y309, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, SwitchMenu))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosub2Change
				}
		}


changetosub2Change:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x277 y148, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x188 y145, %Title%,, LEFT, 1, NA ; char slot
sleep 1000
ControlClick, x482 y250, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, CloseEventWindow))
		{
		}
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
sleep 500
ControlClick, x582 y100, %Title%,, LEFT, 1, NA
return


ChangeChartosub1:

while(!ok:=FindText(8, 47, 796, 489, 0, 0, More))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosub1Settings
				}
		}

changetosub1Settings:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x670 y80, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, Settings))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosub1SwitchMenu
				}
		}

changetosub1SwitchMenu:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x687 y309, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, SwitchMenu))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
				if (WaitingTime=5) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto changetosub1Change
				}
		}

changetosub1Change:
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
ControlClick, x277 y148, %Title%,, LEFT, 1, NA
sleep 1000
ControlClick, x183 y145, %Title%,, LEFT, 1, NA ; char slot
sleep 1000
ControlClick, x482 y250, %Title%,, LEFT, 1, NA
sleep 1000
while(!ok:=FindText(8, 47, 796, 489, 0, 0, CloseEventWindow))
		{
		}
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
WaitingTime=0
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
sleep 10000

loop{
while(!checkstatus(darragnarokstatus))
{
	if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
	if (WaitingTime=30) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0			
				 goto gotorift	
				}

}
	setTimer, MaxTime, off
	Tooltip, 
	WaitingTime=0	

Loop, parse, darragnarokstatus, `,
{
    if(ok:=FindText(1067, 40, 1595, 338, 0, 0, %A_LoopField% ))
	{
	gosub, %A_LoopField%
	}
	
}

}
return


signgoogle:

 if(ok:=FindText(1067, 40, 1595, 338, 0, 0, signgoogle)) 
{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
}
return

chooseaccount:
 if(ok:=FindText(1067, 40, 1595, 338, 0, 0, chooseaccount)) 
{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
}
return

eternallove:
 if(ok:=FindText(1067, 40, 1595, 338, 0, 0, eternallove)) 
{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x273 y257, darragnarok,, LEFT, 1, NA
}
return

backtologin:
 if(ok:=FindText(1067, 40, 1595, 338, 0, 0, backtologin)) 
{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
}
return

romicon:
 if(ok:=FindText(1067, 40, 1595, 338, 0, 0, romicon)) 
{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		MouseClick, L, %x%, %y%
}
return

selectchar:
setTimer, MaxTime, off
Tooltip, 
WaitingTime=0		
sleep 1000
ControlClick, x53 y195, darragnarok,, LEFT, 1, NA
sleep 1000
ControlClick, x455 y314, darragnarok,, LEFT, 1, NA
return

closeevent:
 if(ok:=FindText(1067, 40, 1595, 338, 0, 0, closeevent)) 
{
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
}
return

gotorift:


if(ok:=FindText(1067, 40, 1595, 338, 0, 0, gotorift)) 
{		

		tooltip,
		CoordMode, Mouse
		X:=ok.1.x-(1065), Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, darragnarok,, LEFT, 1, NA
		
}
else
{
WinActivate, darragnarok
CoordMode,Mouse, Relative
Click, 468,213, Down
sleep 500
MouseMove, 475, 130,20
sleep 500
Click, 475, 130, Up
sleep 1000
goto gotorift
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
While(!ok:=FindText(397, 167, 491, 197, 0, 0, Kafra))
{
	SetTimer, MaxTime, 1000
	sleep 1000
	if (WaitingTime=10) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x471 y182, BlueStacks,, LEFT, 1, NA 
			}
				
}
setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
{
	setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
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


if(ok:=FindText(172, 132, 522, 438, 0.1, 0.1, GlastheimMainClient))
{
}
else
{
gosub slideup
}



while(!ok:=FindText(172, 132, 522, 438, 0.1, 0.1, GlastheimMainClient))
{
}
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 1000
}
	
ControlClick, x614 y214, BlueStacks,, LEFT, 1, NA 
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


checkstatus(darragnarokstatus){
Loop, parse, darragnarokstatus, `,
{
    if(ok:=FindText(1067, 40, 1595, 338, 0, 0, %A_LoopField% ))
	return 1
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
Q:: ExitApp
