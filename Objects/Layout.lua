--[[
	Name: Layout
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A container for other objects
]]--

function Layout(x,y,width,height,color,transparent,isActive)
	--Private
	local x = x or 1
	local y = y or 1
	local width = width or 10
	local height = height or 10
	local color = color or colors.white
	local transparent = transparent or false
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local children = {}
	local isActive = isActive or true
	local parent = {}

	--Public
	local self = {}
	function self.draw(isPressed)
		if not isActive then return end
		if not transparent then
			paintutils.drawFilledBox(finalX,finalY,finalX+width-1,finalY+height-1,color)
		end
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
			x = x or 1
			y = y or 1
			width = width,
			height = height,
			color = color,
			transparent = transparent,
			isActive = isActive,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		width = targs.width or width
		height = targs.height or height
		color = targs.color or color
		transparent = targs.transparent or transparent
		children = targs.children or children
		isActive = targs.isActive or isActive
		finalX = xOffset + x
		finalY = yOffset + y
	end
	function self.setOffset(xOffsetT,yOffsetT)
		xOffset = xOffsetT
		yOffset = yOffsetT
		finalX = xOffset + x
		finalY = yOffset + y
	end
	self.type = "Layout"
	function self.event(...)
		if not isActive then return end
		for i,v in pairs(children) do
			for k,m in pairs(v) do
				m.event(...)
			end
		end
	end
	function self.setParent(par)
		parent = par
	end
	function self.callParent(method,...)
		parent[method](...)
	end
	function self.addChild(kid)
		local typ = kid.type
		if not children[typ] then
			children[typ] = {}
		end
		children[typ][#children[typ]+1] = kid
		children[typ][#children[typ]].setParent(self)
	end
	return self
end