#SingleInstance Force
DetectHiddenWindows, On
SetTitleMatchMode, 2
SetWorkingDir %A_ScriptDir%
Title := "MainChar"
Title2 := "nurse"
file := "data.txt"
WinGet, TitleID, ID, %Title%
WinGet, Title2ID, ID, %Title2%
toclose =  %A_ScriptDir%\voidprisondopple.ahk

while WinExist(toclose)
{
    WinClose, %toclose% ahk_class AutoHotkey
}

monitoring:
exchangeskill:=[426, 283, 532, 327,"|<exchangeskill>**30$30.3UG1k73nksC208QA008ARG086M20M6E10E2lG003m608Hq84+HoQ46HrMA5HrsA2vpkC0vrES1TPUP0qN0H0KU|<>#123@0.91$17.3z07y07w4Ds0zk1zlbrWDjUST1wT7syDVyz1zw3zs3w"]
securitycode:=[228, 153, 306, 181,"|<>*226$20.s20Cxnjhd+nOSiqre"]
cancelbutton:=[112, 596, 176, 622,"|<>*166$22.zzzsTzzbqdgw/C9ogPc"]
FindText_BindWindow(Title2ID)

loop{
if FileExist(file) {
	command := TF_ReadLines(file,1,1,1)
	if (!command){
	sleep 2000
	}
	else
		;gosub, %command%
		break
}
}

array := StrSplit(command, ",") ; split the string by comma
item_name := array[1] ; get the first element of the array
expiry_time := array[2] ; get the second element of the array

; Use RegExReplace to remove the hyphens and colons
newTimestamp := RegExReplace(expiry_time, "[-: ]", "")
; Remove the "+00:00" part
newTimestamp := SubStr(newTimestamp, 1, 14)
EnvAdd, newTimeStamp, -5, Minutes

; Start a timer that checks every second
SetTimer, CheckTime, 1000
Return

CheckTime:

; Compare the current time to the timestamp
if (A_Now > newTimestamp)
{
    ; If the current time has passed the timestamp, show a MsgBox and stop the timer
    SetTimer, CheckTime, Off
    goto snapping
}


return

Snapping:
FindText_BindWindow(Title2ID)
exchangeskill:= GenerateCoordinate(exchangeskill, Title2)
while (!ok := FindText(exchangeskill[1], exchangeskill[2], exchangeskill[3], exchangeskill[4], 0, 0, exchangeskill[5])) {
   ClickCoord(510,303, , Title2) ;switch skill bar
    sleep 500
}
sleep 1000
ClickCoordWhenFound(exchangeskill,,,,Title2)
sleep 3000
ClickCoord(91,96, , Title2) ;search item
sleep 500
ClickCoord(276,105, , Title2) ;enter item name
sleep 500
SetKeyDelay, 250
ControlSend, ,%item_name%, %Title2%
sleep 500
ClickCoord(391,105, , Title2) ;search item
sleep 500
ClickCoord(391,105, , Title2) ;search item
sleep 500
ClickCoord(255,144, , Title2) ;click on 1st item found
sleep 2000
ClickCoord(248,115, , Title2) ;click on the item
sleep 1000
ClickCoord(446,302, , Title2) ;click on the buy button
sleep 500
ClickCoord(202,202, , Title2) ;click on the number
sleep 500
ControlSend, ,9999, %Title2% ;quantity
sleep 500
ClickCoord(202,202, , Title2) ;click on the number
sleep 500
ClickCoord(224,285, , Title2) ;click on the buy button confirm
sleep 1000
securitycode:= GenerateCoordinate(securitycode, Title2)

if (ok := FindText(securitycode[1], securitycode[2], securitycode[3], securitycode[4], 0, 0, securitycode[5])) {
   ClickCoord(261,168, , Title2) ;enter code
   sleep 500
   SetKeyDelay, 100
   ControlSend, ,900218A, %Title2% ;security code
   sleep 500
   ClickCoord(267,196, , Title2) ;enter code
   sleep 1000
   ClickCoord(267,196, , Title2) ;enter code
   sleep 1000
}

if (ok := FindText(cancelbutton[1], cancelbutton[2], cancelbutton[3], cancelbutton[4], 0, 0, cancelbutton[5])) {
   ClickCoord(148,280, , Title2) ;cancel button
    sleep 1000
}

ClickCoord(476,48, , Title2) ;close the exchange
sleep 1000
if (ok := FindText(exchangeskill[1], exchangeskill[2], exchangeskill[3], exchangeskill[4], 0, 0, exchangeskill[5])) {
   ClickCoord(514,306, , Title2) ;switch skill bar
    sleep 1000
}
log(item_name " has been snapped at " expiry_time)
gosub removeline

if (running == 1) {
IfWinNotExist, %toclose%
	run %toclose% ahk_class AutoHotkey
}

goto monitoring
return


removeline:
; Read the file
FileRead, content, %file%
; Find and remove the line
StringReplace, content, content, %command%`r`n, , All
; Overwrite the file with the updated content
FileDelete, %file%
FileAppend, %content%, %file%
return




log(msg) {
    global oArrayText
    Critical, On
    try {
        sendError(msg)
        FormatTime, TimeString, A_Now, yyyyMMdd HH:mm:ss
        controlgettext, Console, Edit2, Fern Bot ahk_class AutoHotkeyGUI

        Loop, parse, Console, `n, `r
        {
            i++
            nc := TF_ReadLines(Console, A_Index, A_Index, 1)
            oArrayText.push(nc)
            if (i >= 100)
                break
        }

        str := ""
        for each, line in oArrayText
        {
            If (str <> "") ; str is not empty, so add a line feed
                str .= "`r`n"
            str .= line
        }

        logEntry := TimeString " - " msg
        str := logEntry "`r`n" str

        controlsettext, Edit2, %str%, Fern Bot ahk_class AutoHotkeyGUI

        if oArrayText.MinIndex() != ""  ; Not empty.
            oArrayText.Delete(oArrayText.MinIndex(), oArrayText.MaxIndex())

        Critical, Off
        return
    }
    catch e {
        return
    }
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


}



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



