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
	local bgColor = 1
	local textColor = 2
	local helpTextColor = 4
	local width = 5
	local height = 1
	local helpText = ""
	local text = ""
	local bindings = {}
	local parent = {}
	local application = {}
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local function wordWrap()
		local actualWidth = width-1
		local lines = {}
		local line = 1
		local pos = 1
		local rest = text
		while true do
			local currText = rest:sub(1,actualWidth)
			if #currText < actualWidth then
				lines[line] = currText
				return lines
			end
			local start = currText:find("\n")
			if start then
				lines[line] = rest:sub(1,start-1)
				line = line+1
				rest = rest:sub(start+1,-1)
			elseif currText:find("%s") then
				local hasHappened = false
				for i=#currText,1,-1 do
					if currText:sub(i,i) == " " and not hasHappened then
						lines[line] = currText:sub(1,i)
						rest = rest:sub(i+1,-1)
						line = line+1
						hasHappened = true
					end
				end
			else
				lines[line] = currText
				rest = rest:sub(#currText+1,-1)
				line = line+1
			end
		end
	end
	local function isOnScreen()
		local termWidth, termHeight = term.getSize()
		if 
	end
	--Public
	local self = {}
	function self.draw(isPressed)
		if isOnScreen then
			paintutils.drawFilledBox(finalX,finalY,finalX+width-1,finalY+height-1,bgColor)
			if text == "" then 
				term.setCursorPos(finalX,finalY)
				term.setTextColor(helpTextColor)
				term.write(helpText)
			else
				
			end
		end
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
	function self.setApplication(app)
		application = app
	end
	return self
end