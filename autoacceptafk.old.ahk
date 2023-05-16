#SingleInstance Force
Title:= "BlueStacks"
DetectHiddenWindows, On
SetTitleMatchMode, 3
;Run %A_ScriptDir%/autosuicideRift.bug.ahk ahk_class AutoHotkey
accept:="|<>**40$26.Q0Y08aPzqWefIheepcYehFzDjsU|<>**50$24.M0U0WNixcWcIhWcpW2coTXnwU|<>**50$25.008003jz60K+/0/BI05a9y3CUU|<>**50$30.Q0k00WU0ms4U1MIAUnEqWU4EkTVvTDU|<>**50$31.007s0CU6oLgNlOnRvghOqxq6hPW/3KhTzzzzk|<>**50$29.00002107Dp0+f2C0FYAE0W8Ey1zDjU|<>**50$29.00002107Dp0+f2C0FYAE0W8Ey1zDjU|<>**50$30.00D00vzv/yfAHFHupzJhypfIhX5fIhzzzzzU|<>**40$21.0100MCzs5JMAft0FacQ7zU|<>**50$22.M202Af+eee+eegiUeBSBnTU|<>**40$22.U002t2RNM6ZxU+09WOc|<>**50$27.E0404F4c0eeg6hp0U5m850g"




Loop {
 While(!ok:=FindText(0, 0, 1598, 898, 0, 0, accept))
 {
 }
  CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		MouseClick, L, %x%, %y%
        sleep 1000
        /*
  If(ok:=FindText(0, 0, 1598, 898, 0, 0, confirm))
 {
  CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		MouseClick, L, %x%, %y%
 } 
 */
 
}
return

^Q::ExitApp




