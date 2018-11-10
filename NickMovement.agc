global playerSpeed = 4		//Player movement speed
global animationSpeed = 5	//Player animation fps
global startFrame = 1		//Starting frame for animations
global endFrame = 3			//Ending frame for animations

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
		startFrame = 1
		endFrame = 3
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
	if GetSpriteCurrentFrame(Player) > endFrame or GetSpriteCurrentFrame(Player) < startFrame	//If currect frame is bigger than end frame or if current frame is more than the max frame
		StopSprite(Player)	//Stop animation
		PlaySprite(Player,animationSpeed,1,startFrame,endFrame)	//Play sprite from the start and end of set animations
	endif

	
endfunction

function loadPlayerIDLE()	//Loads images for IDLE Animation
	SetFolder("/media/NickAnimations/IDLE")
	AddSpriteAnimationFrame(Player,LoadImage("IDLE1.PNG"))	//1
	AddSpriteAnimationFrame(Player,LoadImage("IDLE2.PNG"))	//2
	AddSpriteAnimationFrame(Player,LoadImage("IDLE3.PNG"))	//3
	
	SetFolder("/media/NickAnimations/DOWN")
	AddSpriteAnimationFrame(Player,LoadImage("DOWN1.PNG"))	//4
	AddSpriteAnimationFrame(Player,LoadImage("DOWN2.PNG"))	//5
	AddSpriteAnimationFrame(Player,LoadImage("DOWN3.PNG"))	//6
	AddSpriteAnimationFrame(Player,LoadImage("DOWN4.PNG"))	//7
	
	SetFolder("/media/NickAnimations/UP")
	AddSpriteAnimationFrame(Player,LoadImage("UP1.PNG"))	//8
	AddSpriteAnimationFrame(Player,LoadImage("UP2.PNG"))	//9
	AddSpriteAnimationFrame(Player,LoadImage("UP3.PNG"))	//10
	AddSpriteAnimationFrame(Player,LoadImage("UP4.PNG"))	//11

	SetFolder("/media/NickAnimations/LEFT")
	AddSpriteAnimationFrame(Player,LoadImage("LEFT1.PNG"))	//12
	AddSpriteAnimationFrame(Player,LoadImage("LEFT2.PNG"))	//13
	AddSpriteAnimationFrame(Player,LoadImage("LEFT3.PNG"))	//14
	AddSpriteAnimationFrame(Player,LoadImage("LEFT4.PNG"))	//15

	SetFolder("/media/NickAnimations/RIGHT")
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT1.PNG"))	//16
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT2.PNG"))	//17
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT3.PNG"))	//18
	AddSpriteAnimationFrame(Player,LoadImage("RIGHT4.PNG"))	//19
	SetFolder("/media")

endfunction
