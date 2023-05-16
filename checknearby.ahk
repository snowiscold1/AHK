#SingleInstance Force
Title:= "BlueStacks"
#Include %A_ScriptDir%\configurenew.ini


IniRead, kill , %A_ScriptDir%\pos.ini, Stats, kill:


While(!ok:=FindText(ConfirmBtnslave[1], ConfirmBtnslave[2], ConfirmBtnslave[3], ConfirmBtnslave[4], 0, 0, ConfirmBtnslave[5]))
{
}
sleep 2000

check:
ControlClick, x509 y272, %Title%,, LEFT, 1, NA

sleep 500
FindText_BindWindow(TitleID)
 while(!ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
{
		 SetTimer, MaxTime, 1000
			 sleep 1000
			 if (WaitingTime=7) {
				 setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
ExitApp
}
}


	{
		
				setTimer, MaxTime, off
				 Tooltip, 
				 WaitingTime=0
				 kill++
				 IniWrite, %kill%,%A_ScriptDir%\pos.ini, Stats, kill:
			CoordMode, Mouse
			X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
			random, randX, x-2, x+2
			random, randY, y-2, y+2
			ControlClick, x%randX% y%randY%, %Title%,, LEFT, 1, NA
			sleep 1000
				 while(ok:=FindText(GhostCap[1], GhostCap[2], GhostCap[3], GhostCap[4], 0.1, 0.1, GhostCap[5]))
				{
				SetTimer, MaxTime, 1000
				sleep 1000
				if (WaitingTime=30) {
					kill--
					IniWrite, %kill%,%A_ScriptDir%\pos.ini, Stats, kill:
					setTimer, MaxTime, off
					Tooltip, 
					WaitingTime=0
					ExitApp
				}

				}
			
				setTimer, MaxTime, off
				Tooltip, 
				WaitingTime=0
			;~ ControlClick, x473 y236, %Title3%,, LEFT, 1, NA ;run location spot btm right
	}
	

Loop {
    cou++
  pic1:=GetPicArr(3, 274, 70, 35)
  Sleep, 1000
  pic2:=GetPicArr(3, 274, 70, 35)
  if ComparePicArr(pic1, pic2, n:=0.001)
  {
 
    CoordMode, tooltip
    tooltip, %cou%,0,0
   if (cou>24){
	ExitApp
      }
	
  }
  else
  {
      pic1:=GetPicArr(3, 274, 70, 35)
      Sleep, 1000
      pic2:=GetPicArr(3, 274, 70, 35)
      if ComparePicArr(pic1, pic2, n:=0.001)
        {
          CoordMode, tooltip
          tooltip, %cou%,0,0
          if (cou>24){
            ExitApp
          }
        }
      else
        {
          ;ControlClick, x513 y272, %Title%,, LEFT, 1, NA
          ExitApp
	
        }
    
    

  }
  pic1:=pic2

}





MaxTime:
			WaitingTime++
			tooltip, %WaitingTime%
			return
			




; Get the RGB value of all the points of the picture to the array
FindText_ShowArea(x:="", y:="", Active_width:="", Active_height:="")
{
  local
  if (x="")
  {
    VarSetCapacity(pt,16,0), DllCall("GetCursorPos","ptr",&pt)
    x:=NumGet(pt,0,"uint"), y:=NumGet(pt,4,"uint")
  }
  x:=Round(x), y:=Round(y), w:=Round(Active_width)  h:=Round(Active_height)
  ;-------------------------
  Gui, _ShowArea_: +AlwaysOnTop -Caption +ToolWindow +Hwndmyid +E0x08000000
  Gui, _ShowArea_: Show, Hide w%w% h%h%
  ;-------------------------
  dhw:=A_DetectHiddenWindows
  DetectHiddenWindows, On
  d:=4, i:=w-d, j:=h-d
  s=0-0 %w%-0 %w%-%h% 0-%h% 0-0
  s=%s%  %d%-%d% %i%-%d% %i%-%j% %d%-%j% %d%-%d%
  WinSet, Region, %s%, ahk_id %myid%
  DetectHiddenWindows, %dhw%
  ;-------------------------
  Gui, _ShowArea_: Show, NA x%x% y%y%
  Loop, 4
  {
    Gui, _ShowArea_: Color, % A_Index & 1 ? "Red" : "Blue"
    Sleep, 500
  }
  Gui, _ShowArea_: Destroy
}

GetPicArr(x, y, w, h)
{
  ListLines, % (lls:=A_ListLines=0?"Off":"On") ? "Off":"Off"
  SetBatchLines, % (bch:=A_BatchLines) ? "-1":"-1"
  FindText_ScreenShot(x, y, x+w-1, y+h-1)
  arr:=[], i:=1
  Loop, % h {
    yy:=y+A_Index-1
    Loop, % w {
      xx:=x+A_Index-1
      , arr[i++]:=FindText_ScreenShot_GetColor(xx, yy)
    }
  }
  SetBatchLines, %bch%
  ListLines, %lls%
  return arr
}

; Check whether all change points in the picture exceed the percentage

ComparePicArr(arr1, arr2, n:=0.3)
{
  diff:=0, diffMax:=Round(arr1.MaxIndex()*n)
  For k,v in arr1
    if (diff+=(arr2[k]!=v))>diffMax
      return, 1
  return, 0
}

Tip(s:="") {
  SetTimer, %A_ThisFunc%, % s="" ? "Off" : -2000
  ToolTip, %s%, 0, 0
}

