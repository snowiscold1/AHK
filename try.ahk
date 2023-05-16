#singleinstance force
CountNumb := "TH10"

IniRead, spot1 , %A_ScriptDir%\try.ini, Backup, spot1:
IniRead, spot2 , %A_ScriptDir%\try.ini, Backup, spot2:
IniRead, spot3 , %A_ScriptDir%\try.ini, Backup, spot3:
IniRead, tauntspot , %A_ScriptDir%\try.ini, Backup, tauntspot:
spot1 := StrSplit(spot1,",", ".") ; Omits periods.
spot2 := StrSplit(spot2,",", ".") ; Omits periods.
spot3 := StrSplit(spot3,",", ".") ; Omits periods.
tauntspot := StrSplit(tauntspot,",", ".") ; Omits periods.

if (tauntspot[1] == spot1[1])
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=spot2[1]
		newtauntcoord1y:=spot2[2]
	}
	
	if (t=2) {
		newtauntcoord1x:=spot3[1]
		newtauntcoord1y:=spot3[2]
	}
}

if (tauntspot[1] == spot2[1])
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=spot1[1]
		newtauntcoord1y:=spot1[2]
	}
	
	if (t=2) {
		newtauntcoord1x:=spot3[1]
		newtauntcoord1y:=spot3[2]
	}
}

if (tauntspot[1] == spot3[1])
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=spot1[1]
		newtauntcoord1y:=spot1[2]
	}
	
	if (t=2) {
		newtauntcoord1x:=spot2[1]
		newtauntcoord1y:=spot2[2]
	}
}
newspot:= % newtauntcoord1x "," newtauntcoord1y
IniWrite, %newspot%,%A_ScriptDir%\try.ini, Backup, tauntspot:

ControlClick, % tauntspot[1] " " tauntspot[2], Untitled - Paint,, LEFT, 1, NA ;location far btm right

return

