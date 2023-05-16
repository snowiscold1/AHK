#SingleInstance Force
Title:= "BlueStacks"
Title2:= "nurse"
Title3:= "ADEL"
Title4:= "SoulSlayers"
Title5:= "sundalmalam"

Menu, Tray, Icon, %A_ScriptDir%\icon.ico
WinMove, %Title%,,0,0, 800, 491
WinMove, %Title2%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 
DetectHiddenWindows, On
SetTitleMatchMode, 3

jumptonurse := [600, 535, 794, 581,"|<>**50$18.TzyNrzkEVEldlUVkbzTzwK00L00H00FU09U0+y0A70U|<>0xFAFCFD@0.85$8.63kQC1W0VsC3U"]
follownurse := [543, 614, 681, 742,"|<>**50$20.wS09xzzpMZZqtTJeDzzzU"]
confirmfollownurse :=[803, 713, 899, 749,"|<>**50$30.00D00vzv/yfAHFHupzJhypfIhX5fIhzzzzzU"]
following := [600, 535, 794, 581,"|<>**50$18.00Ak01U02M04s04g04i00a00X00U"]
stopfollownurse:= [546, 680, 676, 718,"|<>**50$46.T01sw003/zwzTzzvZFyB6hFurrCrPrqdJTfJJJTzzvzzzx01k0001A0000007c"]
KingSchmitzalt:= [880, 618, 1022, 758,"|<>*98$30.RzwxzJ4NUE5HQhZJEShZRoMppzszzzU|<>*101$29.xzzxyfPleoJ1aEGePpgYJ68NTyDzzU|<>*105$27.xzzzuzz7j5ENY2ePpgJIMVbznzzzwzzw|<>*103$13.xzjzpF0eNJ1zwzwk|<>*99$13.xzeW1IGeNJFzkU"]
GhostJanCaptalt :=[880, 618, 1022, 758,"|<>*104$21.zzxtYYdQdVE0I+zjzw|<>*88$20.zzvmGGbVC+EF2WnLzxzzU|<>*92$21.zzxsYYdQ9lF1I+zjzzxzzU|<>*106$21.bzxtY4dQdVE4I+zjzw"]
fullmob := [903, 743, 925, 755,"|<>0x0170B5@0.85$3.YbU|<>0x0170B6@0.71$7.UGNgPh"]


jumptonurse:
While(!ok:=FindText(jumptonurse[1], jumptonurse[2], jumptonurse[3], jumptonurse[4], 0, 0, jumptonurse[5]))
{	
}
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
}

follownurse:
While(!ok:=FindText(follownurse[1], follownurse[2], follownurse[3], follownurse[4], 0, 0, follownurse[5]))
{	
}
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
}

confirmfollownurse:
While(!ok:=FindText(confirmfollownurse[1], confirmfollownurse[2], confirmfollownurse[3], confirmfollownurse[4], 0, 0, confirmfollownurse[5]))
{	
}
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
}

following:
While(!ok:=FindText(following[1], following[2], following[3], following[4], 0, 0, following[5]))
{	
}
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
}

stopfollownurse:
While(!ok:=FindText(stopfollownurse[1], stopfollownurse[2], stopfollownurse[3], stopfollownurse[4], 0, 0, stopfollownurse[5]))
{	
}
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
}

While(ok:=FindText(following[1], following[2], following[3], following[4], 0, 0, following[5]))
{	
}

sleep 500
ControlClick, x483 y97, %Title4%,, LEFT, 1, NA ;minimap open
sleep 500
ControlClick, x460 y165, %Title4%,, LEFT, 1, NA ;kingsmithloc
sleep 500
ControlClick, x514 y97, %Title4%,, LEFT, 1, NA ;minimap close
sleep 500
ControlClick, x511 y266, %Title4%,, LEFT, 1, NA ;atkbutton
sleep 500

KingSchmitzalt:

if(ok:=FindText(KingSchmitzalt[1], KingSchmitzalt[2], KingSchmitzalt[3], KingSchmitzalt[4], 0, 0, KingSchmitzalt[5]))
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
		
		While(ok:=FindText(KingSchmitzalt[1], KingSchmitzalt[2], KingSchmitzalt[3], KingSchmitzalt[4], 0, 0, KingSchmitzalt[5]))
		{	
		}

}
else
{
		

if(ok:=FindText(fullmob[1], fullmob[2], fullmob[3], fullmob[4], 0, 0, fullmob[5]))
{
		gosub slideup
		sleep 1000
		
		if(ok:=FindText(KingSchmitzalt[1], KingSchmitzalt[2], KingSchmitzalt[3], KingSchmitzalt[4], 0, 0, KingSchmitzalt[5]))
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
		
		While(ok:=FindText(KingSchmitzalt[1], KingSchmitzalt[2], KingSchmitzalt[3], KingSchmitzalt[4], 0, 0, KingSchmitzalt[5]))
		{	
		}
		gosub slidedown
}
else
{
		goto jumptonurse
}

		
}



	
		
		
}













sleep 10000

GhostJanCaptalt:
if(ok:=FindText(GhostJanCaptalt[1], GhostJanCaptalt[2], GhostJanCaptalt[3], GhostJanCaptalt[4], 0, 0, GhostJanCaptalt[5]))
{
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, Title4, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title4%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title4%,, LEFT, 1, NA 
}
While(ok:=FindText(GhostJanCaptalt[1], GhostJanCaptalt[2], GhostJanCaptalt[3], GhostJanCaptalt[4], 0, 0, GhostJanCaptalt[5]))
{	
}
sleep 25000

goto jumptonurse



SlideUp:
CoordMode,Mouse, Screen
MouseGetPos, hereX, hereY
Click, 961,751, Down
sleep 300
MouseMove, 931,664 ,10
sleep 300
Click, 931, 664, Up
MouseMove, %hereX%, %hereY%
return

SlideDown:
CoordMode,Mouse, Screen
MouseGetPos, hereX, hereY
Click, 931,664, Down
sleep 300
MouseMove, 961,751 ,10
sleep 300
Click, 961,751, Up
MouseMove, %hereX%, %hereY%
return