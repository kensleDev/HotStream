

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



  ; SteamMenu(choice) {
  ;   if (choice="menu") {
  ;     menuResult := menuGen("Steam", ["Main", "Browser", "Friends", "SE", "Google"])
  ;   } else {
  ;     menuResult := choice
  ;   }

  ;   if (menuResult=1) {
  ;     openSteam()
  ;   } else if (menuResult=2) {
  ;     openSteamBrowser()
  ;   } else if (menuResult=3) {
  ;     openSteamFriends("gaming")
  ;   } else if (menuResult=4) {
  ;     openAndMoveSteamBookmark("img/steamSE.png", "StreamElements - Songrequest", 3461, 606, 379, 475)
  ;   } else if (menuResult=5) {
  ;     openAndMoveSteamBookmark("img/steamGE.png", "Google", 2668, 606, 793, 477)
  ;   }
  ; }