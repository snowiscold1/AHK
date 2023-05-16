

Gui, Add, Text,,Base Attack:

Gui, Add, Edit, vbaseAtk,000

Gui, Add, Text,,MainStat:

Gui, Add, Edit, vMainStat,000

Gui, Add, Text,,Bonus AA:

Gui, Add, Edit, vbonusAA,000

Gui, Add, Text,,Atk Inc `%:

Gui, Add, Edit, vAtkIncPerc,000

Gui, Add, Text,,WeaponSize:

Gui, Add, Edit, vWeaponSize,000

Gui, Add, Text,,Size Modifier:

Gui, Add, Edit, vSizeMod,000

Gui, Add, Text,,Element Modifier:

Gui, Add, Edit, vElementMod,000

Gui, Add, Text,,Converter Modifier:

Gui, Add, Edit, vConverterMod,000

Gui, Add, Text,,Element Dmg Increase:

Gui, Add, Edit, vElementDmgInc,000

Gui, Add, Text,,Stats Atk:

Gui, Add, Edit, vStatsAtk,000

Gui, Add, Text,,Race Modifier:

Gui, Add, Edit, vRaceMod,000

Gui, Add, Text,,Penetration:

Gui, Add, Edit, vPenetration,000

Gui, Add, Text,,Hidden Refine Bonus:

Gui, Add, Edit, vHiddenRefineBonus,000

Gui, Add, Text,,Refine Attack:

Gui, Add, Edit, vRefineAtk,000

Gui, Add, Text,,Dmg Increase `%:

Gui, Add, Edit, vDmgIncPerc,000

Gui, Add, Text,,Crit Damage `%:

Gui, Add, Edit, vCritDmgPerc,000

Gui, Add, GroupBox, ym, Critical Damage

Gui, Add, Text, xp+20 yp+20 w100 vCritDmg

Gui, Add, Button, y+30 Default, Calculate

Gui, Show, ,Crit Damage Calc

return

GuiClose:

ExitApp



ButtonCalculate:

Gui, Submit, NoHide
a :=((baseAtk + MainStat *3 + bonusAA )AtklncPerc*WeaponSize*SizeMod*ElementMod*ConverterMod*ElementDmglnc+StatsAtk)
CritDmg := ((((baseAtk + MainStat *3 + bonusAA )AtklncPerc*WeaponSize*SizeMod*ElementMod*ConverterMod*ElementDmglnc+StatsAtk)RaceMod*Penetration*HiddenRefineBonus)+RefineAtk)DmgIncPerc*CritDmgPerc

GuiControl,,Critical Damage,%CritDmg%

return

