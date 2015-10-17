--[[
	Name: Button
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: The button module
]]--

function Button(args)
	--Private--
	local x = 1
	local y = 1
	local width = 11
	local height = 3
	local text = "I, button"
	local textColor = colors.black
	local backgroundColor = colors.white
	local textColorOnPress = colors.white
	local backgroundColorOnPress = colors.black
	local onRightClick = function() end
	local onLeftClick = function() end
	--Public--
	local self = {}
	function self.draw(isPressed, xOffset, yOffset)
		local finalX = xOffset and (xOffset - 1 + x) or x
		local finalY = yOffset and (yOffset - 1 + y) or y
		term.setBackgroundColor(isPressed and backgroundColorOnPress or backgroundColor)
		for i=finalX,width-1 do
			term.setCursorPos(i,finalY)
			term.write(string.rep(" "),width)
		end
	end
	function self.onRightClick()
		onRightClick()
	end
	function self.onLeftClick()
		onLeftClick()
	end
	function self.move(x,y)

	end
	--Constuctor--
end