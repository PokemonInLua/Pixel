--[[
	Name: Menu
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A drop down with out a scrollbar.
]]--

function Menu()
	--Private
	local x = 1
	local y = 1
	local text = ""
	local width = 3
	local backgroundColor = 1
	local textColor = 1
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local bindings = {}
	local items = {}
	--Public
	local self = {}
	function self.draw()
		term.setCursorPos(x,y)
		term.setBackgroundColor(backgroundColor)
		term.setTextColor(textColor)
		term.write(" "..text.." ")
	end
	function self.move(xNew,yNew)
		x = xNew
		y = yNew
		finalX = xOffset + x
		finalY = yOffset + y
	end
	function self.get(ser)
		return {
			x = x,
			y = y,
			text = text,
			textColor = textColor,
			backgroundColor = backgroundColor,
			items = items,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		text = targs.text or text
		textColor = targs.textColor or textColor
		backgroundColor = targs.backgroundColor or backgroundColor
		finalX = xOffset + x
		finalY = yOffset + y
	end
	function self.setOffset(xOffsetT,yOffsetT)
		xOffset = xOffsetT
		yOffset = yOffsetT
		finalX = xOffset + x
		finalY = yOffset + y
	end
	self.type = "Menu"
	function self.event(...)

	end
	function self.setBindings(b)
		bindings = b
	end
	function self.getWidth()
		return 2+#text
	end
	return self
end
