#SingleInstance Force
setTimer, tferror, 1000


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
#Persistent
setTimer, deletelog, 3600000



return

tferror:
WinWait, TF Lib Error
ControlClick, OK, TF Lib Error

run botschmitzcheck.ahk ahk_class AutoHotkey

return


deletelog:

FileDelete, %A_ScriptDir%\log.txt
FileDelete, %A_ScriptDir%\botschmitz_zahey\log.txt
FileDelete, %A_ScriptDir%\botschmitz_zahey\log2.txt
FileDelete, %A_ScriptDir%\botschmitz12oc\log.txt


if (A_Hour = 06 )
{
IniWrite, 0,%A_ScriptDir%\pos.ini, Music, prevamt:
IniWrite, 0,C:\Users\snowi\Desktop\AHK\botschmitz_client\pos.ini, Music, prevamt:
IniWrite, 0,C:\Users\snowi\Desktop\AHK\botschmitz_client\pos.ini, Music, prevamt:
}


return