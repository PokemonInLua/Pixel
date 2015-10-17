--[[
	Name: Button
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: The button module
]]--

function Button(x,y,width,height,xText,yText,text,textColor,backgroundColor,textColorOnPress,backgroundColorOnPress,onRightClick,onLeftClick)
	--Private--
	local x = x or 1
	local y = y or 1
	local width = width or 11
	local height = height or 3
	local xText = xText or 2
	local yText = yText or 2
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
		paintutils.drawFilledBox(finalX,finalY,finalX+width-1,finalY+height-1,isPressed and backgroundColorOnPress or backgroundColor)
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
	function 
	function self.get(ser)
		return {
			x = x,
			y = y,
			width = width,
			height = height,
			xText = xText,
			yText = yText,
			text = text,
			textColor = textColor,
			backgroundColor = backgroundColor,
			textColorOnPress = textColorOnPress,
			backgroundColorOnPress = backgroundColorOnPress,
			onRightClick = ser and string.dump(onRightClick) or onRightClick,
			onLeftClick = ser and string.dump(onLeftClick) or onLeftClick
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		width = targs.width or width
		height = targs.height or height
		xText = targs.xText or xText
		yText = targs.yText or yText
		text = targs.text or text
		textColor = targs.textColor or textColor
		backgroundColor = targs.backgroundColor or backgroundColor
		textColorOnPress = targs.textColorOnPress or textColorOnPress
		backgroundColorOnPress = targs.backgroundColorOnPress or backgroundColorOnPress
		onRightClick = targs.onRightClick and (type(targs.onRightClick) == "string" and (function() k,func = loadstring(targs.onRightClick) if not k then return function()end else setfenv(func,_G) end return func end)() or targs.onRightClick) or onRightClick
		onLeftClick = targs.onLeftClick and (type(targs.onLeftClick) == "string" and (function() k,func = loadstring(targs.onLeftClick) if not k then return function()end else setfenv(func,_G) end return func end)() or targs.onLeftClick) or onLeftClick
	end
	return self
end