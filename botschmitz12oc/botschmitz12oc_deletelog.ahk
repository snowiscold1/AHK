#SingleInstance Force

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

deletelog:

FileDelete, %A_ScriptDir%\log.txt
if (A_Hour = 06 )
{
IniWrite, 0,%A_ScriptDir%\pos.ini, Music, prevamt:
}



return