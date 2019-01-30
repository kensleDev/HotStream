

#z::changeVideoMode("Fullscreen")

#c::maximiseWindowed()




RLMenu(choice) {

  if (choice=0) {
    menuResult := menuGen("Rocket League", ["Toggle Video Mode"])
  } else {
    menuResult := choice
  }

  if (menuResult=1) {

  } else if (menuResult=2) {

  } else if (menuResult=3) {

  }

}

; Rocket League

maximiseWindowed() {
  WinSet, Style, -0xC40000, a
  WinMove, a, , 0, 0, 1920, 1080
  return
}


determineIfInGame() {

  Send {Esc}
  Send {Esc}
  Send {Esc}

  inGame=err
  ImageSearch, OutputVarX, OutputVarY, 0, 0, 3840, 1080, img/RLAvatar.png

  if (ErrorLevel = 2) {
    MsgBox Could not conduct the search.
  } else if (ErrorLevel = 1) {
    inGame=true
  } else {
    inGame=false
  }

  return, inGame
}

openVideoSettings(inGame) {
  if (inGame == true) {
    sleep 100
    Click, 943, 576
    sleep 100
    Click, 1100, 330
    sleep 100
    Click, 815, 425
  } else {
    sleep 200
    Click, 136, 824
    sleep 200
    Click, 1107, 316
  }
}

changeVideoMode(mode) {

  WinActivate, ahk_exe RocketLeague.exe

  inGame := determineIfInGame()

  openVideoSettings(inGame)

  sleep 500

  ; currentMode := getCurrentVideoMode()

  ; MsgBox % currentMode

  ; sleep 4000

  if (currentMode == mode) {
    exitSettings()
  } else if (mode == "Borderless") {
    Click, 800, 430
    sleep 200
    Click, 800, 430
    sleep 200
    Click, 815, 500
    ; exitSettings()
  } else if (mode == "Fullscreen") {
      Click, 800, 430
      sleep 200
      Click, 800, 451
      sleep 200
      Click, 815, 500
    ; exitSettings()
  } else {
    MsgBox, There was an error - %mode%
    exitSettings()
  }
}


getCurrentVideoMode() {

  videoMode=video mode err

  WinWaitActive, ahk_exe RocketLeague.exe, , 5
  if ErrorLevel {
    MsgBox, Could not find RL
  } else {
    ; openVideoSettings()
    ImageSearch, OutputVarX, OutputVarY, 0, 0, 3840, 1080, img/videoMode.png

    sleep 2000

    if (ErrorLevel = 2) {
      MsgBox Could not conduct the search.
    } else if (ErrorLevel = 1) {
      videoMode=Fullscreen
    } else {
      videoMode=Borderless
    }

  }
  ; MsgBox % videoMode
  return % videoMode
}


exitSettings() {
  Send {Esc}
}
