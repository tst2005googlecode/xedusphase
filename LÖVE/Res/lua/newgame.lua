NewGame={}
MapLoad()

function NewGame:update()
	if love.keyboard.isDown("d") then
      player.x = player.x + 4
   elseif love.keyboard.isDown("a") then
      player.x = player.x - 4
   end
	
	if player.jumpstate=="jumping" then
	player.jumpspeed = player.jumpspeed - 0.5
	player.gravity = player.gravity - player.jumpspeed
	end
	
	if player.gravity < 460 and player.jumpstate == "falling" then
	player.gravity = player.gravity + (player.jumpspeed +3)
	end
	
	if player.gravity == 460 then
	player.jumpspeed = 10
	player.jumpstate = "ground"
	end
	
	if player.gravity > 460 then player.gravity = 460 end
	
	player.y = player.gravity
	if PickedUpSword then
		weapon.x = player.x + 64
		weapon.y = player.y + 25
		love.graphics.drawq(Tileset, Quads[13], weapon.x, weapon.y)
	end
	
end

function NewGame:draw()
	--love.graphics.draw(playertile, player.x, player.y)
	for rowIndex=1, #GameTable do
		local row = GameTable[rowIndex]
		for columnIndex=1, #row do
			local number = row[columnIndex]
			local x = (columnIndex-1)*TileW
			local y = (rowIndex-1)*TileH
			love.graphics.drawq(Tileset, Quads[number], x, y)
		end
	end
	for rowIndex=1, #PlayerTable do
		local row = PlayerTable[rowIndex]
		for columnIndex=1, #row do
			local number2 = row[columnIndex]
			local x2 = (columnIndex-1)*TileW + player.x
			local y2 = (rowIndex-1)*TileH + player.y
			love.graphics.drawq(playertile, QuadsP[number2], x2, y2)
		end
	end
	for rowIndex=1, #EnemyTable do
		local row = EnemyTable[rowIndex]
		for columnIndex=1, #row do
			local number3 = row[columnIndex]
			local x3 = (columnIndex-1)*TileW + enemy.x
			local y3 = (rowIndex-1)*TileH + enemy.y
			love.graphics.drawq(playertile, QuadsP[number3], x3, y3)
		end
	end
	love.graphics.drawq(Tileset, Quads[13], weapon.x, weapon.y)
	love.graphics.print(Hitpoints,0,0)
	love.graphics.print(player.hp,35,0)
	love.graphics.print(Hitpoints,725,0)
	love.graphics.print(enemy.hp,760,0)
	
	if enemy.hp < 0 then
		love.graphics.print(YouWon,400,300)
		end
	love.graphics.print(ControlsInGame,0,585)
end

function NewGame:keypressed(key)
	if key == " " and player.jumpstate == "ground" then player.jumpstate = "jumping" end
	
	if key == "escape" then
	love.filesystem.load("Res/lua/menu.lua")()
	end
	if key == "f" then
	if CheckCollision(player.x, player.y, 25, 25, enemy.x, enemy.y, 25, 25) then -- Checks if player and the white rectangle are colliding, if that true -> Print "Ouch!"
		enemy.hp = enemy.hp - player.hit
	end
	end
	if key == "e" then
		if CheckCollision(player.x, player.y, 64, 64, weapon.x, weapon.y, 64, 64) then
			player.hit = player.hit + 5
			PickedUpSword = true
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