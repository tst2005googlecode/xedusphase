Menu={}
SelectorMenuY = 288
SelectorMenuX = 256

function Menu:draw()

  
  -- Background Menu
  for rowIndex=1, #MenuTable do
    local row = MenuTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = (columnIndex-1)*TileW
      local y = (rowIndex-1)*TileH
      love.graphics.drawq(Tileset, Quads[number], x, y)
    end
  end
  -- Selecter Menu
  for rowIndex=1, #SelectTable do
    local row = SelectTable[rowIndex]
    for columnIndex=1, #row do
      local number = row[columnIndex]
      local x = (columnIndex-1)*TileW + SelectorMenuX
      local y = (rowIndex-1)*TileH + SelectorMenuY
      love.graphics.drawq(Tileset, Quads[number], x, y)
    end
  end
  love.graphics.print(SelectorMenuY,100,100)
  
	love.graphics.printf("Singleplayer", 0, 298, 800, 'center')
	love.graphics.printf("Multiplayer", 0, 361, 800, 'center')
	love.graphics.printf("Options", 0, 425, 800, 'center')
	love.graphics.printf("Exit", 0, 488, 800, 'center')
	love.graphics.print("Xedus (C) 2012 All rights reserved", 410,585)
	love.graphics.print("0.1 test 1", 0, 0)
end

function Menu:keypressed(key)
	if key == "s" and SelectorMenuY < 480 then
		SelectorMenuY = SelectorMenuY + 64
	end
	if key == "w" and SelectorMenuY > 288 then
		SelectorMenuY = SelectorMenuY - 64
	end
	
	if key == " " then
		if SelectorMenuY == 288 then
			DrawTurnTrue = "NewGame"
			KeyTurnTrue = "NewGame"
			UpdateTurnTrue = "NewGame"
		end
		if SelectorMenuY == 352 then
		
		end
		if SelectorMenuY == 416 then
			DrawTurnTrue = "Options"
			KeyTurnTrue = "Options"
		end
		if SelectorMenuY == 480 then
			love.event.push("q")
		end
	end
end