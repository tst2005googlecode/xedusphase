function love.load()
	
	-- Variables -- 
	KeyTurnTrue = "None" -- Load the right key in the right time
	DrawTurnTrue = "Splash" -- Can i draw?
	UpdateTurnTrue = "None" -- Lets the game update
	-- end --
	
	-- Require lua files -- 
	require "Res/lua/menu"
	require "Res/lua/splash"
	require "Res/lua/maploader"
	require "Res/lua/gamemenu"
	require "Res/lua/newgame"
	require "Res/lua/options"
	-- end -- 
	fps = 0
	-- Callbacks -- 
	MapLoad()
	-- end -- 
	
	-- Loading Font --
	font = love.graphics.newImageFont("Res/gfx/fonts/imagefont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")
	
	love.graphics.setFont(font)
	-- end -- 
	
	-- Tile Variables & Images -- 
	Tileset = love.graphics.newImage("Res/gfx/tiles/terrain.png")
	
	local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
	TileW, TileH = 32,32	
	playertile = love.graphics.newImage("Res/gfx/player/player.png")
	
	local tileset2W, tileset2H = playertile:getWidth(), playertile:getHeight()
	playerW, playerH = 32,32
	player = {hp = 100, gravity = 460, y = 100, x = 100, jumpspeed = 10, jumpstate = "ground"}
	enemy = {hp = 100, gravity = 460, y = 460, x = 500, jumpspeed = 10, jumpstate = "ground"}
	weapon = {x = 300, y = 516}
	Quads = {
    love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH), -- 1 = grass
    love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH), -- 2 = water
    love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH), -- 3 = stone
    love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH),  -- 4 = lava
	love.graphics.newQuad(64,  0, TileW, TileH, tilesetW, tilesetH), -- 5 = ice
	love.graphics.newQuad(0,  64, TileW, TileH, tilesetW, tilesetH), -- 6 = menu back
	love.graphics.newQuad(32,  64, TileW, TileH, tilesetW, tilesetH), -- 7 = green title
	love.graphics.newQuad(64,  32, TileW, TileH, tilesetW, tilesetH), -- 8 = Black
	love.graphics.newQuad(64,  64, TileW, TileH, tilesetW, tilesetH), -- 9 = Clouds?
	love.graphics.newQuad(96,  0, TileW, TileH, tilesetW, tilesetH), -- 10 = Select left
	love.graphics.newQuad(96,  32, TileW, TileH, tilesetW, tilesetH), -- 11 = Select Right
	love.graphics.newQuad(96,  64, TileW, TileH, tilesetW, tilesetH), -- 12 = Alpha Layer
	love.graphics.newQuad(0,  96, TileW, TileH, tilesetW, tilesetH) -- 13 = Sword
	}
	QuadsP = {
	love.graphics.newQuad(0,   0, playerW, playerH, tileset2W, tileset2H), -- 1 Alpha Layer
	love.graphics.newQuad(32,   0, playerW, playerH, tileset2W, tileset2H), -- 2 Head
	love.graphics.newQuad(0,   32, playerW, playerH, tileset2W, tileset2H), -- 3 Arm left
	love.graphics.newQuad(32,   32, playerW, playerH, tileset2W, tileset2H), -- 4 Body
	love.graphics.newQuad(32,   64, playerW, playerH, tileset2W, tileset2H), -- 5 Arm Right
	love.graphics.newQuad(64,   32, playerW, playerH, tileset2W, tileset2H), -- 6 Feet
	love.graphics.newQuad(64,   0, playerW, playerH, tileset2W, tileset2H) -- 7 enemy
	}
	-- end -- 
	
	-- Set up of the icon --
	local icon = love.graphics.newImage("Res/gfx/icon/icon_32.png")
	love.graphics.setIcon(icon)
	-- end --
	
	-- Images --
	-- end --
	
	
	-- Splash screen stuff -- 
	xedus1 = love.graphics.newImage("Res/gfx/splash/xedus_clear.png")
	xedus2 = love.graphics.newImage("Res/gfx/splash/xedus_shot.png")
	--shot = love.audio.newSource("Res/sound/shotty.wav")
	-- end --
	
end

function love.draw()
	-- Gives each Function ability to draw
	-- Theres probbaly an easyer way of doing this
	-- but i like this way..
	
	if DrawTurnTrue == "Splash" then
		Splash:draw()
	end
	if DrawTurnTrue == "Menu" then
		Menu:draw()
	end	
	if DrawTurnTrue == "GameMenu" then
		GameMenu:draw()
	end
	if DrawTurnTrue == "NewGame" then
		NewGame:draw()
	end
	if DrawTurnTrue == "Options" then
		Options:draw()
	end
end

function love.keypressed(key)
	if KeyTurnTrue == "Menu" then
		Menu:keypressed(key)
	end
	if KeyTurnTrue == "GameMenu" then
		GameMenu:keypressed(key)
	end
	if KeyTurnTrue == "NewGame" then
		NewGame:keypressed(key)
	end
	if KeyTurnTrue == "Options" then
		Options:keypressed(key)
	end
end

function love.update()
	if UpdateTurnTrue == "NewGame" then
		NewGame:update()
	end

end