#SingleInstance Force
char:= "snowiscold1"
SetControlDelay, -1
Title := "nurse"
WinGet, TitleID, ID, %Title%
worldmap :=[284, 547, 334, 573,"|<>**50$14.0HUCM2b0NU6mR8bm9wXXgQRt1O"]
atkon:=[494, 584, 526, 616,"|<>**50$17.kQ7UECU0t01D07rUQa0FU050UG20g60E00U"]
mvp:=[366, 482, 480, 578,"|<>**50$15.0s0Rs233kCTzH8WFSSQnnwCLPP6vDaEsH+qDrY|<>**50$15.0s0Rs6F3kSPyH8WnOSRnnxCMHPinjWOGFja7LY"]
closemob:= [466, 459, 485, 475,"|<>**50$10.wzSQnsRna6nCSTzwy"]
stayalertchecked:= [420, 566, 442, 586,"|<>**50$14.07k3htlztwwv6SsC770lk6s0w2"]
queing:= [360, 487, 468, 577,"|<>**50$33.0001k7w0s+0izzzzxKWeedjZrDQygi/Odzzzzzs0000/00001w"]

queing:
gosub openmap
ControlClick, x372 y51, %Title%,, LEFT, 1, NA ;map open
sleep 500
ControlClick, x362 y149, %Title%,, LEFT, 1, NA ; 1st kill
sleep 1000
FindText_BindWindow(TitleID)
while(!ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				ControlClick, x508 y270, %Title%,, LEFT, 1, NA ; atk button again kalau tak klua
				sleep 2000
}
FindText_BindWindow(TitleID)
while(!ok:=FindText(queing[1], queing[2], queing[3], queing[4], 0, 0, queing[5]))
{
	sleep 1000
}
while(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				ControlClick, x474 y137, %Title%,, LEFT, 1, NA ; close atk menu
				sleep 500
}
ControlClick, x448 y55, %Title%,, LEFT, 1, NA ; close map
sleep 500
gosub summon
sleep 120000
goto queing
return




preparation:
FindText_BindWindow(TitleID)

while(!ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
		ControlClick, x508 y270, %Title%,, LEFT, 1, NA ; atk button again kalau tak klua
		sleep 500
}
FindText_BindWindow(TitleID)
while(!ok:=FindText(stayalertchecked[1], stayalertchecked[2], stayalertchecked[3], stayalertchecked[4], 0, 0, stayalertchecked[5]))
{
				ControlClick, x431 y245, %Title%,, LEFT, 1, NA ; stay alert button
				sleep 500
}
ControlClick, x374 y163, %Title%,, LEFT, 1, NA ; atk all
sleep 500
FindText_BindWindow(TitleID)
while(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				ControlClick, x474 y137, %Title%,, LEFT, 1, NA ; close atk menu
				sleep 500
}

return

summon:
ControlClick, x250 y192, %Title%,, LEFT, 1, NA ; kill
gosub openmap
ControlClick, x362 y149, %Title%,, LEFT, 1, NA ; 1st kill
sleep 5000
ControlClick, x473 y307, %Title%,, LEFT, 1, NA ; atkslot
sleep 3000
ControlClick, x363 y159, %Title%,, LEFT, 1, NA ; 2nd kill
sleep 5000
ControlClick, x473 y307, %Title%,, LEFT, 1, NA ; atkslot
sleep 3000
ControlClick, x367 y156, %Title%,, LEFT, 1, NA ; 3rd kill
sleep 5000
ControlClick, x473 y307, %Title%,, LEFT, 1, NA ; atkslot
sleep 3000
ControlClick, x358 y153, %Title%,, LEFT, 1, NA ; 4th kill
sleep 5000
ControlClick, x473 y307, %Title%,, LEFT, 1, NA ; atkslot
sleep 3000

return

openmap:
FindText_BindWindow(TitleID)
while(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{	
ControlClick, x498 y75, %Title%,, LEFT, 1, NA
sleep 1000
}
return

killmvp:
if (ok:=FindText(atkon[1],atkon[2],atkon[3],atkon[4], 0, 0, atkon[5]))
{
	ControlClick, x508 y270, %Title%,, LEFT, 1, NA ; atk button cancelkan dulu
	sleep 1000
}
ControlClick, x508 y270, %Title%,, LEFT, 1, NA ; atk button
sleep 1000
while(!ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				ControlClick, x508 y270, %Title%,, LEFT, 1, NA ; atk button again kalau tak klua
				sleep 2000
}
while(ok:=FindText(stayalertchecked[1], stayalertchecked[2], stayalertchecked[3], stayalertchecked[4], 0, 0, stayalertchecked[5]))
{
				ControlClick, x431 y245, %Title%,, LEFT, 1, NA ; stay alert button
				sleep 2000
}
while(!ok:=FindText(mvp[1], mvp[2], mvp[3], mvp[4], 0, 0, mvp[5]))
{
}
{
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(331), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 500
}
while(ok:=FindText(closemob[1], closemob[2], closemob[3], closemob[4], 0, 0, closemob[5]))
{
				CoordMode, Mouse
				X:=ok.1.x, Y:=ok.1.y-(331), Comment:=ok.1.id
				ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
				sleep 500
}
return
