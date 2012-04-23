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
  -- Checks Wich button its on
  if CheckCollision(XMouse, YMouse, 10, 10, 291, 289, 252, 36) then
	MenuButtonHighlighted = "Singleplayer"
  end
  
  if CheckCollision(XMouse, YMouse, 10, 10, 291, 353, 252, 36) then
	MenuButtonHighlighted = "Multiplayer"
  end
  
  if CheckCollision(XMouse, YMouse, 10, 10, 291, 418, 252, 36) then
	MenuButtonHighlighted = "Options"
  end
  
  if CheckCollision(XMouse, YMouse, 10, 10, 291, 482, 252, 36) then
	MenuButtonHighlighted = "Exit"
  end
  -- end of button check
  
  
	love.graphics.printf(SingleMenu, 0, 298, 800, 'center')
	love.graphics.printf(MultiMenu, 0, 361, 800, 'center')
	love.graphics.printf(OptionMenu, 0, 425, 800, 'center')
	love.graphics.printf(ExitMenu, 0, 488, 800, 'center')
	love.graphics.print(Copyright, 410,585)
	love.graphics.print(PhaseVersion, 0, 0)
	love.graphics.print(XMouse,100,100)
	love.graphics.print(YMouse,200,100)
end



function Menu:update()
	XMouse = love.mouse.getX()
	YMouse = love.mouse.getY()
	
	if love.mouse.isDown("l") then
		if MenuButtonHighlighted == "Singleplayer" then
			UpdateTurnTrue = "NewGame"
			KeyTurnTrue = "NewGame"
			DrawTurnTrue = "NewGame"
		end
		if MenuButtonHighlighted == "Multiplayer" then
			
		end
		if MenuButtonHighlighted == "Options" then
			DrawTurnTrue = "Options"
			KeyTurnTrue = "Options"
		end
		if MenuButtonHighlighted == "Exit" then
			 love.event.quit()
		end
	end
end


function CheckCollision(box1x, box1y, box1w, box1h, box2x, box2y, box2w, box2h)
    if box1x > box2x + box2w - 1 or -- Is box1 on the right side of box2?
       box1y > box2y + box2h - 1 or -- Is box1 under box2?
       box2x > box1x + box1w - 1 or -- Is box2 on the right side of box1?
       box2y > box1y + box1h - 1    -- Is b2 under b1?
    then
        return false                -- No collision. Yay!
    else
        return true                 -- Yes collision. Ouch!
    end
end