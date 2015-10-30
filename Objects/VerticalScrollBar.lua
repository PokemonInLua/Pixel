--[[
	Name: VerticalScrollBar
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A scrollbar
]]--

function VerticalScrollBar()
	--Private
	local x = x or 1
	local y = y or 1
	local parent = {}
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local height = {}
	local application = {}
	local totalHeight = 0
	local bgColor = 1
	local fgColor = 1
	local bgButton = 2
	local fgButton = 4
	local percentage = 0
	local update = function() end
	local size = 1
	local pos = 1
	local bindings = {}
	--Public
	local self = {}
	function self.draw(isPressed)
		size = height*height/totalHeight
		pos = math.floor(percentage*(height-size))
		term.setCursorPos(x,y)
		term.setBackgroundColor(bgButton)
		term.setTextColor(fgButton)
		term.write("^")
		term.setCursorPos(x,y+height-1)
		term.write("v")
		paintutils.drawLine(x,y+1,x,y+height-2,bgColor)
		paintutils.drawLine(x,pos,x,pos+size-1,fgColor)
	end
	function self.get()
		return {
			x = x,
			y = y,
			parent = parent,
			height = height,
			totalHeight = totalHeight,
			bgColor = bgColor,
			fgColor = fgColor,
			bgButton = bgButton,
			fgButton = fgButton,
			percentage = percentage,
			update = update,
			bindings = bindings,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		parent = targs.parent or parent
		height = targs.height or height
		totalHeight = targs.totalHeight or totalHeight
		bgColor = targs.bgColor or bgColor
		fgColor = targs.fgColor or fgColor
		bgButton = targs.bgButton or bgButton
		fgButton = targs.fgButton or fgButton
		percentage = targs.percentage or percentage
		update = targs.update or update
		bindings = targs.bindings or bindings
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
	function self.setParent(par)
		parent = par
	end
	function self.callApplication(method,...)
		(application or parent)[method](...)
	end
	return self
end