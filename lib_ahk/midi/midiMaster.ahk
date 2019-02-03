#Include %A_ScriptDir%\shared\midi.ahk

Run, "C:\Users\kd\Documents\Shortcuts\Controller Editor"

midi := new Midi()
midi.OpenMidiIn( 1 )
; MsgBox Midi Open!
Return


; ------------OBS Nav

	MidiNoteOnCSharp0:
		; updateCurrentNote("SS1")
		obs("general","startRecording")
	Return

; ------------Scene Switching

	MidiNoteOnC0:
		obs("scene","main")
	Return

	MidiNoteOnD0:
		obs("scene","brb")
	Return

	MidiNoteOnE0:

		obs("scene","ss")
	Return

	MidiNoteOnF0:

		obs("scene","main2")
	Return

	MidiNoteOnG0:
		obs("scene","credits")
	Return

	MidiNoteOnA0:

	Return

	MidiNoteOnB0:

	Return

	MidiNoteOnC1:

	Return
;--|

; ------------App Launching
	MidiNoteOnD1:
		Send #1
	Return

	MidiNoteOnE1:
		Send #2
	Return

	MidiNoteOnF1:
		Send #3
	Return

	MidiNoteOnG1:
		Send #4
	Return

	MidiNoteOnA1:
		Send #5
	Return

	MidiNoteOnB1:
		Send #6
	Return

	MidiNoteOnC2:
		Send #7
	Return

	MidiNoteOnD2:
		Send #8
	Return


;--|

; ------------Collection Switching
	; MidiNoteOnF1:
	; 	changeToCollectionSystem("rl", "ps4")
	; Return

	; MidiNoteOnG1:
	; 	changeToCollectionSystem("rl", "pc")
	; Return
;--|

updateCurrentNote(note) {

	FILEPATH=C:\Dev\AHK\HotStream\settings.ini
	IniRead, CURRENT_NOTE, %FILEPATH%, bus, currentNote

	if (note != %CURRENT_NOTE%) {
		CURRENT_NOTE=%note%
		IniWrite, %CURRENT_NOTE%, %FILEPATH%, bus, currentNote
	}



}


#Include %A_ScriptDir%\features\obs.ahk
