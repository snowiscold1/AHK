#SingleInstance Force
Title:= "BlueStacks"
DetectHiddenWindows, On
SetTitleMatchMode, 3

StopFollow:
FollowingYou:="|<>**50$13.w7v6MqCCBWAMA666368qCCDXCNy7k"

Loop {
 While(!ok:=FindText(866, 295, 1520, 397, 0.1, 1, FollowingYou))
 {
 }
 {
  CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		MouseClick, L, %x%, %y%
        sleep 1000
       }
}
return
