#SingleInstance Force
Title:= "BlueStacks"
WinMove, %Title%,,0,0, 533, 341	
DetectHiddenWindows, On
SetTitleMatchMode, 3
;Run %A_ScriptDir%/autosuicideRift.bug.ahk ahk_class AutoHotkey
Ress := "|<>**50$23.PU015zkyeA1A5b2vOtJrIOfvsRz|<>**50$30.y0000XzVzzhAgKNcpgpbeSgoLh4UqMzzzzzU|<>*141$23.0001zzzy8iIJXRvfuvrN4LnU|<>**50$32.S0007AzxzzGuhIeoWBRNRfmFKN/zzzzyU|<>**50$21.S006BnUUnWRodHUhaQhTHaV37zxzU"
Counts := 0

Gui, +AlwaysOnTop +ToolWindow -SysMenu -Caption
Gui, Color, CCCCCC
;~ Gui, Font, cFF0000 s15 , verdana ;red
;Gui, Font, c000000 s7 , verdana ;black
Gui, Font, cFFFFFF s7 , verdana  ;white
FormatTime, MyTime,, hh:mm:ss tt
Gui, Add, Text, y0 BackgroundTrans, Start Time = %mytime%
Gui, Add, Text, vCounter x8 y10 BackgroundTrans, Total Death(s) = %Counts%00000
Gui, Show, NoActivate x5 y148,uptime  ; screen position here
WinSet, TransColor, CCCCCC 255,uptime
SetTimer, RefreshD, 1000




Loop {
 While(!ok:=FindText(417, 286, 509, 320, 0, 0, Ress))
 {
 }
 Counts++
  CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
        sleep 1000 
}
return


RefreshD:
GuiControl, , Counter, Total Death(s) = %Counts%
return

^O:: msgbox, You have died %Counts% times since %myTime%