Options={}
slep = 100
OptionWait = "NO"
-- This menu gonna be diffrently then the others so we create a whole new map
function Options:draw()
	love.graphics.print(SetFullscreenMode,100,100)
	love.graphics.print(LanguageSelect,100,120)
	love.graphics.print(GoBack,100,140)
	love.graphics.print(SelectorMenu,90,slep)
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
		if slep == 120 and Language == "eng" then
			require "Res/lang/nl"
			Language = "nl"
		end
		if slep == 120 and Language == "nl" then
			require "Res/lang/eng"
			Language = "eng"
			end
		if slep == 140 then
			DrawTurnTrue = "Menu"
			KeyTurnTrue = "Menu"
		end
	end
end