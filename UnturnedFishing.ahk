#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Pause::Pause  ; The Pause/Break key.
#p::Pause  ; Win+P

^F10::
loop
{
	PixelSearch, XO, YO, 845, 712, 930, 770, 0x481213, 32, Fast
	if (!ErrorLevel)
	{
		loop,10
		{
		Click
		sleep,10
		}
		Sleep,2700
		Click,down
		Sleep, 2000
		Click,up
		Sleep,4500
	}
}
return