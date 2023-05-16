#SingleInstance Force
Title:= "BlueStacks"
Title2:= "nurse"
Title3:= "ADEL"
Title4:= "SoulSlayers"
Title5:= "sundalmalam"
Menu, Tray, Icon, %A_ScriptDir%\icon.ico
WinMove, %Title%,,0,0, 800, 491
WinMove, %Title2%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 
DetectHiddenWindows, On
SetTitleMatchMode, 3

^R::

Loop,{
movemap(682,287)
sleep 4000
demonicfire(274,289)
lifemerge()
;lifepsych()
sleep 500
hellplant(458,263)
demonicfire(391,239)
movemap(691,289)
sleep 5000
hellplant(441,327)
movemap(673,286)
sleep 5000
hellplant(366,307)
movemap(682,287)
sleep 4000
demonicfire(430,362)
cartboost()

}


^T::

Loop,{

movemap(680,288)
sleep 2000

movemap(672,288)
sleep 2000

movemap(680,288)
sleep 4000

movemap(693,288)
sleep 4000
}
;@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
hellplant(posX,posY) {
	global
		ControlClick, x481 y459, %Title%,, LEFT, 1, NA
		sleep 500
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA
		sleep 1000
		
}


demonicfire(posX,posY) {
	global
		ControlClick, x539 y462, %Title%,, LEFT, 1, NA
		sleep 500
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA
		sleep 1500
		
}

crazyweed(posX,posY) {
	global
		ControlClick, x780 y462, %Title%,, LEFT, 1, NA 
		sleep 500
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA
		sleep 1000
		
}


lifemerge() {
	global
		ControlClick, x663 y459, %Title%,, LEFT, 1, NA		
		sleep 1000
}


cartboost() {
	global
		ControlClick, x601 y460, %Title%,, LEFT, 1, NA		
		sleep 1000
}


lifepsych() {
	global
		ControlClick, x727 y460, %Title%,, LEFT, 1, NA		
		sleep 1000
		
}



movemap(posX,posY) {
	global
		ControlClick, x%posX% y%posY%, %Title%,, LEFT, 1, NA 
		return
}


Esc::Reload
        