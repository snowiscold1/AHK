#SingleInstance Force
Title:= "BlueStacks"
Title2:= "nurse"
Title3:= "ADEL"
Title4:= "SoulSlayers"
Title5:= "sundalmalam"


WinMove, %Title%,,0,0, 800, 491
WinMove, %Title2%,,800,0, 800, 491
WinMove, %Title3%,,0,491, 533,341 
WinMove, %Title4%,,533,491, 533,341 
WinMove, %Title5%,,1066,491, 533,341 
DetectHiddenWindows, On
SetTitleMatchMode, 3

Get := "|<GetCardbutton>**50$21.0073y0ssLxqzX2jvhpjRgjMRYvTjkMCPzzzU"
Get2 := "|<GetCardbutton2>**50$14.T3gTiyPjOvLj6RTzs"
pm := "|<PMchat>0xBA35C6@0.82$16.007nMMhVwu76cMEV006"
getcard :="get,get2,pm,crash,restart"
crash :="|<>**50$60.zk0000003kks0000002ErM0000002ErDxzzzzzyTrQD5cwRACNrRataPgtqHkrqxjThvqaqy6hjQAuGArNqxjPgvqar/atjPgtqHpY75jMAgCNwzzxzzzbvz003t0000000027000000003y000000U"
restart :="|<>*75$34.2AEvW1fbb6qqWCROP2yNUXh8ta2aqXDvjvU"


Loop{
while(!checkcard(getcard))
{
}

Loop, parse, getcard, `,
{
    if(ok:=FindText(1, 42, 435, 828, 0.1, 0.5, %A_LoopField% ))
   {
	gosub, %A_LoopField%
   }
}

}
return



checkcard(getcard){
Loop, parse, getcard, `,
{
    if(ok:=FindText(1, 42, 435, 828, 0.1, 0.1, %A_LoopField% ))
	return 1
}

}


get:

 if(ok:=FindText(1, 42, 435, 828, 0.1, 0., Get))
 {
 Card++
   CoordMode, Mouse
   X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
   ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA 
   sleep 1000
  }
  return

get2:

 if(ok:=FindText(1, 42, 435, 828, 0.1, 0.1, Get2))
 {
 Card++
   CoordMode, Mouse
	X:=ok.1.x, Y:=ok.1.y-(491), Comment:=ok.1.id
	ControlClick, x%X% y%Y%, %Title3%,, LEFT, 1, NA
   sleep 1000
   
 }
return

crash:

 if(ok:=FindText(1, 42, 435, 828, 0.1, 0.1, crash))
 {
  crashed++
  if (crashed<2)
  {
  		yourmessage := "Client crashed, please restart"
        
		gosub Telegram
   sleep 10000
  }
  
  }
 
return

restart:

 if(ok:=FindText(1, 42, 435, 828, 0.1, 0.1, restart))
 {
  tooltip, restarting
  shutdown, 6
 }
 
return



pm:

if(ok:=FindText(1, 42, 435, 828, 0.1, 0.1, pm))
 {
  sendmessage++
  if (sendmessage<2)
  {
		yourmessage := "You received a PM!"
        
		gosub Telegram
   sleep 10000
  }
 }
return

Telegram:

chatid := "386200179" ; replace XXXXXXX with your chat_id
text := % yourmessage
param := "chat_id=" chatid "&text=" text
str =https://api.telegram.org/bot1134651420:AAHbBefCJ_y6WFvno_L5vFfuwQ_HPzRgOik/sendmessage? ; replace XXXXXXX with your API token

;msgbox, % url_tovar(str, param) ; this is useful if you need to return data

url_tovar(str, param)

url_tovar(URL, param) { 
    WebRequest := ComObjCreate("WinHttp.WinHttpRequest.5.1")
    WebRequest.Open("POST", URL)
	WebRequest.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded")
    WebRequest.Send(param)
    res := WebRequest.ResponseText
    return res
}
return


^C:: msgbox, Card drop %Card%