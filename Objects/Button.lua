--[[
	Name: Button
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: The button module
]]--

function Button(parameters)
	--Private--
	local x = x or 1
	local y = y or 1
	local width = width or 11
	local height = height or 3
	local xText = xText or 2
	local yText = yText or 2
	local text = text or "I, button"
	local fg = fg or colors.black
	local bg = bg or colors.white
	local fgOnPress = fgOnPress or colors.white
	local bgOnPress = bgOnPress or colors.black
	local onRightClick = onRightClick or function()end
	local onLeftClick = onLeftClick or function()end
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local parent = {}
	local application = {}

	--Public--
	local self = {}
	function self.draw(isPressed)
		if (finalX <= 51 or finalX+width-1 >= 1) and (finalY <= 51 or finalY+height-1 >= 1) then
			paintutils.drawFilledBox(finalX,finalY,finalX+width-1,finalY+height-1,isPressed and bgOnPress or bg)
			term.setCursorPos(finalX+xText-1,finalY+yText-1)
			term.setTextColor(isPressed and fgOnPress or fg)
			term.write(text)
		end
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
			fg = fg,
			bg = bg,
			fgOnPress = fgOnPress,
			bgOnPress = bgOnPress,
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
		fg = targs.fg or fg
		bg = targs.bg or bg
		fgOnPress = targs.fgOnPress or fgOnPress
		bgOnPress = targs.bgOnPress or bgOnPress
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
				if e[2] == 1 then
					self.draw(true)
					onLeftClick(self,e)
				elseif e[2] == 2 then
					self.draw(true)
					onRightClick(self,e)
				end
			end
		end
	end
	self.type = "Button"
	self.canRun = false
	function self.setParent(par)
		parent = par
	end
	function self.callParent(method,...)
		if parent[method] then
			parent[method](...)
		end
	end
	function self.callApplication(method,...)
		if application[method] then
			application[method](...)
		end
	end
	function self.setApplication(app)
		application = app
	end
	function self.setBindings(bin)
		bindings = bin
	end
	--Constructor
	self.set(parameters)
	return self
end