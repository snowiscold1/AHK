#SingleInstance Force
Chat := "|<>*136$21.zszzy2DzW1zscDy8VzW17kU4Q80F00153i4sTsz7z7sTsz1y7s70z0E7s00zU07U"
Confirm := "|<>**50$52.00001k000zk00B00061U01g000HuzTzzzzvNy7FlDSMt0HgvQriNg1SrgnSfakB/GnBGeN3oh/AZ+dqPGogmIeZDBvGn9GeL3sR/AZ+dDwzQzzriy"
firstrun = 1

Loop {
While(!ok:=FindText(354, 275, 392, 341, 0, 0, Chat))
	{
	}
{
	sleep 500
		ControlClick, x364 y410, BlueStacks,, LEFT, 1, NA 
		sleep 500
		
}	
sleep 500
while(!ok:=FindText(411, 236, 531, 274, 0,0, Confirm))
		{
		}
		
		{
		CoordMode, Mouse
		X:=ok.1.x, Y:=ok.1.y, Comment:=ok.1.id
		ControlClick, x%x% y%y%, BlueStacks,, LEFT, 1, NA
		sleep 500
		}
		
if (firstrun=1) {
			yourmessage := "Someone opened a chat room, lol"
			gosub Telegram
		}
		firstrun++		
		
if (firstrun=15) {
			yourmessage := "Your Bluestacks client has been closed"
			gosub Telegram
			WinClose, BlueStacks
		}
		firstrun++		

}

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