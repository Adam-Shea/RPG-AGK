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
	
	SetParticlesPosition(GhostParticle,GetSpriteX(Player)+20,GetSpriteY(Player)+42)
	
	
endfunction

global ghostDOWNAnimation = 0	//Hold DOWN Animation
global ghostLEFTAnimation = 0	//Hold LEFT Animation
global ghostRIGHTAnimation = 0	//Hold RIGHT Animation
global ghostUPAnimation = 0		//Hold UP Animation
global ghostParticleImage = 0
global GhostParticle = 0

function loadGhostTexture()
	ghostFloatCurrentDistance = 0	//Current float distance
	SetFolder("/media/GhostAnimations")
	ghostDOWNAnimation = LoadImage("DOWN.PNG")
	ghostLEFTAnimation = LoadImage("LEFT.PNG")
	ghostRIGHTAnimation = LoadImage("RIGHT.PNG")
	ghostUPAnimation = LoadImage("UP.PNG")
	ghostParticleImage = LoadImage("ghostdust.PNG")
	SetFolder("/media")
	SetSpriteScale(Player,2,1)
	NickGhostMovementTextures = "true"
	NickMovementTextures = "false"
	
	SetImageMinFilter(ghostDOWNAnimation, 0)
	SetImageMagFilter(ghostDOWNAnimation, 0)
	SetImageMinFilter(ghostLEFTAnimation, 0)
	SetImageMagFilter(ghostLEFTAnimation, 0)
	SetImageMinFilter(ghostRIGHTAnimation, 0)
	SetImageMagFilter(ghostRIGHTAnimation, 0)
	SetImageMinFilter(ghostUPAnimation, 0)
	SetImageMagFilter(ghostUPAnimation, 0)

	DeleteParticles(GhostParticle)
	GhostParticle = CreateParticles(GetSpriteX(Player)+10,GetSpriteY(Player)+10)
	SetParticlesImage(GhostParticle,ghostParticleImage)
	SetParticlesDirection(GhostParticle,0,10)
	SetParticlesSize(GhostParticle,1)
	SetParticlesLife(GhostParticle,0.5)
	SetParticlesFrequency(GhostParticle,50)
	SetParticlesTransparency(GhostParticle,2)
	

	

	
	
	
endfunction
