;list of important functions i made
Title1 := "MainChar"
Title2 := "hitter"

worldmap := [284, 216, 334, 248, "|<>**50$14.0HUCM2b0NU6mR8bm9wXXgQRt1O"] ; button relative & absolute coordinates for WindowTitle1




ClickCoord(x, y, sleep := 500, customTitle := "") {
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    ControlClick, x%x% y%y%, %TitleToUse%,, LEFT, 1, NA
    Sleep, %sleep%
    return
}


ClickCoordWhenFound(var, coordinateX:="", coordinateY:="", delay:=500, customTitle:="") {
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    while !(ok := FindText(var[1], var[2], var[3], var[4], 0, 0, var[5])) {
        Sleep, 100
    }

    X := ok.1.x
    Y := ok.1.y
    WinGetPos, WinX, WinY, WinWidth, WinHeight, %TitleToUse%
    realX := X - WinX
    realY := Y - WinY
    if (coordinateX = "")
        coordinateX := realX
    if (coordinateY = "")
        coordinateY := realY
    ControlClick, x%coordinateX% y%coordinateY%, %TitleToUse%,, LEFT, 1, NA
    Sleep, %delay%
    return
}

ClickCoordWhenGone(var, coordinateX:="", coordinateY:="", delay:=500, customTitle:="") {
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    while (ok := FindText(var[1], var[2], var[3], var[4], 0, 0, var[5])) {
        Sleep, 100
    }

    X := ok.1.x
    Y := ok.1.y
    WinGetPos, WinX, WinY, WinWidth, WinHeight, %TitleToUse%
    realX := X - WinX
    realY := Y - WinY
    if (coordinateX = "")
        coordinateX := realX
    if (coordinateY = "")
        coordinateY := realY
    ControlClick, x%coordinateX% y%coordinateY%, %TitleToUse%,, LEFT, 1, NA
    Sleep, %delay%
    return
}

GenerateCoordinate(var, customTitle:="") { ; title would be the new window to generate
    global
    pict := var
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle


    WinGetPos, x, y, w, h, %Title% ; the title for first window 0,0
    WinGetPos, x2, y2, w2, h2, %TitleToUse%
    offsetX := x2 - x
    offsetY := y2 - y
    ; Calculate the absolute coordinates for the button in the specified window
    x1 := offsetX + var[1]
    y1 := offsetY + var[2]
    x2 := offsetX + var[3]
    y2 := offsetY + var[4]
    image := var[5]

    var := [x1, y1, x2, y2, image]
    return var
}

checkstatus(list, customTitle := "") {
; this function is to check whether any var is found in list:="1,2,3,4" and return the value of A_Index. usage example :-
;result := checkstatus(list, Title1)
;Loop % result.Length()
;{
;    MsgBox, % "Found element: " result[A_Index]
;}
Loop % result.Length()
{
    MsgBox, % "Found element: " result[A_Index]
}
    if (customTitle = "")
        TitleToUse := Title
    else
        TitleToUse := customTitle

    WinGetPos, x, y, w, h, %TitleToUse% ; Fetch the window position outside the loop

    foundElements := [] ; Create an empty array to store the found elements

    Loop, parse, list, `,
    {
        if (ok := FindText(x, y, w+x, h+y, 0, 0, %A_LoopField%[5]))
        {
            foundElements.Push(A_LoopField) ; Add the found element to the array
        }
    }

    if (foundElements.Length() > 0)
        return foundElements ; Return the array of found elements
    else
        return 0 ; Return 0 if no elements are found
}

checkwholescreenandclick(var) {
if(ok:=FindText(0, 0, 1600, 900, 0, 0, var))
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
return
}
