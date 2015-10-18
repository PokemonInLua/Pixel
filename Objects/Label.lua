--[[
	Name: Label
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: Label class
]]--

function Label(x,y,text,textColor,backgroundColor)
	--Private
	local text = text or ""
	local textColor = textColor or colors.white
	local backgroundColor = backgroundColor or colors.black
	local x = x or 1
	local y = y or 1
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	--Public
	local self = {}
	function self.draw(isPressed)
		term.setCursorPos(finalX,finalY)
		term.setBackgroundColor(backgroundColor)
		term.setTextColor(textColor)
		term.write(text)
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
	function self.getType()
		return "Label"
	end
	function self.event(...)

	end
	return self
end