; --Read Me
; # Audio
;
; |Windows| + |F3| = Open Audio Menu
; - 1 = Setup Audio
; - 2 = PS4 Chat
; - 3 = Restart Audio
; --|

#Include global.ahk


; hotkeys

  +^PgUp::restartVoicemeeter()

  +^PgDn::openWindowsMixer()

; menu



; feature

  setupAudio(view) {

    if (view="gaming") {
      openAndResizeApp("VoiceMeeter", 1920, 0, 1024, 620, 5)
    } else {
      openAndResizeApp("VoiceMeeter", 2287, 0, 1024, 620, 5)
    }

    sleep 500

    openVstHost()

  }

  ; ---

  openVstHost() {

    appLauncher("VST", path("VST"))

    sleep 1000

    setupVstHost()

    WinMove, A, , 2287, 0, 400, 400

    WinActivate, VoiceMeeter

    ; appMover("VST", 2287, 0, 400, 400, 5)

    ; MsgBox, TEST

    ; ImageSearch, OutputVarX, OutputVarY, 0, 0, 3840, 1080, img/vst.png

    ; if (ErrorLevel = 2) {
    ;   MsgBox Could not conduct the search.
    ; } else if (ErrorLevel = 1) {
    ;   WinActivate, %appClass%
    ; } else {
    ;   sleep 200
    ;   setupVstHost()
    ;   appMover("VST", 2287, 0, 400, 400, 5)
    ; }

  }

  setupVstHost() {

    sleep 1300

    Click, 695, 501 Left, Down
    Sleep, 500
    Click, 702, 509 Left, Up
    Sleep, 100

    Click, 31, 18 Left, Down
    Sleep, 100
    Click, 31, 18 Left, Up
    Sleep, 100
    Click, 31, 19, 0
    Click, 31, 20, 0
    Click, 41, 42, 0
    Click, 46, 55, 0
    Click, 62, 87, 0
    Click, 64, 90, 0
    Click, 88, 138, 0
    Click, 100, 161, 0
    Click, 105, 170, 0
    Click, 106, 172, 0
    ; ;
    Sleep, 300
    Click, 283, 168, 0
    Sleep, 100
    Click
    Sleep, 100
    Click
    Click
  }

  ; --

  restartVoicemeeter() {

    WinGet, winid ,, A ; <-- need to identify window A = acitive

    appLauncher("VoiceMeeter", path("VoiceMeeter"))

    sleep 200

    ImageSearch, X, Y, 0, 0, 3840, 1980, img/vmMenu.png

    Click, %X%, %Y%

    sleep 200

    Send {Down}

    sleep 200

    Send {Enter}

    WinActivate ahk_id %winid%

  }

  openWindowsMixer() {
    Send #i
    Sleep 1500
    ; WinMove ApplicationFrameWindow, 0, 0, 300, 300
    SendInput {Raw}mixer
    Sleep 500
    Send {Enter}
    Sleep 500
    Send {Enter}

    sleep 1000

  }


  ; ---

  ; searchAndSelectAudioDevice(firstImage, secondImage) {
  ;   ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, %firstImage%
  ;     sleep 500
  ;     OutputVarX += 600
  ;     sleep 100
  ;     Click, %OutputVarX%, %OutputVarY%

  ;     sleep 100
  ;     SendInput {wheeldown}
  ;     sleep 100
  ;     SendInput {wheeldown}
  ;     sleep 100
  ;     SendInput {wheeldown}
  ;     sleep 100
  ;     SendInput {wheeldown}

  ;     ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, %secondImage%
  ;     sleep 100
  ;     Click, %OutputVarX%, %OutputVarY%

  ;     sleep 1000
  ; }


  ; restartWindowsAudio() {

  ;   openWindowsMixer()

  ;   ;Reset Audio Button
  ;   ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, img/resetAudio.png

  ;   OutputVarX += 10
  ;   OutputVarY += 10
  ;   sleep 50
  ;   Click, %OutputVarX%, %OutputVarY%

  ;   sleep 1000

  ; }



  ; AudioMenu(choice) {
  ;   if (choice="menu") {
  ;     menuResult := menuGen("Audio", ["Setup Audio", "Windows Mixer", "Setup Vst"])
  ;   } else {
  ;     menuResult := choice
  ;   }

  ;   if (menuResult=1) {
  ;     setupAudio("gaming")
  ;   } else if (menuResult=2) {
  ;     openWindowsMixer()
  ;   } else if (menuResult=3) {
  ;     ; setupVstHost()
  ;     openVstHost()
  ;   }

  ; }