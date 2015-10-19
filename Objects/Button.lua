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
	local onRightClick = onRightClick or function()end
	local onLeftClick = onLeftClick or function()end
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local parent = {}

	--Public--
	local self = {}
	function self.draw(isPressed)
		paintutils.drawFilledBox(finalX,finalY,finalX+width-1,finalY+height-1,isPressed and backgroundColorOnPress or backgroundColor)
		term.setCursorPos(finalX+xText-1,finalY+yText-1)
		term.setTextColor(isPressed and textColorOnPress or textColor)
		term.write(text)
	end
	function self.move(xNew,yNew)
		x = xNew
		y = yNew
		finalX = xOffset + x
		finalY = yOffset + y
	end
	function self.resize(w,h)
		width = w
		height = h
	end
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
		onRightClick = targs.onRightClick or onRightClick
		onLeftClick = targs.onLeftClick or onLeftClick
		finalX = xOffset + x
		finalY = yOffset + y
	end
	function self.setOffset(xOffsetT,yOffsetT)
		xOffset = xOffsetT
		yOffset = yOffsetT
		finalX = xOffset + x
		finalY = yOffset + y
	end
	function self.event(e)
		if e[1] == "mouse_click" then
			if finalX <= e[3] and e[3] <= finalX+width-1 and finalY <= e[4] and e[4] <= finalY+height-1 then
				return true
			end
		end
	end
	self.type = "Button"
	self.canRun = false
	function self.callParent(method,...)
		parent[method](...)
	end
	function self.setParent(par)
		parent = par
	end
	return self
end