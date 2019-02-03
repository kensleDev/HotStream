; --Read Me
; # Scene Switcher
;
; |Windows|Alt| + |q| = Open scene switching menu
; - 1 = Main
; - 2 = BRB
; - 3 = Starting Soon
; - 4 = Main 2
;
; |Windows|Alt| + |w| = Open obs streaming menu
; - 1 = Start Streaming
; - 2 = Stop Streaming
; - 3 = Start Recording
; - 4 = Stop Recording
; --|

#Include global.ahk

; Hotkeys

  ; !#q::SceneSwitchingMenu("menu")
  !#w::ObsMenu("menu")

; Menu

  SceneSwitchingMenu(choice) {

    if (choice="menu") {
      menuResult := menuGen("Scenes", ["Main", "BRB", "Starting Soon", "Main2"])
    } else {
      menuResult := choice
    }

    ; if (menuResult=1) {
    ;   ; obs("scene","main")
    ; } else if (menuResult=2) {
    ;   ; obs("scene", "brb")
    ; } else if (menuResult=3) {
    ;   ; obs("scene", "ss")
    ; } else If (menuResult=4) {
    ;   ; obs("scene", "main2")
    ; }
  }

  ObsMenu(choice) {
    if (choice="menu") {
      menuResult := menuGen("OBS", ["Start Streaming", "Stop Streaming", "Start Recording", "Stop Recording"])
    } else {
      menuResult := choice
    }

    if (menuResult=1) {
      obs("general","startStreaming")
    } else if (menuResult=2) {
      obs("general","stopStreaming")
    } else if (menuResult=3) {
      obs("general","startRecording")
    } else If (Key=4) {
      obs("general","stopRecording")
    }
  }


; Feature

  obs(bank, param) {
    WinGet, winid ,, A ; <-- need to identify window A = acitive

    appLauncher("obs", path("obs"))

    If (bank="general") {
      If (param="startStreaming") {
        hotkeyCombo("ctrl", "5", "50")
      } else if (param="stopStreaming") {
        hotkeyCombo("ctrl", "6", "50")
      } else if (param="startRecording") {
        hotkeyCombo("ctrl", "7", "50")
      } else if (param="stopRecording") {
        hotkeyCombo("ctrl", "8", "50")
      }
      ; sleep 1000
    }

    If (bank="scene") {

      ;Toggle Studio Mode On
      toggleStudioMode()

      sleep 500

      If (param="main") {
        hotkeyCombo("Alt", "1", "50")
      } else if (param="brb") {
        hotkeyCombo("Alt", "2", "50")
      } else if (param="ss") {
        hotkeyCombo("Alt", "3", "50")
      } else if (param="main2") {
        hotkeyCombo("Alt", "4", "50")
      }

      sleep 5000

      transition()

    }

    sleep 2000
    ; Switch back to app
    WinActivate ahk_id %winid%

    Return
  }

  toggleStudioMode() {

    ImageSearch, X, Y, 0, 0, 3860, 1080, img/obsTransition.png

    if (X="") {
      hotkeyCombo("Ctrl", "F11", "50")
    }

    IniRead, studioModeEnabled, settings.ini, obs, studioEnabled

    if (studioModeEnabled=true) {
      IniWrite, false, settings.ini, obs, studioEnabled
    } else {
      IniWrite, true, settings.ini, obs, studioEnabled
    }
  }

  transition() {
    appLauncher("obs", path("obs"))

    ; Transition Scene
    hotkeyCombo("Ctrl", "Enter", "500")

    sleep 1000

    ; Exit Studio Mode
    hotkeyCombo("Ctrl", "F11", "50")
  }

  readyToTransition() {
    ; MsgBox, "finding black"

    readyToGo="no"

    ImageSearch, X, Y, 1320, 580, 1625, 800, img/black.png

    if (X!="") {
      Loop {
        ImageSearch, X, Y, 1320, 580, 1625, 800, img/black.png

        if (X!="") {
          readyToGo="no"
        } else {
          readyToGo="yes"
          transition()
          break
        }
        sleep 500
      }
    } else {
      readyToGo="yes"
      sleep 1000
      transition()
    }

  }




