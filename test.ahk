#SingleInstance Force
#NoEnv
#Warn
SetBatchLines -1
Gui, Add, Tab3,, Exstra | General | View | Settings
Gui, Tab, 1
Gui, Add, Text,, Sum text in tab1
Gui, Tab, 2
Gui, Add, Text,, sum mur text in tab2
Gui, Tab, 3 ;Everithing under this is in the third tab, View, Unitl a new gui tab number is encontered.
Gui, Add, Text,, An muuur text in tab3
Gui, Show, AutoSize
Return