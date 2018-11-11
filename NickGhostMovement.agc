global ghostFloatDistance as float = 3	//Maximum travel distance for ghost float
global ghostFloatCurrentDistance as float = 0	//Current float distance
global ghostFloatSpeed as float = 0.5

global NickGhostMovementTextures as string = "false"	//Tells system if textures are loaded in

function ghostController()
	if GetRawKeyState(87) = 1		//W
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)-playerSpeed)	//Player Up
		SetSpriteImage(Player,ghostUPAnimation)
	endif
	if GetRawKeyState(83) = 1	//S
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)+playerSpeed )	//Player Down
		SetSpriteImage(Player,ghostDOWNAnimation)
	endif
	if GetRawKeyState(65) = 1	//A
		SetSpritePosition(Player,GetSpriteX(Player)-playerSpeed ,GetSpriteY(Player))	//Player Left
		SetSpriteImage(Player,ghostLEFTAnimation)
	endif
	if GetRawKeyState(68) = 1	//D
		SetSpritePosition(Player,GetSpriteX(Player)+playerSpeed ,GetSpriteY(Player))	//Player Right
		SetSpriteImage(Player,ghostRIGHTAnimation)
	endif
	
	if GetRawKeyState(87) = 0 and GetRawKeyState(83) = 0 and GetRawKeyState(65) = 0 and GetRawKeyState(68) = 0	//Works out if player is IDLE
		SetSpriteImage(Player,ghostDownAnimation)
	endif
	
	if GetRawKeyState(65) = 1 and GetRawKeyState(68) = 1	//Stops animation clashing
		SetSpriteImage(Player,ghostDownAnimation)
	endif
	
	
	
	if ghostFloatCurrentDistance <> ghostFloatDistance
		SetSpritePosition(Player,GetSpriteX(Player),GetSpriteY(Player)+ghostFloatSpeed)
		ghostFloatCurrentDistance = ghostFloatCurrentDistance+ghostFloatSpeed
	endif
	
	if ghostFloatCurrentDistance = ghostFloatDistance
		ghostFloatDistance = ghostFloatDistance * -1
		ghostFloatSpeed = ghostFloatSpeed * -1
	endif


	
endfunction

global ghostDOWNAnimation = 0	//Hold DOWN Animation
global ghostLEFTAnimation = 0	//Hold LEFT Animation
global ghostRIGHTAnimation = 0	//Hold RIGHT Animation
global ghostUPAnimation = 0		//Hold UP Animation

function loadGhostTexture()
	ghostFloatCurrentDistance = 0	//Current float distance
	SetFolder("/media/GhostAnimations")
	ghostDOWNAnimation = LoadImage("DOWN.PNG")
	ghostLEFTAnimation = LoadImage("LEFT.PNG")
	ghostRIGHTAnimation = LoadImage("RIGHT.PNG")
	ghostUPAnimation = LoadImage("UP.PNG")
	SetFolder("/media")
	SetSpriteScale(Player,2,1)
	NickGhostMovementTextures = "true"
	NickMovementTextures = "false"
endfunction
