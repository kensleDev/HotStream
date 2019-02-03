
#Include lib_ahk/toolTip.ahk
#Include %A_ScriptDir%\lib_ahk\utils.ahk


CoordMode, ToolTip, Screen

; Global Hotkeys

  ^+r:: ; press control+r to reload
    Msgbox, Do you really want to reload this script ya?
    ifMsgBox, Yes
      Reload
    return
  return

  ^Insert::Send #1
  ^Home::Send #2
  ^PgUp::Send #3
  ^Del::Send #4
  ^End::Send #5
  ^PgDn::Send #6

