
#Include global.ahk
#Include features/audio.ahk

; hotkeys

  F13::GamingMenu("menu")


; menu

  GamingMenu(choice) {

    if (choice="menu") {
      menuResult := menuGen("Gaming", ["Gaming", "Streaming", "Remote Play"])
    } else {
      menuResult := choice
    }

    if (menuResult=1) {
      view("gaming")
    } else if (menuResult=2) {
      view("streaming")
    } else if (menuResult=3) {
      openRemotePlayStream()

      ; toggleSteamStreamElements()
    }

  }

  SteamMenu(choice) {
    if (choice="menu") {
      menuResult := menuGen("Steam", ["Main", "Browser", "Friends", "SE", "Google"])
    } else {
      menuResult := choice
    }

    if (menuResult=1) {
      openSteam()
    } else if (menuResult=2) {
      openSteamBrowser()
    } else if (menuResult=3) {
      openSteamFriends("gaming")
    } else if (menuResult=4) {
      openAndMoveSteamBookmark("img/steamSE.png", "StreamElements - Songrequest", 3461, 606, 379, 475)
    } else if (menuResult=5) {
      openAndMoveSteamBookmark("img/steamGE.png", "Google", 2668, 606, 793, 477)
    }
  }

 ; -----

  view(view) {
    MouseMove, 1920, 0
    ToolTip, Setting up %view% view
    BlockInput, Off

    ; openSteamFriends(view)

    setupAudio(view)

    openAndResizeApp("Discord", 2900, 0, 940, 607, 5)
    WinMinimize, Discord

    openAndResizeApp("Messenger", 2936, 0, 904, 613, 5)

    if (view="streaming") {
      openChat()
      openAndResizeApp("Messenger", 3303, 0, 537, 613, 5)
      openAndResizeApp("OBS", 2974, 564, 876, 526, 5)
    } else {
      openAndResizeApp("Messenger", 2936, 0, 904, 613, 5)
    }
    ; --


    ; openAndMoveSteamBookmark("img/steamSE.png", "StreamElements - Songrequest", 3461, 606, 379, 475)

    ; openAndMoveSteamBookmark("img/steamGE.png", "Google", 2668, 606, 793, 477)

    openSteamFriends(view)


    ; moveWindows(view)

    BlockInput, On
    ToolTip

  }

  ; --

  moveWindows(view) {

    if (view="gaming") {
      WinMinimize, ahk_exe chrome.exe

      WinMove, ahk_exe voicemeeterpro.exe, , 1920, 0, 1024, 620

      WinMove, ahk_exe steamwebhelper.exe, , 1920, 616, 1064, 463

      WinMove, PS4 Remote Play, , 2900, 616, 820, 465

      WinMove, Messenger for Desktop, , 2980, 0, 869, 527

      WinMove, ahk_exe obs64.exe, , 2974, 564, 876, 526

      WinMinimize, ahk_exe Discord.exe

      WinActivate, ahk_exe voicemeeterpro.exe

      openSteamAndFriends(view)

    }

    if (view="streaming") {

      WinMinimize, ahk_exe chrome.exe

      WinMove, ahk_exe voicemeeterpro.exe, , 2287, 0, 1024, 620

      ; WinMove, ahk_exe Discord.exe, , 2900, 0, 940, 584

      WinMove, ahk_exe steamwebhelper.exe, , 2287, 616, 697, 463

      WinMove, PS4 Remote Play, , 2900, 616, 820, 465



       WinMove, Messenger for Desktop, , 2930, 0, 919, 626

      ; WinMove, ahk_exe ApplicationFrameHost.exe, , 1913, 406, 697, 680

      WinMove, ahk_exe obs64.exe, , 2974, 564, 876, 526

      WinMove, ahk_exe RestreamChat.exe, , 1920, 0, 367, 1080

      ; --

      WinMinimize, ahk_exe Discord.exe

      WinActivate, ahk_exe voicemeeterpro.exe

      openSteamAndFriends(view)

    }

  }


  ; --- App functions

    ; --- Browser

      ; openAndResizeApp("edge", 1913, 406, 990, 680, 5)

      setupBrowserForStream() {

        appLauncher("edge", path("edge"))

        sleep 2000

        Title := getActiveWindowTitle()

        WinMove, %Title%, , 1920, 0, 1031, 1079

        pasteURLIntoNewEdgeWindow("https://streamelements.com/dashboard/mediarequest/general")

        Title := getActiveWindowTitle()

        WinMove, %Title%, , 2948, 0, 900, 522

        Return
      }

      pasteURLIntoCurrentEdgeWindow(path) {
        send ^l
        sleep 2000
        send ^v
        sleep 500
        send {Enter}
      }

      pasteURLIntoNewEdgeWindow(path) {
        Clipboard := path

        Send ^n
        sleep 2000
        send ^w
        sleep 500
        send ^w
        sleep 2200
        send ^l
        sleep 500
        send ^l
        sleep 2000
        send ^v
        sleep 500
        send {Enter}
      }

    ; ---

    ; --- Steam

      openSteam() {
        openAndResizeApp("Steam", 1920, 0, 940, 1069, 656)
      }

      openSteamAndFriends(view) {

        openAndResizeApp("Steam", 1920, 0, 1069, 656, 5)

        WinWaitActive, Steam, , 5
        if ErrorLevel {
          openSteamAndFriends(view)
        } else {
          WinMinimize, Steam
          openSteamFriends(view)
        }

      }

      openSteamFriends(view) {
        Run, steam://open/friends/

        WinWaitActive, ahk_exe steamwebhelper.exe, , 5
        if ErrorLevel {
          ; MsgBox, WinWait timed out.
        } else {
          if (view="gaming") {
            WinMove, ahk_exe steamwebhelper.exe, , 1920, 606, 753, 476
          } else {
            WinMove, ahk_exe steamwebhelper.exe, , 2287, 606, 753, 476
          }
        }
      }

      openSteamBrowser() {

        openAndResizeApp("Steam", 1920, 0, 1069, 656, 5)

        homepage=open https://custeam.io/

        WinWaitActive, Steam, , 2
        if ErrorLevel {
          MsgBox, Steam not open
        } else {
          click, 0, 0

          click, 562, 56

          sleep 200

          ; click, 281, 621

          ; sleep 200

          send % homepage

          sleep 200

          send, {enter}

        }
      }

      openAndMoveSteamBookmark(image, app, x, y, w, h) {

          openSteamBrowser()

          sleep 4000

          ImageSearch, OutputVarX, OutputVarY, 0, 0, 3840, 1080, %image%

          if (ErrorLevel = 2) {
            MsgBox Could not conduct the search.
          } else if (ErrorLevel = 1) {
            MsgBox Could not find the icon.
          } else {
            Click, %OutputVarX%, %OutputVarY%

            WinWaitActive, %app%, , 5
            if ErrorLevel {
              MsgBox, Could not find %app%
            } else {
              WinMove, %app%, , %x%, %y%, %w%, %h%
            }
          }

          WinMinimize, Steam

      }

      showSteamStreamElements() {

        WinActivate, StreamElements - Songrequest

      }

    ; ---

    ; --- Remote Play

      openRemotePlayStream() {
        inputIsRemotePlayOn()
      }

      inputIsRemotePlayOn() {
        InputBox, ps4On, Is Ps4 On, y/n

        if (ps4On="y") {
          openRemotePlay()
        } else if (ps4On="") {
          openRemotePlay()
        } else if (ps4On="n") {
          MsgBox, Bye!
          return
        } else {
          MsgBox, Not valid, Bye!
          return
          ; MsgBox, Not valid, try again!
          ; inputIsRemotePlayOn()
          ; return
        }
      }

      openRemotePlay() {
        appLauncher("PS4", path("PS4"))

        sleep 2000

        WinActivate, PS4 Remote Play

        ; WinWaitActive, PS4 Remote Play, , 5
        ; if ErrorLevel {
        ;   MsgBox, WinWait timed out.
        ; } else {
        ;   WinMove, ahk_exe Discord.exe, , 1920, 0, 940, 690
        ; }

        ; Click start buitton
        ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, img/remotePlayStart.png
        Click, %OutputVarX%, %OutputVarY%

        sleep 9000

        WinMove, PS4 Remote Play, , 2900, 625, 820, 465


      }

      maximizeRemotePlay() {
        ; Focus remote play
        click, 50, 50
        sleep 500
        WinActivate, PS4 Remote Play

        ; Click Mic
        ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, img/remotePlayMic.png
        OutputVarX += 30
        OutputVarY += 30
        Click, %OutputVarX%, %OutputVarY%

        sleep 500

        ; ;Click Max
        ImageSearch, OutputVarX, OutputVarY, 0, 0, 1920, 1080, img/remotePlayMax.png
        OutputVarX += 30
        OutputVarY += 30
        Click, %OutputVarX%, %OutputVarY%

        sleep 1000

        Send {Up}
        sleep 1000
        Send {Up}
        sleep 3000
      }

    ; ---

    ; --- Streaming

      openChat() {
        ; appLauncher("Chat", path("Restream Chat"))
        ; ahk_exe RestreamChat.exe
        ; ; open chat - HACK
        Send #6

        sleep 4000

        WinMove, ahk_exe RestreamChat.exe, , 1920, 0, 370, 1080
      }

    ; ---

  ; --|



