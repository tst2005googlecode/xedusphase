function love.draw()	
	
	-- Callbacks	
	FToggle()
	MapLoad()
	
	--love.audio.play(menumusic)
	-- Draw Background
	for rowIndex=1, #MenuTable do
    local row = MenuTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = (columnIndex-1)*TileW
      local y = (rowIndex-1)*TileH
      love.graphics.drawq(Tileset, Quads[number], x, y)
    end
  end
	love.graphics.setFont(font)
	love.graphics.draw(select,256,sly)
	love.graphics.printf("Singleplayer", 0, 298, 800, 'center')
	love.graphics.printf("Multiplayer", 0, 361, 800, 'center')
	love.graphics.printf("Options", 0, 425, 800, 'center')
	love.graphics.printf("Exit", 0, 488, 800, 'center')
	love.graphics.print("Xedus (C) 2012 All rights reserved", 410,585)
	love.graphics.print("0.1 test 1", 0, 0)
	
end

function love.keypressed(key)
	if key == "s" or key == "down" and sly < 480 then
		love.audio.play(menupress)
		sly = sly + 64
	end
	
	if key == "w" or key == "up" and sly > 288 then
		love.audio.play(menupress)
		sly = sly - 64
	end
	
	if key == " " or key == "return" and sly == 288 then
		love.filesystem.load("Res/lua/newgame.lua")()
	end
	
	if key == " " or key == "return" and sly == 352 then
		love.filesystem.load("Res/lua/loadgame.lua")()
	end
	
	if key == " " or key == "return" and sly == 416 then
		love.filesystem.load("Res/lua/options.lua")()
	end
	
	if key == " " or key == "return" and sly == 480 then
		love.event.push("q")
	end

end