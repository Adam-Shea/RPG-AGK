global playerSpeed = 4		//Player movement speed
global animationSpeed = 5	//Player animation fps
global animationIDLESpeed as float = 10	//Player animation fps
global startFrame = 1		//Starting frame for animations
global endFrame = 3			//Ending frame for animations
global NickMovementTextures as string = "false"	//Tells system if textures are loaded in

function baseWASDMove()	//Controls WASD movement
	if GetRawKeyState(87) = 1		//W
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)-playerSpeed)	//Player Up
		startFrame = 8
		endFrame = 11
	endif
	if GetRawKeyState(83) = 1	//S
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)+playerSpeed )	//Player Down
		startFrame = 4
		endFrame = 7
	endif
	if GetRawKeyState(65) = 1	//A
		SetSpritePosition(Player,GetSpriteX(Player)-playerSpeed ,GetSpriteY(Player))	//Player Left
		startFrame = 12
		endFrame = 15
	endif
	if GetRawKeyState(68) = 1	//D
		SetSpritePosition(Player,GetSpriteX(Player)+playerSpeed ,GetSpriteY(Player))	//Player Right
		startFrame = 16
		endFrame = 19
	endif
	
	if GetRawKeyState(87) = 0 and GetRawKeyState(83) = 0 and GetRawKeyState(65) = 0 and GetRawKeyState(68) = 0	//Works out if player is IDLE
		IDLE as string = "true"
		startFrame = 1
		endFrame = 1
	else
		IDLE = "false"
	endif
	
	
	//Stops animations from clashing
	if GetRawKeyState(87) = 1 and GetRawKeyState(83) = 1 and GetRawKeyState(65) = 0 and GetRawKeyState(68) = 0	//If LEFT and RIGHT pressed play IDLE
		startFrame = 1
		endFrame = 3
	elseif GetRawKeyState(65) = 1 and GetRawKeyState(68) = 1 and GetRawKeyState(87) = 0 and GetRawKeyState(83) = 0 //If LEFT and RIGHT pressed play IDLE
		startFrame = 1
		endFrame = 3
	elseif GetRawKeyState(65) = 1 and GetRawKeyState(68) = 1 and GetRawKeyState(87) = 1 and GetRawKeyState(83) = 1 //If LEFT and RIGHT pressed play IDLE
		startFrame = 1
		endFrame = 3
	elseif GetRawKeyState(65) = 1 and GetRawKeyState(68) = 1 and GetRawKeyState(87) = 1 //If LEFT and RIGHT and UP pressed play UP 
		startFrame = 8
		endFrame = 11
	elseif GetRawKeyState(65) = 1 and GetRawKeyState(68) = 1 and GetRawKeyState(83) = 1 //If LEFT and RIGHT and DOWN pressed play DOWN
		startFrame = 4
		endFrame = 7
	endif
	
	//Controls animation player
	if GetSpriteCurrentFrame(Player) > endFrame and IDLE = "false" or GetSpriteCurrentFrame(Player) < startFrame and IDLE = "false"	//If currect frame is bigger than end frame or if current frame is more than the max frame
		StopSprite(Player)	//Stop animation
		PlaySprite(Player,animationSpeed,1,startFrame,endFrame)	//Play sprite from the start and end of set animations
	endif



	if GetSpriteCurrentFrame(Player) > endFrame and IDLE = "true" or GetSpriteCurrentFrame(Player) < startFrame and IDLE = "true"	//Controls IDLE animation speed
		StopSprite(Player)	//Stop animation
		chanceOfIDLE = random(1,2)
		if chanceOfIDLE = 2
			startFrame = 1
			endFrame = 3
		endif
		PlaySprite(Player,animationIDLESpeed,1,startFrame,endFrame)
		startFrame = 1
		endFrame = 1
		chanceOfIDLE = random(1,2)
	endif
	
	

endfunction

function loadPlayerIDLE()	//Loads images for IDLE Animation
	ClearSpriteAnimationFrames(Player)
	SetFolder("/media/NickAnimations/IDLE")



	SetFolder("/media/NickAnimations/DOWN")	//Loads in frames
	DOWN1 = LoadImage("DOWN1.PNG")
	DOWN2 = LoadImage("DOWN2.PNG")
	DOWN3 = LoadImage("DOWN3.PNG")

	SetFolder("/media/NickAnimations/IDLE")
	IDLE1 = LoadImage("IDLE1.PNG")
	IDLE2 = LoadImage("IDLE2.PNG")
	IDLE3 = LoadImage("IDLE3.PNG")

	SetFolder("/media/NickAnimations/UP")
	UP1 = LoadImage("UP1.PNG")
	UP2 = LoadImage("UP2.PNG")
	UP3 = LoadImage("UP3.PNG")

	SetFolder("/media/NickAnimations/LEFT")
	LEFT1 = LoadImage("LEFT1.PNG")
	LEFT2 = LoadImage("LEFT2.PNG")
	LEFT3 = LoadImage("LEFT3.PNG")

	SetFolder("/media/NickAnimations/RIGHT")
	RIGHT1 = LoadImage("RIGHT1.PNG")
	RIGHT2 = LoadImage("RIGHT2.PNG")
	RIGHT3 = LoadImage("RIGHT3.PNG")

	SetImageMinFilter(DOWN1, 0)	//Turns antialiasing off for all textures
	SetImageMagFilter(DOWN1, 0)
	SetImageMinFilter(DOWN2, 0)
	SetImageMagFilter(DOWN2, 0)
	SetImageMinFilter(DOWN3, 0)
	SetImageMagFilter(DOWN3, 0)

	SetImageMinFilter(IDLE1, 0)
	SetImageMagFilter(IDLE1, 0)
	SetImageMinFilter(IDLE2, 0)
	SetImageMagFilter(IDLE2, 0)
	SetImageMinFilter(IDLE3, 0)
	SetImageMagFilter(IDLE3, 0)

	SetImageMinFilter(UP1, 0)
	SetImageMagFilter(UP1, 0)
	SetImageMinFilter(UP2, 0)
	SetImageMagFilter(UP2, 0)
	SetImageMinFilter(UP3, 0)
	SetImageMagFilter(UP3, 0)

	SetImageMinFilter(LEFT1, 0)
	SetImageMagFilter(LEFT1, 0)
	SetImageMinFilter(LEFT2, 0)
	SetImageMagFilter(LEFT2, 0)
	SetImageMinFilter(LEFT3, 0)
	SetImageMagFilter(LEFT3, 0)

	SetImageMinFilter(RIGHT1, 0)
	SetImageMagFilter(RIGHT1, 0)
	SetImageMinFilter(RIGHT2, 0)
	SetImageMagFilter(RIGHT2, 0)
	SetImageMinFilter(RIGHT3, 0)
	SetImageMagFilter(RIGHT3, 0)

	SetSpriteImage(Player,IDLE1)	//Spawn animation


	
	
	AddSpriteAnimationFrame(Player,IDLE1)	//1
	AddSpriteAnimationFrame(Player,IDLE2)	//2
	AddSpriteAnimationFrame(Player,IDLE3)	//3
	
	AddSpriteAnimationFrame(Player,DOWN1)	//4
	AddSpriteAnimationFrame(Player,DOWN2)	//5
	AddSpriteAnimationFrame(Player,DOWN3)	//6
	AddSpriteAnimationFrame(Player,DOWN1)	//7
	
	AddSpriteAnimationFrame(Player,UP1)	//8
	AddSpriteAnimationFrame(Player,UP2)	//9
	AddSpriteAnimationFrame(Player,UP3)	//10
	AddSpriteAnimationFrame(Player,UP1)	//11

	AddSpriteAnimationFrame(Player,LEFT1)	//12
	AddSpriteAnimationFrame(Player,LEFT2)	//13
	AddSpriteAnimationFrame(Player,LEFT3)	//14
	AddSpriteAnimationFrame(Player,LEFT2)	//15

	AddSpriteAnimationFrame(Player,RIGHT1)	//16
	AddSpriteAnimationFrame(Player,RIGHT2)	//17
	AddSpriteAnimationFrame(Player,RIGHT3)	//18
	AddSpriteAnimationFrame(Player,RIGHT2)	//19
	
	
	
	SetFolder("/media")
	SetSpriteScale(Player,1,1)
	NickGhostMovementTextures = "false"
	NickMovementTextures = "true"

endfunction
