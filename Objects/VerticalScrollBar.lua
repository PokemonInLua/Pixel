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
	local interval = 1
	--Public
	local self = {}
	function self.draw(isPressed)
		size = math.floor(height*height/totalHeight)
		pos = math.ceil(percentage*(height-(size+2))/100)
		term.setCursorPos(x,y)
		term.setBackgroundColor(bgButton)
		term.setTextColor(fgButton)
		term.write("^")
		term.setCursorPos(x,y+height-1)
		term.write("v")
		paintutils.drawLine(x,y+1,x,y+height-2,bgColor)
		paintutils.drawLine(x,y+pos+1,x,y+pos+size,fgColor)
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
			interval = interval,
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
		interval = targs.interval or interval
	end
	function self.setOffset(xOffsetT,yOffsetT)
		xOffset = xOffsetT
		yOffset = yOffsetT
		finalX = xOffset + x
		finalY = yOffset + y
	end
	self.type = ""
	function self.event(event)
		if event[1] == "mouse_click" and event[2] == 1 then
			if event[3] == x then
				if y <= event[4] and event[4] <= y+height-1 then
					if event[4] == y then
						percentage = percentage - interval
						if percentage < 0 then
							percentage = 0
						end
						update(percentage)
					elseif event[4] == y+height-1 then
						percentage = percentage + interval
						if percentage > 100 then
							percentage = 100
						end
						update(percentage)
					else
						if y+pos+1 <= event[4] and event[4] <= y+pos+size then
							self.run(event[3],event[4])
						else
							local e4 = event[4] - math.floor(size/2)
							local per = e4/((height-(size+2))/100)
							percentage = per - per%interval
							if percentage > 100 then
								percentage = 100
							elseif percentage < 0 then
								percentage = 0
							end
							update(percentage)
						end
					end
				end
			end
		end
	end
	function self.run(x,y)
		while true do
			local event = {coroutine.yield()}
			break
		end
	end
	function self.setParent(par)
		parent = par
	end
	function self.callPArent(method,...)
		if parent[method] then
			parent[method](...)
		end
	end
	function self.callApplication(method,...)
		if application[method] then
			application[method](...)
		end
	end
	return self
end