ControlDrag(PID, button, x1, y1, hold1, x2, y2, hold2)
{
    ; Get the window handle.
    WinGet, hwnd, ID, ahk_pid %PID%

    ; Convert the coordinates to screen coordinates.
    VarSetCapacity(pt, 8, 0)
    NumPut(x1, pt, 0, "Int")
    NumPut(y1, pt, 4, "Int")
    DllCall("ClientToScreen", "Ptr", hwnd, "Ptr", &pt)
    x1 := NumGet(pt, 0, "Int")
    y1 := NumGet(pt, 4, "Int")
    NumPut(x2, pt, 0, "Int")
    NumPut(y2, pt, 4, "Int")
    DllCall("ClientToScreen", "Ptr", hwnd, "Ptr", &pt)
    x2 := NumGet(pt, 0, "Int")
    y2 := NumGet(pt, 4, "Int")

    ; Send the drag messages.
    SendMessage, 0x201, button = "R" ? 2 : 1,, x1 | (y1 << 16),, ahk_id %hwnd%  ; WM_LBUTTONDOWN or WM_RBUTTONDOWN
    Sleep, hold1
    SendMessage, 0x200, 0, 0, x2 | (y2 << 16),, ahk_id %hwnd%  ; WM_MOUSEMOVE
    Sleep, hold2
    SendMessage, 0x202, button = "R" ? 2 : 1,, x2 | (y2 << 16),, ahk_id %hwnd%  ; WM_LBUTTONUP or WM_RBUTTONUP
}

; Use the function.
ControlDrag(17404, "L", 273, 127, 3000, 273, 327, 5000)
