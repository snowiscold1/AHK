#SingleInstance Force
char:= "main"
DetectHiddenWindows, On
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%
SetTimer, failsafe, 40000
#include C:\Users\snowi\Desktop\AHK\botschmitz_zahey\botschmitzcfg_zahey.ini
WinGet, TitleID, ID, %Title%
path = C:\Users\snowi\Desktop\AHK\botschmitz_zahey\botschmitzcheck_zahey.ahk
path2 = C:\Users\snowi\Desktop\AHK\botschmitz_zahey\botschmitz_zahey.ahk
path3 =  C:\Users\snowi\Desktop\AHK\botschmitz_zahey\botschmitzbackup_zahey.ahk

FindText_BindWindow(TitleID)

loop{
if FileExist("data.txt") {
	command := TF_ReadLines("data.txt",1,1,1)
	if (!command){
	sleep 2000
	}
	else
		gosub, %command%
		break
}
}
ExitApp
return

zeny:

FileDelete, %A_ScriptDir%/zahey.png
FileDelete, %A_ScriptDir%/BlueStacks.png
FileDelete, %A_ScriptDir%/data.txt
goto %1%

zahey:

EnterLine := [421, 421, 471, 443,"|<>*226$27.7rzrvWFCo56fqfcnSp5s/kg"]
while(!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
{
	wait1++
	sleep 1000
	if (wait1>40){
		sendError("please wait")
		ExitApp
	}
}

Run, %ComSpec% /c python "ss.py" "zahey"
sleep 3000
ExitApp

return

snow:

EnterLine := [421, 90, 471, 112,"|<>*226$27.7rzrvWFCo56fqfcnSp5s/kg"]
while(!ok:=FindText(EnterLine[1], EnterLine[2], EnterLine[3], EnterLine[4], 0, 0, EnterLine[5]))
{
	wait++
	sleep 1000
	if (wait>40){
		sendError("please wait")
		ExitApp
	}
}

Run, %ComSpec% /c python "ss.py" "BlueStacks"
sleep 3000
ExitApp

return




stopbot:

DetectHiddenWindows, On
Winclose, %path% ahk_class AutoHotkey
Winclose, %path2% ahk_class AutoHotkey
Winclose, %path3% ahk_class AutoHotkey
return

logout:
gosub stopbot
Critical
while(ok:=FindText(changechannelXbutton[1], changechannelXbutton[2], changechannelXbutton[3], changechannelXbutton[4], 0, 0, changechannelXbutton[5]))
{
	ControlClick, x477 y52, %Title%,, LEFT, 1, NA
	sleep 1000
}
if(ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{	
ControlClick, x498 y75, %Title%,, LEFT, 1, NA ;map
sleep 1000
}

while(!ok:=FindText(menuguild[1], menuguild[2], menuguild[3], menuguild[4], 0, 0, menuguild[5]))
{
	ControlClick, x446 y60, %Title%,, LEFT, 1, NA ;menu
	sleep 1000
}

ControlClick, x397 y196, %Title%,, LEFT, 1, NA ; settings
sleep 2000
ControlClick, x198 y280, %Title%,, LEFT, 1, NA ; backtologin
senderror("Your character has been logged out")
sleep 30000
ControlClick, x270 y253, %Title%,, LEFT, 1, NA ; press to start
sleep 5000
ControlClick, x270 y253, %Title%,, LEFT, 1, NA ; press to start
sleep 5000
ControlClick, x39 y185, %Title%,, LEFT, 1, NA ; choose char
sleep 1000
ControlClick, x39 y185, %Title%,, LEFT, 1, NA ; choose char
senderror("Ready to login, type !login")
ExitApp

login:
tooltip, logging in
sleep 500
tooltip, 
ControlClick, x465 y300, %Title%,, LEFT, 1, NA ; start
sleep 1000
ControlClick, x465 y300, %Title%,, LEFT, 1, NA ; start
sleep 1000
ControlClick, x465 y300, %Title%,, LEFT, 1, NA ; start
sleep 1000
while(!ok:=FindText(popupstart[1], popupstart[2], popupstart[3], popupstart[4], 0, 0, popupstart[5]))
{
}
sleep 1000
ControlClick, x413 y63, %Title%,, LEFT, 1, NA ; closepopup
sleep 1000
gosub startbot
senderror("You are now logged in")
ExitApp

startbot:
run, %path1%
run, %path2%
run, %path3%
sleep 3000
Control,ChooseString,TH,ComboBox1,client fern
sleep 500
ControlSend, Edit1, 1, client fern
sleep 500
Control,Check,,Button3,client fern
sleep 500
ControlClick, Button1, client fern
;~ ControlClick, Button2, Client Fern
;~ sleep 2000
;~ ControlClick, OK, ahk_class #32770
;~ sleep 1000
;~ CoordMode, Mouse, Screen
;~ Click, 680, 288
sleep 4000
Control,Check,,Button3,Client Fern
Send, {F11}


return

failsafe:
ExitApp

restartpc:
Shutdown, 6
return




sendError(msg){
ComObjError(false)
	url:="https://discord.com/api/webhooks/951230621651435540/2uWy6U_OwFJUDQFTlrQ9d1nLQg48FsCUJoCFjTZYhqh-bjHG2HoyJo_2HAp42OlORmRs"
	postdata=
	(
	{
      "embeds": [
      {
      "description": "%msg%"
      }
      ]
	}
	) ;Use https://leovoel.github.io/embed-visualizer/ to generate above webhook code
	
	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("POST", url, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
	WebRequest.Send(postdata)  
}