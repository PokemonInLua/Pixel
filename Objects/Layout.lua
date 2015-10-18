--[[
	Name: Layout
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A container for other objects
]]--

function Layout(x,y)
	--Private
	local x = x or 1
	local y = y or 1
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local children = {}

	--Public
	local self = {}
	function self.draw(isPressed)
		for i,v in pairs(children) do
			for k,m in pairs(v) do
				m.setOffset(finalX-1,finalY-1)
				m.draw()
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
			children = children,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		text = targs.text or text
		textColor = targs.textColor or textColor
		backgroundColor = targs.backgroundColor or backgroundColor
		children = targs.children or children
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
		return "Layout"
	end
	function self.event(...)
		for i,v in pairs(children) do
			for k,m in pairs(v) do
				m.event(...)
			end
		end
	end
	function self.addChild(kid)
		local typ = kid.getType()
		if not children[typ] then
			children[typ] = {}
		end
		children[typ][#children[typ]+1] = kid
	end
	function self.run()

	end
	return self
end