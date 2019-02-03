
#Include shared/toolTip.ahk
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


  ; hotkeyCombo(modifer, key, delay) {
  ;   Send {%modifer% down}
  ;   Send {%key% down}

  ;   Sleep %delay%
  ;   Send {%key% up}
  ;   Send {%modifer% Up}
  ; }



  ; plainAppLauncher(app) {
  ;   SetTitleMatchMode, 2 ; approximate match
  ;   IfWinExist, - Microsoft Word
  ;   {
  ;     WinActivate, - Micrsoft Word
  ;   }
  ;   IfWinNotExist, - Microsoft Word
  ;   {
  ;     Run FullFilePathToMicrosoftWord
  ;   }
  ;   return
  ; }

  ;   switchBackHotkey(hotkey, app) {

  ;   WinGet, winid ,, A ; <-- need to identify window A = acitive

  ;   if (app = "OBS")
  ;     appLauncher("Streamlabs OBS", "C:\Users\kd\Documents\Shortcuts\StreamlabsOBS")
  ;   else if (app = "VM")
  ;     appLauncher("VoiceMeeter", "C:\Users\kd\Documents\Shortcuts\VoiceMeeter")
  ;   else if (app = "SOUND")
  ;     appLauncher("Resanance", "C:\Users\kd\Documents\Shortcuts\Resanance")

  ;     sleep 1000

  ;   Send, %hotkey%

  ;   WinActivate ahk_id %winid%
  ; }



  ;  ; Keypad launcher
  ;   #SingleInstance Force

  ;   global mode=0

  ;   F12 & F12::Return ; The hotkey to use as modifier
  ;   *F12::Send {Blind}{F12} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

  ;   #If GetKeyState("F12", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down
  ;     PrintScreen::
  ;       global mode=1
  ;       tooltiper(mode)
  ;     return

  ;     ScrollLock::
  ;       global mode=2
  ;       tooltiper(mode)
  ;     return

  ;     Pause::
  ;       global mode=0
  ;       tooltiper(mode)
  ;     return
  ;   #If

  ;   #if (mode = 0)
  ;     PrintScreen::PrintScreen
  ;     ScrollLock::Send {ScrollLock}
  ;     Pause::Send {Pause}

  ;     Insert::Send {Insert}
  ;     Home::Send {Home}
  ;     PgUp::Send {PgUp}

  ;     Del::Send {Del}
  ;     End::Send {End}
  ;     PgDn::Send {PgDn}
  ;   #if

  ;   #if (mode = 1)
  ;     PrintScreen::Send, {F13}
  ;     ScrollLock::Send, {F14}
  ;     Pause::Send, {F15}

  ;     Insert::#1
  ;     Home::#2
  ;     PgUp::#3

  ;     Del::#4
  ;     End::#5
  ;     PgDn::#6
  ;   #if

  ;   tooltiper(mode) {
  ;     ToolTip % mode
  ;     sleep 500
  ;     ToolTip
  ;   }


    ; taskBarLauncher(appName) {

    ;   confirmedAppNum=""

    ;   Loop 9 {

    ;     app := "app" A_Index

    ;     IniRead, %app%, settings.ini, apps, %app%

    ;     if(appName=%app%) {
    ;       confirmedAppNum=%A_Index%
    ;       break
    ;     } else {
    ;       confirmedAppNum="error"
    ;     }
    ;   }

    ;   if (confirmedAppNum="error") {
    ;     MsgBox, "Could not find app in settings.ini"
    ;   } else {
    ;     Send #%confirmedAppNum%
    ;   }


    ; }

  ; ;--|
