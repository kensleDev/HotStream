#Include global.ahk

; ---hotkeys

F14::SEMediaMenu("menu")

F15::SceneSwitchingMenu("menu")

+`::openOverlay()



; ---functions

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

SEMediaMenu(choice) {
  if (choice="menu") {
    menuResult := menuGen("SE - Media", ["Play", "Pause", "skip", "queue again", "Get next", "Get Current"])
  } else {
    menuResult := choice
  }

  if (menuResult=1) {
    sendDicordInGameCommand("!play", true)
  } else if (menuResult=2) {
    sendDicordInGameCommand("!pause", true)
  } else if (menuResult=3) {
    sendDicordInGameCommand("!skip", true)
  } else if (menuResult=4) {
    sendDicordInGameCommand("!back", true)
  } else if (menuResult=5) {
    sendDicordInGameCommand("!next", false)
  } else if (menuResult=6) {
    sendDicordInGameCommand("!current", false)
  }

}

openOverlay() {
  send, +'
  sleep 400
  send, ^a
  sleep 400
  send, {Backspace}
  send, {Backspace}

}

sendDicordInGameCommand(command, showMenu) {
  send, +'
  sleep 500

  send, ^a
  sleep 500

  send, {BackSpace}

  MouseGetPos, MouseX, MouseY

  imgSearchAndClick("img/jcc.png")

  imgSearchAndClick("img/disChat.png")

  sendraw, %command%

  sleep 200

  Send {Enter}

  Send {Enter}

  sleep 500

  send, ^a
  send, {BackSpace}

  if (showMenu=false) {
    send, +'
  }

  MouseMove, %MouseX%, %MouseY%

}