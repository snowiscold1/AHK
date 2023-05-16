#SingleInstance Force
DetectHiddenWindows, On
SetTitleMatchMode, 3

#Include %A_ScriptDir%\configurenew.ini





;Run %A_ScriptDir%/autosuicideRift.bug.ahk ahk_class AutoHotkey
accept:="|<acceptpt>**50$27.A0000H4c2eeg0Zp5UZW8g0fw0M2U|<onboard>**50$31.A1k020Y3Nl945LIhWee9q9IF4WwHqSSU|<confirmb>**50$30.00CE0MzvTzpZNKdhNfKpjNfKplJfKoTzzzzU|<pawzodiac>0xFAFAF9@1.00$18.0Q00Q00Q0E0As0Cs0CM040000k03w07y37y77y77y27y03y01s0U|<confirm>**50$30.007k0S0BE0nzvzzj4PG3epfKhipfKhX5fKhzzzzzU|<>**50$20.k00302cc1O/0o28FIA3TU|<>0xF9F9F9@1.00$12.0Q0Q0QM0s0s0M0001s3w7y7y7y7y7y3y1sU|<>*123$23.C00w00D03nw0TzyTys3avU3E8A6UXoQ0TVs3z3m7y7UDwD8TsSMzkwBzVs7z3k7y7UDwCU|<>**50$26.003U8zviGYlWoerKh8XJhSgJXBzzzvk005U001kU|<>**50$30.00Dk0TtzLyphNTdjFfKphtfKppJfKoTzzzzU|<>**50$24.003Uy02UXzyzh5MhWrKpexKrj48vzzzy000K000QU|<>**50$24.M0U0WNixcWcIhWcpW2coTXnwU|<>**50$25.z01EEzzjvF65h+xOihqhpO8Eqzzzu000D00074"






settings:="|<>**50$18.0T00v0DlwAla806A06QT6wzbknVUlVkvXQz7AC68068UaDly7nw0T0U"

  
silentsouls:="|<>*106$49.zTzzzzzzlfzxyDzrnpW6CSBf4uqBTCGpD5E6jtROlmdnLy6hS3K1gsMkcE"  
evilspirit:="|<>*111$40.zxzzxxwDyzzrqrhPl3JFSpjQZBgPKwHJqrXPwBLP3Bj4BRXzzznzzzzzzTzzU"
magicarray:="|<>*110$51.zzzjzzzzzzzxzzzzz0MkgS8eBX/oZDw4yhPMCfy1i5fOkZTYBqlPMEgS1i6TzzbzzzzrzzVzzzzyw"
trialdemon:="|<>*113$46.zbzzzzzzxzrzzzzslsNWQEz9T9Oah9xpxo/OkbnLnLhfKTXTV2qlNzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzkU|<>*104$18.yTz3zwCEkCKY2KgCKgCKkU"
negotiate:="|<>*109$41.zzzzbzzzzzvzry6AMXFW9fKYgxNXEhRN2k6jOGmpbBW6C4AVzzjzzzzzsTzzzw"
gheim:="|<>**50$40.lTypjzyR60KWUPK/h2WrjKupffHZ2NKmh7zzxzzzU"

  
 
   
Loop {
 While(!ok:=FindText(0, 0, 1598, 898, 0, 0, accept)) ; all
 {
 }

if(ok:=FindText(2, 31, 528, 331, 0, 0, accept)) ; bluestacks
 {
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
 }
	
	
if(ok:=FindText(533, 32, 1061, 326, 0, 0, accept)) ;nurse
 {
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
 }
	
if(ok:=FindText(1072, 32, 1590, 326, 0, 0, accept)) ;adel
 {
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
 }

if(ok:=FindText(1, 362, 527, 656, 0, 0, accept)) ;soulslayers
 {
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
 }
 
if(ok:=FindText(1068, 363, 1598, 659, 0, 0, accept)) ; sundalmalam
 {
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
 }
 
 if(ok:=FindText(534, 364, 1062, 658, 0, 0, accept)) ; mintabuff/darragnarok
 {
		CoordMode, Mouse
        X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		hWnd := DllCall("WindowFromPoint", UInt64, x|(y << 32), Ptr)
		hParent := DllCall("GetAncestor", Ptr, hWnd, UInt, GA_ROOT := 2, Ptr)
		WinGetTitle, title, ahk_id %hParent%
		WinGetPos, posX , posY , Width, Height, %Title%
		X:=ok.1.x-(posX), Y:=ok.1.y-(posY), Comment:=ok.1.id
		ControlClick, x%x% y%y%, %Title%,, LEFT, 1, NA 
 }
 
	
sleep 500
	
	
	
 
}
return







Esc::Reload
^Q::ExitApp









WinActivate, % "ahk_id" DllCall("WindowFromPoint", Int,500, Int,500 )
WinGetTitle, title, A
;~ msgbox, % title
WinGetPos, X, Y, Width, Height, %Title%
msgbox, %x% %y% %width% %height% %title%