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
		local lines = {}
		local pos = 1
		while true do 
			local char = text:sub(pos,pos)
			if char == "\n" then

			elseif

			end
		end
	end

	--Public
	local self = {}
	function self.draw(isPressed)
		if (finalX <= 51 or finalX+width-1 >= 1) and (finalY <= 51 or finalY+height-1 >= 1) then
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