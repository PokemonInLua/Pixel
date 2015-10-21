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
	local onRightClick
	local doRun = true
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
			onRightClick = onRightClick
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		text = targs.text or text
		textColor = targs.textColor or textColor
		backgroundColor = targs.backgroundColor or backgroundColor
		items = targs.items or items
		onRightClick = targs.onRightClick or onRightClick
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
	self.canRun = true
	function self.event(e)
		if e[1] == "mouse_click" then
			if e[4] == y and x <= e[3] and e[3] <= x then
				if e[1] == 1 then
					self.run()
				elseif e[1] == 2 then
					onRightClick(self,e)
				end
			end
		end
	end
	function self.setBindings(b)
		bindings = b
	end
	function self.getWidth()
		return 2+#text
	end
	function self.run()
		doRun = true
		while true do

		end
	end
	return self
end
