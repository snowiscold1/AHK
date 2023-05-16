DNWMode:
cKill := 4
currentMinute := A_Min
FileRead, content, %A_WorkingDir%\logfoundbackup2.txt
loop, parse, Content, `n,`r
  {
  lines := A_Index-1
  }
  
if (currentMinute = 41 && cKill < 6) {
msgbox, % ckill
}
return