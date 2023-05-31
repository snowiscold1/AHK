Title1 := "BlueStacks"
Title2 := "SoulSlayers"
Title3 := "nurse"

worldmap := [284, 216, 334, 248, "|<>**50$14.0HUCM2b0NU6mR8bm9wXXgQRt1O"] ; button relative & absolute coordinates for WindowTitle1
; the format for title:=(x1,y1,x2,y2)
; the first window getwinpos is always at 0,0,533,331
; the window size for all is always 533,331

worldmap := GenerateCoordinate(worldmap, Title2)
earthmap := GenerateCoordinate(earthmap, Title2)
Unk := GenerateCoordinate(unk, Title2)


while(!ok:=FindText(worldmap[1], worldmap[2], worldmap[3], worldmap[4], 0, 0, worldmap[5]))
{

}
msgbox, ada
return
GenerateCoordinate(var, title) {
    global
    pict := var
    WinGetPos, x, y, w, h, %Title1% ; the title for first window 0,0
    WinGetPos, x2, y2, w2, h2, %title%
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

