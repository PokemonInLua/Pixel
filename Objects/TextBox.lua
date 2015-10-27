--[[
	Name: 
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description:
]]--

function TextBox()
	--Private
	local x = 1
	local y = 1
	local width = 5
	local height = 1
	local initText = ""
	local text = ""
	local bindings = {}
	local parent = {}
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local wordWrap(text,width)

	--Public
	local self = {}
	function self.draw(isPressed)

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
	self.type = ""
	function self.event(...)

	end
	function self.run()

	end
	function self.setParent(par)
		parent = par
	end
	return self
end