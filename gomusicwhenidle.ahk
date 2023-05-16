#SingleInstance Force
WaitingTime=0
nochange=0
#Include %A_ScriptDir%\configurenew.ini
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
WinGet, Title3ID, ID, %Title3%
WinGet, Title4ID, ID, %Title4%
WinGet, Title5ID, ID, %Title5%


gosub Follownurse
gosub changeID1
gosub follownurse
gosub gotoprontsouth
gosub getbackGH

ExitApp

changeID1:
FindText_BindWindow(Title2ID)
ControlClick, x257 y172, %Title2%,, LEFT, 1, NA ; click npc change chg
sleep 500
ControlClick, x257 y172, %Title2%,, LEFT, 1, NA ; click npc change chg
 while(!ok:=FindText(ChangeChannelBtn[1],ChangeChannelBtn[2],ChangeChannelBtn[3],ChangeChannelBtn[4], 0, 0, ChangeChannelBtn[5]))
{
}
{
   CoordMode, Mouse
   X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 500
}

 While (!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
 {
 }
 {
	;~ WinActivate, %Title2%
	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x441 y103, %Title2%,, LEFT, 1, NA
 
 }
 
  While (!ok:=FindText(EnterLine2[1],EnterLine2[2],EnterLine2[3],EnterLine2[4], 0, 0, EnterLine2[5]))
 {
 }
				
 {
	;~ WinActivate, %Title2%
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
 }
 
ControlSend, ,1, %Title2%

sleep 500
ControlClick, x496 y306, %Title2%,, LEFT, 1, NA
sleep 500
ControlClick, x239 y245, %Title2%,, LEFT, 1, NA ; open country list


While (!ok:=FindText(CountryList[1], CountryList[2], CountryList[3], CountryList[4], 0, 0, CountryList[5]))
{
}
				
ID:
ID:= [657, 130, 765, 232,"|<BI1>*198$24.s800jjRattRbatoztNRbU|<BI2>*197$24.s800jjRyttRbatovvtRbU|<BI3>*200$24.s800jjRittR7atozztRbU|<BI4>*198$24.s800jjNittB7atwzztRbU|<BI5>*197$24.s800jjNastB3atozztRjU|<BI6>*181$24.k800djNasN51atIzztRbU"]
if(ok:=FindText(ID[1], ID[2], ID[3], ID[4], 0, 0, ID[5]))
{
	CoordMode, Mouse
	X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title2%,, LEFT, 1, NA
}

sleep 500
ControlClick, x384 y303, %Title2%,, LEFT, 1, NA
sleep 1000

changechannelXbutton:
FindText_BindWindow(Title2ID)
if(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{

	sleep 500
	CoordMode, Mouse
    X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x474 y52, %Title2%,, LEFT, 1, NA
}


return



FOLLOWNURSE:
FindText_BindWindow(TitleID)
 While(!ok:=FindText(jumperavatar[1], jumperavatar[2], jumperavatar[3], jumperavatar[4], 0, 0, jumperavatar[5]))
{
		if (WaitingTime=0) {
			waitingtime++
			SetTimer, MaxTime, 1000
			}	
				
		if (WaitingTime=7) {
			 setTimer, MaxTime, off
			 Tooltip, 
			 WaitingTime=0
			 nochange=1
			 goto gotoprontsouth
			}
}
		setTimer, MaxTime, off
		Tooltip, 
		WaitingTime=0				
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y+(20), Comment:=ok.1.id
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
			
		CoordMode, Mouse
		X:=ok.1.x-(10), Y:=ok.1.y+(10), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA

sleep 1000
While(!ok:=FindText(UnFollowBtn[1],UnFollowBtn[2],UnFollowBtn[3],UnFollowBtn[4], 0, 0, UnFollowBtn[5]))
{
}
			
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 500

;~ ControlClick, x654 y170, BlueStacks,, LEFT, 1, NA ;location spot 12oc
while(ok:=FindText(jumperavatarfollow[1],jumperavatarfollow[2],jumperavatarfollow[3],jumperavatarfollow[4], 0, 0, jumperavatarfollow[5]))
{
}

return

gotoprontsouth:
FindText_BindWindow(TitleID)
gosub openmap
sleep 300
ControlClick, x334 y270, %Title%,, LEFT, 1, NA ;butterflywing slot
sleep 300
ControlClick, x334 y270, %Title%,, LEFT, 1, NA ;butterflywing slot
sleep 300
ControlClick, x334 y270, %Title%,, LEFT, 1, NA ;butterflywing slot
sleep 10000
While(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
}
ControlClick, x300 y232, %Title%,, LEFT, 1, NA
sleep 300
ControlClick, x300 y232, %Title%,, LEFT, 1, NA
sleep 300				
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
;ControlClick, x550 y400, %Title%,, LEFT, 1, NA ; worldmap
sleep 2000
ControlClick, x307 y225, %Title%,, LEFT, 1, NA ; prontsouth
sleep 1000
While(!ok:=FindText(MusicboxLocWorld[1], MusicboxLocWorld[2], MusicboxLocWorld[3], MusicboxLocWorld[4], 0, 0, MusicboxLocWorld[5]))
{
	if (WaitingTime=0) {
				waitingtime++
				SetTimer, MaxTime, 1000
				}	
				if (WaitingTime=20) {
				 setTimer, MaxTime, off
				 Tooltip, 
				ControlClick, x307 y225, %Title%,, LEFT, 1, NA ; prontsouth
				sleep 1000
				WaitingTime=0
				}
	
}
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 1000
While(ok:=FindText(MusicboxLocWorld[1], MusicboxLocWorld[2], MusicboxLocWorld[3], MusicboxLocWorld[4], 0, 0, MusicboxLocWorld[5]))
{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
		sleep 2000		
}
		
nursereturnch:
FindText_BindWindow(Title2ID)
if (nochange=1)
{
}
else
{

ControlClick, x257 y172, %Title2%,, LEFT, 1, NA ; click npc change chg
sleep 500


 while(!ok:=FindText(ChangeChannelBtn[1],ChangeChannelBtn[2],ChangeChannelBtn[3],ChangeChannelBtn[4], 0, 0, ChangeChannelBtn[5]))
{
	ControlClick, x257 y172, %Title2%,, LEFT, 1, NA ; click npc change chg
	sleep 1000
}
{
   CoordMode, Mouse
   X:=ok.1.x-(533), Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, %Title2%,, LEFT, 1, NA
   sleep 500
}
ControlClick, x436 y222, %Title2%,, LEFT, 1, NA		
sleep 2000
ControlClick, x389 y304, %Title2%,, LEFT, 1, NA		
sleep 2000		
}		
FindText_BindWindow(TitleID)
While(!ok:=FindText(MusicboxRequest[1], MusicboxRequest[2], MusicboxRequest[3], MusicboxRequest[4], 0, 0, MusicboxRequest[5]))
{
}
		ControlClick, x476 y50, %Title%,, LEFT, 1, NA
		sleep 1000
While(ok:=FindText(MusicboxRequest[1], MusicboxRequest[2], MusicboxRequest[3], MusicboxRequest[4], 0, 0, MusicboxRequest[5]))
{
			ControlClick, x476 y50, %Title%,, LEFT, 1, NA
			sleep 1000
}

musiccounter:		
		IniRead, prevamt , %A_ScriptDir%\pos.ini, Music, prevamt:
		startmusic := A_TickCount
		gosub waitnextspawn
		sleep, % 58min
		endmusic := floor(((A_TickCount - startmusic)/1000)/60)
		prevamt += %endmusic%
		IniWrite, %prevamt%,%A_ScriptDir%\pos.ini, Music, prevamt:
		
		if(ok:=FindText(MusicboxRequest[1], MusicboxRequest[2], MusicboxRequest[3], MusicboxRequest[4], 0, 0, MusicboxRequest[5]))
	{
		ControlClick, x476 y50, %Title%,, LEFT, 1, NA
		sleep 1000
	}

return
g::
getbackgh:
FindText_BindWindow(TitleID)
gosub openmap
While(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{
}
ControlClick, x385 y230, %Title%,, LEFT, 1, NA ; view nearby
sleep 1000
ControlClick, x233 y55, %Title%,, LEFT, 1, NA ; npc
sleep 1000
ControlClick, x219 y148, %Title%,, LEFT, 1, NA ; kafrastaff
sleep 1000

While(!ok:=FindText(teleportbtn[1], teleportbtn[2], teleportbtn[3], teleportbtn[4], 0, 0, teleportbtn[5]))
{
}

ControlClick, x443 y243, %Title%,, LEFT, 1, NA ; tp
sleep 1000
ControlClick, x443 y243, %Title%,, LEFT, 1, NA ; pttp
sleep 1000

ControlClick, x221 y253, %Title%,, LEFT, 1, NA ; GlastHeim Area
sleep 1000
ControlClick, x439 y269, %Title%,, LEFT, 1, NA ; GlastHeim Hall
sleep 10000
gosub openmap
sleep 300
while(!ok:=FindText(GHhallMain[1], GHhallMain[2], GHhallMain[3], GHhallMain[4], 0, 0, GHhallMain[5]))
{
}
{
	CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
	sleep 1000
}
random,randX, 398, 400
random,randY, 197, 199
ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA ;location spot btm right
ExitApp
return









waitnextspawn:
current_hour = %A_hour%
target_hour = % (current_hour+1)
target_time = %target_hour%00
if (target_time = 2400)
{
	target_time = 0000
}

converted := SubStr("000" . target_time, -3)
target = %A_YYYY%%A_MM%%A_DD%%converted%00
if (converted = 0000)
{
EnvAdd, target, 1, d
}

EnvSub, target, %A_Now%, Seconds.

nextspawn := target * 1000 
nextspawninmin := (nextspawn/1000)/60

58min := nextspawn - 120000
return

MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
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

openmap:
if(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{	
ControlClick, x502 y76, %Title%,, LEFT, 1, NA
sleep 100
}
return
 
openmaptp:
if(!ok:=FindText(821, 215, 871, 247, 0, 0, worldmap[5]))
{	
ControlClick, x498 y75, %Title2%,, LEFT, 1, NA
sleep 100
}
return
 
