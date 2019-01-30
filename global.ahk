; --Read Me
; # Global
;
; |Function| hotkeyCombo(modifer, key, delay)
; - Send a modifer + normal key with a delay time
;
; |Function| appLauncher(app, path, minimize)
; - Open app or activate if already open with the option to minimise the window
;
; |Function| sendActiveWindowToBack()
; - Send Active window to the back
;
; |Function| switchBackHotkey(hotkey, app)
; - Switch to app execute hotkey and switch back to the orginal app
; - Relies on app shortcut to be in C:\Users\kd\Documents\Shortcuts
; - Currently supports, SLOBS, Voicemeter, Resanance
; --|


#Include shared/toolTip.ahk

CoordMode, ToolTip, Screen

; Global Hotkeys

  ^+r:: ; press control+r to reload
    Msgbox, Do you really want to reload this script?
    ifMsgBox, Yes
      Reload
    return
  return



; Global Funcs

  ; shortcut name must be the same as the app name


  ; ---- Menus

    menuGen(title, menuItems) {
      ToolTipFont("s35", "Calibri Light")
      ToolTipColor("Black", "White")

      MouseGetPos, MouseX, MouseY

      MouseMove, 700, 250, 0

      title := "--| " title " |--`n"

      for key, value in menuItems
        s .= "(" key "): " value "`n"

      ToolTip % s

      Input Key, L1
        ToolTip,
        If Key=F1
          return 1
        Else If Key=2
          return 2
        Else If Key=3
          return 3
        Else If Key=4
          return 4
        Else If Key=5
          return 5
        Else If Key=6
          return 6
        Else If Key=7
          return 7
        Else If Key=8
          return 8
        Else If Key=9
          return 9
      Return

      MouseMove, %MouseX%, %MouseY%, 0

    }

  ;--|


  ; Keypad launcher
    #SingleInstance Force

    global mode=0

    F12 & F12::Return ; The hotkey to use as modifier
    *F12::Send {Blind}{F12} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

    #If GetKeyState("F12", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down
      PrintScreen::
        global mode=1
        tooltiper(mode)
      return

      ScrollLock::
        global mode=2
        tooltiper(mode)
      return

      Pause::
        global mode=0
        tooltiper(mode)
      return
    #If

    #if (mode = 0)
      PrintScreen::PrintScreen
      ScrollLock::Send {ScrollLock}
      Pause::Send {Pause}

      Insert::Send {Insert}
      Home::Send {Home}
      PgUp::Send {PgUp}

      Del::Send {Del}
      End::Send {End}
      PgDn::Send {PgDn}
    #if

    #if (mode = 1)
      PrintScreen::Send, {F13}
      ScrollLock::Send, {F14}
      Pause::Send, {F15}

      Insert::#1
      Home::#2
      PgUp::#3

      Del::#4
      End::#5
      PgDn::#6
    #if

    ^Insert::Send #1
    ^Home::Send #2
    ^PgUp::Send #3
    ^Del::Send #4
    ^End::Send #5
    ^PgDn::Send #6

    tooltiper(mode) {
      ToolTip % mode
      sleep 500
      ToolTip
    }


  ;--|


  ; --- Apps

    appLauncher(app, path) {

      SetTitleMatchMode, 2

      appClass := appNameToClass(app)

      IfWinExist, %appClass%
        winactivate %appClass%
      else {
        Run % path
      }
    }

    appMover(app, x, y, w, h, timeout) {
      className := appNameToClass(app)

      WinWaitActive, %className%, , %timeout%
        if ErrorLevel {
          MsgBox, Could not find %app% window.
        } else {
          WinMove, %className%, , x, y, w, h
        }
    }

    openAndResizeApp(app, x, y, w, h, timeout) {
      appLauncher(app, path(app))
      appMover(app, x, y, w, h, timeout)
    }

    taskBarLauncher(appName) {

      confirmedAppNum=""

      Loop 9 {

        app := "app" A_Index

        IniRead, %app%, settings.ini, apps, %app%

        if(appName=%app%) {
          confirmedAppNum=%A_Index%
          break
        } else {
          confirmedAppNum="error"
        }
      }

      if (confirmedAppNum="error") {
        MsgBox, "Could not find app in settings.ini"
      } else {
        Send #%confirmedAppNum%
      }


    }

  ;--|


  ; --- Converters

    path(app) {
      path=C:\Users\kd\Documents\Shortcuts\
      newPath=%path%%app%
      ; MsgBox % newPath
      return %newPath%
    }

    appNameToClass(app) {
      if (app="OBS") {
        uId := "ahk_class Qt5QWindowIcon"
      } else if (app="VoiceMeeter") {
        uId := "VoiceMeeter"
      } else if (app="VST") {
        ;uId := "Minihost Modular 64bit"
        uId := "ahk_exe MiniHostModular_x64.exe"
      } else if (app="Edge") {
        uId := "ahk_class ApplicationFrameWindow ahk_exe ApplicationFrameHost.exe"
      } else if (app="Chat") {
        uId := "ahk_exe RestreamChat.exe"
      } else if (app="PS4") {
        uId := "PS4 Remote Play"
      } else if (app="steam") {
        uId := "Steam"
      } else if (app="Discord") {
        uId := "Discord"
      } else if (app="Messenger") {
        uId := "Messenger for Desktop"
      } else {
        MsgBox, "not in the bank yet"
      }

      return uId
    }

  ;--|


  ; --- Active Window

    sendActiveWindowToBack(){
      MouseGetPos, ,, OutputVarWin
      WinSet Bottom,, ahk_id %OutputVarWin%
      MouseGetPos, ,, OutputVarWin
      WinActivate ahk_id %OutputVarWin%
    }

    getActiveWindowTitle() {
      WinGetActiveTitle, Title
      WinActivate, %Title%
      WinRestore, %Title%

      return %Title%
    }

  ;--|


  ; --- Image Search

    imgSearchAndClick(imgPath) {
      CoordMode Pixel  ; Interprets the coordinates below as relative to the screen rather than the active window.
      ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %imgPath%
      RES=""
      DUMMY=""

      if (ErrorLevel = 2) {
        DUMMY=Could not conduct the search.
      } else if (ErrorLevel = 1) {
        DUMMY=%imgPath% could not be found on the screen.
      } else {
        ; MsgBox The icon was found at %FoundX%x%FoundY%.
        ; RES=%FoundX%|%FoundY%
        Click, %FoundX%, %FoundY%
      }
    }

  ;--|






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