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

  ; +Enter::openAudioRouter()

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

  ; --- IL VST Host

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

  ; --- Ground Control

  openGroundControlMedia() {
    ; send, #6

    appLauncher("GroundControl", path("GroundControl"))

    MODE := getGroundControlMode()

    groundControlMediaMode(MODE)

    WinMove, A, , 1910, 610, 1000, 482

  }

  getGroundControlMode() {


    MODE=""

    imgPath=img/gc/music.png
    imgPath2=img/gc/menu.png

    ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %imgPath%
    if (ErrorLevel = 2) {
      Msgbox, Could not conduct the search for %imgPath%.
    } else if (ErrorLevel = 1) {
      ; Msgbox, %imgPath% could not be found on the screen.
      ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %imgPath2%
      if (ErrorLevel = 2) {
        Msgbox, Could not conduct the search for %imgPath2%.
      } else if (ErrorLevel = 1) {
        MODE=Main
      } else {
        MODE=Media
      }
    } else {
      MODE=Main
    }

    return MODE
  }

  groundControlMediaMode(MODE) {
    if (%MODE%=Main) {
      ; MsgBox, tes
      sleep, 400
      imgPath=img/gc/music.png
      ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %imgPath%
      if (ErrorLevel = 2) {
        RES=Could not conduct the search for %imgPath%.
      } else if (ErrorLevel = 1) {
        RES=%imgPath% could not be found on the screen.
      } else {
        Click, %FoundX%, %FoundY%
      }
    }
  }

  ; --- Audio Router

  openAudioRouter() {
    ; appLauncher("AudioRouter", path("AudioRouter"))

    ; sleep, 2000
    ; X=""
    ; Y=""

    ; imgPath=img/ar/se.png
    ; ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, %imgPath%
    ; if (ErrorLevel = 2) {
    ;   Msgbox, Could not conduct the search for %imgPath%.
    ; } else if (ErrorLevel = 1) {
    ;   Msgbox, Could not find %imgPath%.
    ; } else {
    ;   Msgbox, %FoundX% %FoundY%

    ;   X=%FoundX%
    ;   Y=%FoundY%
    ;   ; MouseMove, %FoundX%, %FoundY%
    ; }

    ; MouseMove, %X%, %Y%

    WinActivate, Audio Router

    sleep 1000

    MouseMove, 200, 100

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
