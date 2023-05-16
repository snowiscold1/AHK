
efficiency(){
global
Gui,5:Submit, NoHide
if (Alt2=0) {
	IniRead, currentkill , %A_ScriptDir%\pos.ini, Stats, kill:
	log("current kill " currentkill)
}

totalfoundkill := currentkill-earlykill

efficiency := (totalfoundkill/totalfound)*100
;322,162 atas kanan
;354 161 kiri atas
;318 194 kanan atas
;352 193

t1x:="x322"
t1y:="y162"

t2x:="x354"
t2y:="y161"

t3x:="x318"
t3y:="y194"

if (efficiency < 70) {
	log("Current tauntspot " tauntcoord1x " " tauntcoord1y " is not efficient")
IniRead, tauntcoord1x , %A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniRead, tauntcoord1y , %A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
if (tauntcoord1x == t1x)
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=t2x
		newtauntcoord1y:=t2y
	}
	
	if (t=2) {
		newtauntcoord1x:=t3x
		newtauntcoord1y:=t3y
	}
}

if (tauntcoord1x == t2x)
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=t1x
		newtauntcoord1y:=t1y
	}
	
	if (t=2) {
		newtauntcoord1x:=t3x
		newtauntcoord1y:=t3y
	}
}

if (tauntcoord1x == t3x)
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:=t1x
		newtauntcoord1y:=t1y
	}
	
	if (t=2) {
		newtauntcoord1x:=t2x
		newtauntcoord1y:=t2y
	}
}


IniWrite, %newtauntcoord1x%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniWrite, %newtauntcoord1y%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
log("Changed to " newtauntcoord1x " " newtauntcoord1y " on next wave")
}

totalfound := 0

return %efficiency%
}

if (efficiency < 70) {
	log("Current tauntspot " tauntcoord1x " " tauntcoord1y " is not efficient")
IniRead, tauntcoord1x , %A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniRead, tauntcoord1y , %A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
if (tauntcoord1x == "x322")
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:="x354"
		newtauntcoord1y:="y161"
	}
	
	if (t=2) {
		newtauntcoord1x:="x318"
		newtauntcoord1y:="y194"
	}
}

if (tauntcoord1x == "x354")
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:="x322"
		newtauntcoord1y:="y162"
	}
	
	if (t=2) {
		newtauntcoord1x:="x318"
		newtauntcoord1y:="y194"
	}
}

if (tauntcoord1x == "x318")
{
	random, t, 1,2
	if (t=1) {
		newtauntcoord1x:="x322"
		newtauntcoord1y:="y162"
	}
	
	if (t=2) {
		newtauntcoord1x:="x354"
		newtauntcoord1y:="y161"
	}
}


IniWrite, %newtauntcoord1x%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1x:
IniWrite, %newtauntcoord1y%,%A_ScriptDir%\pos.ini, Backup, tauntcoord1y:
log("Changed to " newtauntcoord1x " " newtauntcoord1y " on next wave")
}

totalfound := 0

return %efficiency%
}