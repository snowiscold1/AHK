#SingleInstance Force
#Include %A_ScriptDir%\configurenew.ini


firstrun = 1
die = 0
Loop {
	
While(!ok:=FindText(Ress[1], Ress[2], Ress[3], Ress[4], 0, 0, Ress[5]))
		{
		}
		
{
			
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
		sleep 500
		yourmessage := "Please check your character, someone killed you"
		gosub Telegram
		die++		
		DetectHiddenWindows, On 
		SetTitleMatchMode,2
			IfWinExist, hellplant ida plain smart random.ahk
			{
				
				DetectHiddenWindows, On 
				WinClose, %hpida% ahk_class AutoHotkey
				sleep 1000
				Run %hpida% ahk_class AutoHotkey
				gosub ComebackIda
			}
	
			IfWinExist, hellplant cuphert good spot.ahk
			{
				DetectHiddenWindows, On 
				WinClose, %hpculvert% ahk_class AutoHotkey
				sleep 1000
				Run %hpculvert% ahk_class AutoHotkey
				gosub ComebackCulvert
			}
}	


}
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

ComebackIda:
sleep 15000	

ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 300
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 300
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 1000

ControlClick, x656 y278, BlueStacks,, LEFT, 1, NA 
sleep 500
While(!ok:=FindText(Kafra[1], Kafra[2], Kafra[3], Kafra[4], 0, 0, Kafra[5]))
{
SetTimer, MaxTime, 1000
			sleep 1000
			if (WaitingTime=10) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x456 y183, BlueStacks,, LEFT, 1, NA 
				sleep 500
				goto kafra
			}
}

{
	
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 500
 }
kafra:
setTimer, MaxTime, off
ToolTip,
ControlClick, x707 y334, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x707 y334, BlueStacks,, LEFT, 1, NA 
sleep 500
gosub SlideUp
gosub SlideUp
sleep 1500
if(ok:=FindText(RachelArea[1], RachelArea[2], RachelArea[3], RachelArea[4], 0, 0, RachelArea[5]))
	{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	}
else
	{
		ControlClick, x292 y413, BlueStacks,, LEFT, 1, NA
	}
sleep 1000
ControlClick, x620 y212, BlueStacks,, LEFT, 1, NA 
sleep 1000

While(!ok:=FindText(Ida[1], Ida[2], Ida[3], Ida[4], 0, 0, Ida[5]))
		{
		}
		sleep 500
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 300
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 300
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 1000
ControlClick, x586 y449, BlueStacks,, LEFT, 1, NA 
sleep 1000

ControlClick, x565 y189, BlueStacks,, LEFT, 1, NA ;location spot
sleep 10000
While(!ok:=FindText(Ida11oc[1], Ida11oc[2], Ida11oc[3], Ida11oc[4], 0, 0, Ida11oc[5]))
		{
			SetTimer, MaxTime, 1000
			sleep 1000
			if (WaitingTime=30) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto startfarmida
			}
			
			
		}

startfarmida:
setTimer, MaxTime, off
tooltip,
WinActivate, Bluestack
sleep 500
ControlClick, x744 y123, BlueStacks,, LEFT, 1, NA  ; close map
sleep 500
ControlClick, x773 y125, BlueStacks,, LEFT, 1, NA ;close map
sleep 500
gosub ZoomOut
sleep 500
ControlClick, x744 y123, BlueStacks,, LEFT, 1, NA ; open map
send ^r
return


ComebackCulvert:

sleep 15000
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 1000
ControlClick, x656 y278, BlueStacks,, LEFT, 1, NA 
sleep 500
While(!ok:=FindText(Kafra[1], Kafra[2], Kafra[3], Kafra[4], 0, 0, Kafra[5]))
{
SetTimer, MaxTime, 1000
			sleep 1000
			if (WaitingTime=10) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				ControlClick, x456 y183, BlueStacks,, LEFT, 1, NA 
				sleep 500
				goto kafra2
			}
}

{
	
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 500
 }
kafra2:
setTimer, MaxTime, off
ToolTip,
ControlClick, x707 y334, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x707 y334, BlueStacks,, LEFT, 1, NA 
sleep 500

if(ok:=FindText(GlastheimMainClient[1], GlastheimMainClient[2], GlastheimMainClient[3], GlastheimMainClient[4], 0.1, 0.5, GlastheimMainClient[5]))
{
}
else
{
gosub slideup
}



while(!ok:=FindText(GlastheimMainClient[1], GlastheimMainClient[2], GlastheimMainClient[3], GlastheimMainClient[4], 0.1, 0.5, GlastheimMainClient[5]))
{
}
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 1000
}
		
ControlClick, x576 y306, BlueStacks,, LEFT, 1, NA 
sleep 1000

while (!ok:=FindText(Culvert[1], Culvert[2], Culvert[3], Culvert[4], 0.1, 0, Culvert[5]))
{
}
{
   CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
	sleep 1000
}
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 300
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 300
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 1000
ControlClick, x586 y449, BlueStacks,, LEFT, 1, NA 
sleep 1000
ControlClick, x677 y291, BlueStacks,, LEFT, 1, NA ;location spot
sleep 300
ControlClick, x677 y291, BlueStacks,, LEFT, 1, NA ;location spot
sleep 300
ControlClick, x677 y291, BlueStacks,, LEFT, 1, NA ;location spot
sleep 10000

 While(!ok:=FindText(Culvertspot[1], Culvertspot[2], Culvertspot[3], Culvertspot[4], 0.1, 0, Culvertspot[5]))
{
	SetTimer, MaxTime, 1000
			sleep 1000
			if (WaitingTime=30) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto startfarmculvert
			}
}
startfarmculvert:
setTimer, MaxTime, off
ToolTip,
sleep 1000
send ^r
return

SlideUp:
CoordMode,Mouse, Screen
Click, 298,427, Down
sleep 500
MouseMove, 300, 185,20
sleep 500
Click, 300, 185, Up
sleep 500
return

MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return		


ZoomOut:
WinActivate, BlueStacks
sleep 1000
Send {Ctrl Down}
sleep 500
send {- Down}
Sleep 3000 ;wait 50 ms
Send {Ctrl Up}
send {- Up}
return

^I:: msgbox,You have died %die% times.
