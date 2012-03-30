function love.load()
	-- requirements
	require "Res/lua/maploader"
	require "Res/lua/toggle"
	
	-- Image loading
	local icon = love.graphics.newImage("Res/gfx/icon/icon_32.png")
	love.graphics.setIcon(icon)
	
	player1 = love.graphics.newImage("Res/gfx/player.png")
	
	Tileset = love.graphics.newImage("Res/gfx/tiles/terrain.png")
	select = love.graphics.newImage("Res/gfx/select.png")
	
	--player1 = love.graphics.newImage("Res/gfx/player.png")
	--Player stuff
	playertile = love.graphics.newImage("Res/gfx/player/player.png")
	
	local tileset2W, tileset2H = playertile:getWidth(), playertile:getHeight()
	playerW, playerH = 32,32
	
	-- splash screen
	xedus1 = love.graphics.newImage("Res/gfx/splash/xedus_clear.png")
	xedus2 = love.graphics.newImage("Res/gfx/splash/xedus_shot.png")
	shot = love.audio.newSource("Res/sound/shotty.wav")
	delay = 100
	delaymenu = 100
	
	-- Font Loading
	font = love.graphics.newImageFont("Res/gfx/fonts/imagefont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")
	
	-- Music
	--menumusic = love.audio.newSource("Res/music/menu.ogg")
	menupress = love.audio.newSource("Res/sound/click.ogg")
	
	--Variables
	sly = 288
	player = {gravity = 460, y = 600, x = 500, jumpspeed = 10, jumpstate = "ground"}
	
	-- Map Variables, 32 bit tile.
	local tilesetW, tilesetH = Tileset:getWidth(), Tileset:getHeight()
	TileW, TileH = 32,32
	
	--QUADS (Important for tile drawing)
	Quads = {
    love.graphics.newQuad(0,   0, TileW, TileH, tilesetW, tilesetH), -- 1 = grass
    love.graphics.newQuad(32,  0, TileW, TileH, tilesetW, tilesetH), -- 2 = water
    love.graphics.newQuad(0,  32, TileW, TileH, tilesetW, tilesetH), -- 3 = stone
    love.graphics.newQuad(32, 32, TileW, TileH, tilesetW, tilesetH),  -- 4 = lava
	love.graphics.newQuad(64,  0, TileW, TileH, tilesetW, tilesetH), -- 5 = ice
	love.graphics.newQuad(0,  64, TileW, TileH, tilesetW, tilesetH), -- 6 = menu back
	love.graphics.newQuad(32,  64, TileW, TileH, tilesetW, tilesetH), -- 7 = green title
	love.graphics.newQuad(64,  32, TileW, TileH, tilesetW, tilesetH), -- 8 = Black
	love.graphics.newQuad(64,  64, TileW, TileH, tilesetW, tilesetH) -- 9 = Clouds?
	}
	QuadsP = {
	love.graphics.newQuad(0,   0, playerW, playerH, tileset2W, tileset2H), -- 1 Alpha Layer
	love.graphics.newQuad(32,   0, playerW, playerH, tileset2W, tileset2H), -- 2 Head
	love.graphics.newQuad(0,   32, playerW, playerH, tileset2W, tileset2H), -- 3 Arm left
	love.graphics.newQuad(32,   32, playerW, playerH, tileset2W, tileset2H), -- 4 Body
	love.graphics.newQuad(32,   64, playerW, playerH, tileset2W, tileset2H), -- 5 Arm Right
	love.graphics.newQuad(64,   32, playerW, playerH, tileset2W, tileset2H) -- 6 Feet
	}
end

function love.draw()
	love.filesystem.load("Res/lua/splash.lua")()
end



