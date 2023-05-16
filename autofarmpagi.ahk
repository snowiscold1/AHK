#SingleInstance Force
#Include %A_ScriptDir%\configure.ini


if (ok:=FindText(93, 52, 345, 108, 0.1, 1, Verify))
 {
  goto verify2
 }
 else
{
	msgbox, Please restart your machine. 
	ExitApp
}

verify2:
if (ok:=FindText(820, 48, 902, 132, 0.1, 1, Verify2))
 {
  goto start
 }
 else
{
	msgbox, Please restart your machine. 
	ExitApp
}


start:
timer(0747)

ControlClick, x469 y391, %Title2%,, LEFT, 1, NA ;nurse tp to izlude
sleep 300
ControlClick, x469 y391, %Title2%,, LEFT, 1, NA ;nurse tp to izlude
sleep 300
ControlClick, x469 y391, %Title2%,, LEFT, 1, NA ;nurse tp to izlude
sleep 300
ControlClick, x707 y352, %Title%,, LEFT, 1, NA ;item bar 2
sleep 1000
ControlClick, x531 y328, %Title%,, LEFT, 1, NA ;mentor pot
sleep 1000
ControlClick, x589 y385, %Title%,, LEFT, 1, NA ; int meal
sleep 2000
ControlClick, x589 y385, %Title%,, LEFT, 1, NA ; int meal
sleep 2000
ControlClick, x589 y385, %Title%,, LEFT, 1, NA ; int meal
sleep 2000
ControlClick, x531 y328, %Title%,, LEFT, 1, NA ;mentor pot
sleep 1000
ControlClick, x589 y385, %Title%,, LEFT, 1, NA ; int meal
sleep 2000
ControlClick, x589 y385, %Title%,, LEFT, 1, NA ; int meal
sleep 2000
ControlClick, x589 y385, %Title%,, LEFT, 1, NA ; int meal
sleep 1000
ControlClick, x474 y324, %Title%,, LEFT, 1, NA 
sleep 1000
ControlClick, x247 y66, %Title%,, LEFT, 1, NA 
sleep 1000
ControlClick, x276 y124, %Title%,, LEFT, 1, NA ;satisfied meal
;ControlClick, x349 y120, %Title%,, LEFT, 1, NA ;test meal
sleep 1000
ControlClick, x660 y328, %Title%,, LEFT, 1, NA ;add food
sleep 1000
ControlClick, x660 y328, %Title%,, LEFT, 1, NA 
sleep 1000
ControlClick, x660 y328, %Title%,, LEFT, 1, NA 
sleep 1000
ControlClick, x660 y328, %Title%,, LEFT, 1, NA 
sleep 1000
ControlClick, x660 y328, %Title%,, LEFT, 1, NA 
sleep 1000
ControlClick, x577 y369, %Title%,, LEFT, 1, NA  ; put food
sleep 1000
ControlClick, x606 y373, %Title%,, LEFT, 1, NA  ; for myself
sleep 5000

ControlClick, x473 y381, %Title%,, LEFT, 1, NA ; butterfly wings
sleep 15000
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x732 y124, BlueStacks,, LEFT, 1, NA 
sleep 500
ControlClick, x774 y124, BlueStacks,, LEFT, 1, NA 
sleep 1000
ControlClick, x704 y286, BlueStacks,, LEFT, 1, NA ; close item bar 2
sleep 1000
goto ComebackCulvert

ComebackCulvert:

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

if(ok:=FindText(172, 132, 522, 438, 0.1, 0.5, GlastheimMainClient))
{
}
else
{
gosub slideup
}



while(!ok:=FindText(172, 132, 522, 438, 0.1, 0.5, GlastheimMainClient))
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

while (!ok:=FindText(580, 107, 718, 141, 0.1, 0, Culvert))
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

 While(!ok:=FindText(128, 275, 206, 335, 0, 0, Culvertspot))
{
	SetTimer, MaxTime, 1000
			sleep 1000
			if (WaitingTime=30) {
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
				goto findchannel
			}
}

findchannel:
setTimer, MaxTime, off
ToolTip,
sleep 1000
Run %autofindchannel% ahk_class AutoHotkey
sleep 1000
Control,ChooseString,TH,ComboBox1,fern Only
sleep 500
ControlSend, Edit1, 100, fern Only
sleep 500
Control,Check,,Button3,fern Only
sleep 500
;~ ControlClick, Button2, fern Only
;~ sleep 2000
;~ ControlClick, OK, ahk_class #32770
;~ sleep 1000
;~ CoordMode, Mouse, Screen
;~ Click, 680, 288
sleep 1000
ControlClick, Button1, fern Only
ExitApp
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
timer(sec){
target_time = %sec%
target = %A_YYYY%%A_MM%%A_DD%%target_time%00
if (target < A_Now)
{  
    EnvAdd, target, 1, d
}
EnvSub, target, %A_Now%, Seconds.
Sleep, % target * 1000 
}

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
