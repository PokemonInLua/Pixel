--[[
	Name: Button
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: The button module
]]--

function Button(args)
	--Private--
	local x = x or 1
	local y = y or 1
	local width = width or 11
	local height = height or 3
	local text = text or "I, button"
	local textColor = textColor or colors.black
	local backgroundColor = backgroundColor or colors.white
	local textColorOnPress = textColorOnPress or colors.white
	local backgroundColorOnPress = backgroundColorOnPress or colors.black
	local onRightClick = onRightClick or function() end
	local onLeftClick = onLeftClick or function() end
	--Public--
	local self = {}
	function self.draw(isPressed, xOffset, yOffset)
		local finalX = xOffset and (xOffset - 1 + x) or x
		local finalY = yOffset and (yOffset - 1 + y) or y
		paintitils.drawFilledBox(finalX,finalY,finalX+width-1,finalY+height-1,isPressed and backgroundColorOnPress or backgroundColor)
		term.setCursorPos(finalX+xText-1,finalY+yText-1)
		term.setTextColor(isPressed and textColorOnPress or textColor)
		term.write(text)
	end
	function self.onRightClick()
		onRightClick()
	end
	function self.onLeftClick()
		onLeftClick()
	end
	function self.move(xNew,yNew)
		x = xNew
		y = yNew
	end
	function self.get()
		return {
			x = x,
			y = y,
			width = width,
			height = height,
			text = text,
			textColor = textColor,
			backgroundColor = backgroundColor,
			textColorOnPress = textColorOnPress,
			backgroundColorOnPress = backgroundColorOnPress,
			onRightClick = onRightClick,
			onLeftClick = onLeftClick
		}
	end
	function self.set(targs)
		x = targs.x
		y = targs.y
		width = targs.width
		height = targs.height
		text = targs.text
		textColor = targs.textColor
		backgroundColor = targs.backgroundColor
		textColorOnPress = targs.textColorOnPress
		backgroundColorOnPress = targs.backgroundColorOnPress
		onRightClick = targs.onRightClick
		onLeftClick = targs.onLeftClick
	end
	return self
end