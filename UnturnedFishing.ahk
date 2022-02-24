#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Pause::Pause
Reload::Reload

#p::Pause  ; Win+P Pause
#r::Reload ; Win+R Reload
#s::	   ; Win+S Start

; First throw
Click,down
Sleep, 2000
Click,up
Sleep,4500

PixelGetColor,color,790,712 ; Set fishing rod color
loop
{
	
	PixelSearch, XO, YO, 823, 710,826 , 860, color, 35 ; Check if fishing rod moved
	if (!ErrorLevel)
	{
		loop,5 ; Single click doesn't reel in for some reason
		{
		Click
		sleep,10
		}
		
		Sleep,2700 ; Wait while reeling
		Click,down ; Start throw
		Sleep, 2000 ; Wait to fill bar
		Click,up ; Throw
		Sleep,4500 ; Wait while throwing
		PixelGetColor,color,784,715 ; Set fishing rod color
	}
}
return