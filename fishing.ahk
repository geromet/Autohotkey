#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#p::Pause  ; Win+P Pause
#r::Reload ; Win+R Reload
#s::	   ; Win+S Start


ColorVariation = 6



RodX := 853
RodY := 393




; First throw
Click,down
Sleep, 2000
Click,up	
Sleep,4500

PixelGetColor,color,RodX,RodY ; Set fishing rod color
loop
{
	
	PixelSearch, XO, YO, RodX, RodY,RodX, RodY, Color, ColorVariation ; Check if fishing rod moved
	if (ErrorLevel)
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
		PixelGetColor,color,RodX,RodY ; Set fishing rod color
	}
}
return