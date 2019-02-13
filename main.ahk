SetWinDelay,-1
SetDefaultMouseSpeed, 0
CoordMode, ToolTip, Screen
; CoordMode, Mouse, Screen
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, force
#InstallKeybdHook

; #Include %A_ScriptDir%\features\obs.ahk
#Include %A_ScriptDir%\features\audio.ahk
#Include %A_ScriptDir%\features\gaming.ahk
#Include %A_ScriptDir%\features\game.ahk
#Include %A_ScriptDir%\features\discord.ahk
