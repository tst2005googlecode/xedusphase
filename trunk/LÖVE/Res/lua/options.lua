Options={}
slep = 100
OptionWait = "NO"
-- This menu gonna be diffrently then the others so we create a whole new map
function Options:draw()
	love.graphics.print("Toggle FullScreen",100,100)
	love.graphics.print("Toglle Something",100,120)
	love.graphics.print("back",100,140)
	love.graphics.print("this",90,slep)
	love.graphics.print(slep,300,300)
	OptionWait = "OK"
end

function Options:keypressed(key)
	if key == "s" then
		slep = slep + 20
	end
	if key == "w" then
		slep = slep -20
	end
	if key == " " and OptionWait == "OK" then
		
		if slep == 100 then
			love.graphics.toggleFullscreen(true)
		end
		if slep == 140 then
			DrawTurnTrue = "Menu"
			KeyTurnTrue = "Menu"
		end
	end
end