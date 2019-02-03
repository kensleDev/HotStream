
; --- Apps



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
        ; MsgBox % app
        uId := %app%
      }

      return uId
    }

  ;--|




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



;--|

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

    Input, Key, L1, {LControl}{RControl}{LAlt}{RAlt}{LShift}{RShift}{LWin}{RWin}{AppsKey}{F1}{F2}{F3}{F4}{F5}{F6}{F7}{F8}{F9}{F10}{F11}{F12}{Left}{Right}{Up}{Down}{Home}{End}{PgUp}{PgDn}{Del}{Ins}{BS}{CapsLock}{NumLock}{PrintScreen}{Pause}
      ; MsgBox, %SingleKey%
      ToolTip,
      If Key=1
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

  ; ---- Menu modifier

    ; #SingleInstance Force

    SC029 & SC029::Return ; The hotkey to use as modifier
    *SC029::Send {Blind}{SC029} ; Send it explicitly when no other key is pressed before letting go, including any modifiers being held

    #If GetKeyState("SC029", "p") ; Autohotkey_L directive for enabling following mappings when key is physically down
      1::
        send, {F13}
      return

      2::
        send, {F14}
      return

      3::
        send, {F15}
      return

      4::
        send, {F16}
      return

      5::
        send, {F17}
      return

      q::
        send, {F18}
      return

      w::
        send, {F19}
      return

      e::
        send, {F20}
      return

      r::
        send, {F21}
      return

      t::
        send, {F22}
      return


    #If

  ;--|

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


