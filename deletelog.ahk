#SingleInstance Force
toclose =  %A_ScriptDir%\deletelog.ahk
DetectHiddenWindows, On
SetTitleMatchMode, 2
IfWinExist, %toclose%
    WinClose, %toclose% ahk_class

appicon := [0, 0, 1600, 900,"|<icon>0xF2CA81@0.82$19.0DzUTDkCzsjzwrzsTz8zz7TzjzwXzwFzzMTqgC0w1UD4nzZvzVvzkD|<startbutton>*175$16.5aordNMh42m|<closeads>*180$7.H79C/51C98|<dcconfirm>*193$29.zzvzz7zbypvJyKvqzxhfhzvPE|ads2<>*154$19.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzvxzwQTy4TzUTzsTzw7zw1zwMzwSDzzzk|<>*142$10.boA81kDVw3U4A1sjq|<hacklogin>*200$49.zzjzzzzjdzrvzjzzKuuxhrOenFQSqvhpNiizvRqehzzzzzzxzzzzzzzszk|<closeapp>*164$33.U00004tvkxtccG0ch4vkx5cdE4dgtvkxtU"]
lastErrorTime := 0

#Persistent
setTimer, deletelog, 3600000
setTimer, checkHour, 60000
setTimer, tferror, 1000
setTimer, notifycrash, 5000

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

sleep, %nextspawn%
gosub deletelog


return

tferror:
WinWait, TF Lib Error
ControlClick, OK, TF Lib Error

run botschmitzcheck.ahk ahk_class AutoHotkey

return


deletelog:
    FileDelete, %A_ScriptDir%\log.txt
	TrayTip , Ultimate Farm Bot, Waiting for next spawn %nextspawninmin% min or %nextspawn% milisecond, 4 ;show for 4 seconds
return

checkHour:
    if (A_Hour = 6)
    {
        IniWrite, 0, %A_ScriptDir%\pos.ini, Music, prevamt
        IniWrite, 0, C:\Users\snowi\Desktop\AHK\botschmitz_client\pos.ini, Music, prevamt
        IniWrite, 0, C:\Users\snowi\Desktop\AHK\botschmitz_client\pos.ini, Music, prevamt
    }
return

notifycrash:
checkwholescreenandclick(appicon)
return

checkwholescreenandclick(var) {
if (ok := FindText(var[1], var[2], var[3], var[4], 0, 0, var[5]))
 {
		global lastErrorTime
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
       	ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA
        currentErrorTime := A_TickCount
		    if (currentErrorTime - lastErrorTime >= 300000) {
            lastErrorTime := currentErrorTime
            SendError("Your bot on PC Fern has crashed, please monitor. <@364381512243609600> <@500325079415128066>")
        }
}
return
}


sendError(msg){
	ComObjError(false)
	url:="https://discord.com/api/webhooks/950759671063515136/xVk8HNfLk3RTrXgTKHcO5AXilpOWitLIuQy6xXuzL7RfeXn2dW6R-ImtLStZKcMqt-Za"
	postdata=
	(
	{
	  "content": "%msg%"
	}
	) ;Use https://leovoel.github.io/embed-visualizer/ to generate above webhook code

	WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
	WebRequest.Open("POST", url, false)
	WebRequest.SetRequestHeader("Content-Type", "application/json")
	WebRequest.Send(postdata)
	return
}