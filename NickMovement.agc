global playerSpeed = 5
global IDLE as string = "false"



function baseWASDMove()
	if GetRawKeyState(87) = 1
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)-playerSpeed)
	endif
	if GetRawKeyState(83) = 1
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)+playerSpeed )
	endif
	if GetRawKeyState(65) = 1
		SetSpritePosition(Player,GetSpriteX(Player)-playerSpeed ,GetSpriteY(Player))
	endif
	if GetRawKeyState(68) = 1
		SetSpritePosition(Player,GetSpriteX(Player)+playerSpeed ,GetSpriteY(Player))
	endif

	
	if GetRawKeyState(87) = 0 and GetRawKeyState(83) = 0 and GetRawKeyState(65) = 0 and GetRawKeyState(68) = 0
		IDLE = "true"
	else
		IDLE = "false"
	endif

	if GetRawKeyPressed(87) and IDLE = "false"
		StopSprite(Player)
		loadPlayerUP()
	elseif GetRawKeyPressed(83)	and IDLE = "false"
		StopSprite(Player)
		loadPlayerDOWN()
	elseif GetRawKeyPressed(65)	and IDLE = "false"
		StopSprite(Player)
		loadPlayerLEFT()
	elseif GetRawKeyPressed(68) and IDLE = "false"
		StopSprite(Player)
		loadPlayerRIGHT()
	elseif IDLE = "true"
		StopSprite(Player)
		loadPlayerIDLE()
	endif
	
	if GetRawKeyState(65) = 1 and GetRawKeyState(68) = 1
		StopSprite(Player)
		loadPlayerIDLE()
	endif
	if GetRawKeyState(87) = 1 and GetRawKeyState(83) = 1
		StopSprite(Player)
		loadPlayerIDLE()
	endif
endfunction



function loadPlayerIDLE()	//Loads images for IDLE Animation
	ClearSpriteAnimationFrames(Player)
	SetFolder("/media/NickAnimations/IDLE")
	AddSpriteAnimationFrame(Player,LoadImage("IDLE1.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("IDLE2.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("IDLE3.PNG"))
	SetFolder("/media")
	PlaySprite(Player)
endfunction

function loadPlayerDOWN()	//Loads images for DOWN Animation
	ClearSpriteAnimationFrames(Player)
	SetFolder("/media/NickAnimations/DOWN")
	AddSpriteAnimationFrame(Player,LoadImage("DOWN1.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("DOWN2.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("DOWN3.PNG"))
	SetFolder("/media")
	PlaySprite(Player)
endfunction

function loadPlayerUP()		//Loads images for UP Animation
	ClearSpriteAnimationFrames(Player)
	SetFolder("/media/NickAnimations/UP")
	AddSpriteAnimationFrame(Player,LoadImage("UP1.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("UP2.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("UP3.PNG"))
	SetFolder("/media")
	PlaySprite(Player)
endfunction

function loadPlayerLEFT()	//Loads images for LEFT Animation
	ClearSpriteAnimationFrames(Player)
	SetFolder("/media/NickAnimations/LEFT")
	AddSpriteAnimationFrame(Player,LoadImage("LEFT1.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("LEFT2.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("LEFT3.PNG"))
	SetFolder("/media")
	PlaySprite(Player)
endfunction

function loadPlayerRIGHT()		//Loads images for RIGHT Animation
	ClearSpriteAnimationFrames(Player)
	SetFolder("/media/NickAnimations/RIGHT")
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT1.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT2.PNG"))
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT3.PNG"))
	SetFolder("/media")
	PlaySprite(Player)
endfunction

