#include "NickMovement.agc"


// show all errors
SetErrorMode(2)

// set window properties
SetWindowTitle( "RPG" )
SetWindowSize( 1024, 768, 0 )
SetWindowAllowResize( 1 ) // allow the user to resize the window

// set display properties
SetVirtualResolution( 300, 300 ) // doesn't have to match the window
SetOrientationAllowed( 1, 1, 1, 1 ) // allow both portrait and landscape on mobile devices
SetSyncRate( 30, 0 ) // 30fps instead of 60 to save battery
SetScissor( 0,0,0,0 ) // use the maximum available screen space, no black borders
UseNewDefaultFonts( 1 ) // since version 2.0.22 we can use nicer default fonts

global paused as string = "false"	//Sets up ability to pause
global Player = 0					//Creates Player Variable

SetFolder("/media/NickAnimations/IDLE")
LoadImage(1,"IDLE1.PNG")
Player=CreateSprite(1)				//Creates Player Sprite
SetFolder("/media")

loadPlayerIDLE()

do
	if paused = "false"
		baseWASDMove()
	endif
	
		
	
    sync()
loop
