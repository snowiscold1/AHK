#SingleInstance

MVPpopup="|<>0xFCFCFC@0.79$4.X68l4F4nNgW"
FirstTime=0

While(!ok:=FindText(13,172,92,44,0,0,MVPpopup)) {
	if (FirstTime=0)
	{
	TrayTip , FernBot, Waiting For MVP/Mini... , 4 ;show for 4 seconds
	FirstTime++
	}
}

msgbox, yes
ESC::reload