--[[
	Name: Image
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: An image drawer
]]--

function Image()
	--Private
	local x = x or 1
	local y = y or 1
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local data = fs.exists(path) and paintutils.loadImage(path) or {{16384}}
	--Public
	local self = {}
	function self.draw()
		paintutils.drawImage(data,finalX,finalY)
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
			bgColor = bgColor,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		text = targs.text or text
		textColor = targs.textColor or textColor
		bgColor = targs.bgColor or bgColor
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
		return "Image"
	end
	function self.event(...)

	end
	return self
end