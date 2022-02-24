#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include Gdip_All.ahk
DetectHiddenWindows, On


#p::Pause  ; Win+P Pause
#r::Reload ; Win+R Reload
#s::	   ; Win+S Start

WinGet, hwnd, ID, Unturned
ColorVariation = 34

pBitmap:=Gdip_BitmapFromHWND(hwnd)
color:=Gdip_GetPixel(pBitmap, x, y)



SysGet, VirtualWidth, 78
SysGet, VirtualHeight, 79
RodX = 784 * (VirtualWidth/1920)
RodY = 715 * (VirtualHeight/1080)
SearchStartX = 823 * (VirtualWidth/1920)
SearchStartY = 710 * (VirtualHeight/1080)
SearchSizeX = 3 * (VirtualWidth/1920)
SearchSizeY = 150 * (VirtualHeight/1080)

; First throw
Click,down
Sleep, 2000
Click,up
Sleep,4500

PixelGetColor,color,RodX,RodY ; Set fishing rod color
loop
{
	
	PixelSearch, XO, YO, SearchStartX, SearchStartY,SearchStartX + SearchSizeX , SearchSizeY + SearchStartY, Color, ColorVariation ; Check if fishing rod moved
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
		PixelGetColor,color,RodX,RodY ; Set fishing rod color
	}
}
return