--[[
	Name: Menu
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A drop down with out a scrollbar.
]]--
--[[
	Item structure:
	1. clickable
	{
		type = "clickable",
		onRightClick = function,
		onLeftClick = function,
		text = text
		shortcut = number key
		shText = text
	}
	2. separator
	{
		type = "separator"
		char = aChar
	}
]]--

function Menu()
	--Private
	local x = 1
	local y = 1
	local text = ""
	local width = 3
	local bgColor = 1
	local textColor = 1
	local xOffset = 0
	local yOffset = 0
	local finalX = xOffset + x
	local finalY = yOffset + y
	local bindings = {}
	local items = {}
	local onRightClick
	local itemBg = 1
	local itemTxt = 1
	local doRun = true
	--Public
	local self = {}
	function self.draw()
		term.setCursorPos(finalX,finalY)
		term.setBackgroundColor(bgColor)
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
			bgColor = bgColor,
			items = items,
			onRightClick = onRightClick,
			itemBg = itemBg,
			itemTxt = itemTxt,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		text = targs.text or text
		textColor = targs.textColor or textColor
		bgColor = targs.bgColor or bgColor
		items = targs.items or items
		onRightClick = targs.onRightClick or onRightClick
		finalX = xOffset + x
		finalY = yOffset + y
		itemBg = targs.itemBg or itemBg
		itemTxt = targs.itemTxt or itemTxt
		width = #text+2
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
			if e[4] == finalY and finalX <= e[3] and e[3] <= finalX+width-1 then
				if e[2] == 1 then
					self.run()
				elseif e[2] == 2 then
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
		local  size = 3
		local localx = 0
		tx = term.getSize()
		for i,v in pairs(items) do
			if v.type == "clickable" then
				local bu = #v.text + #v.shText + 1
				if bu > size then
					size = bu
				end
				bu = nil
			end
		end
		localx = finalX+size-1 <= tx and finalX or tx - (bu+2)
		while true do
			term.setBackgroundColor(itemBg)
			term.setTextColor(itemTxt)
			for i,v in pairs(items) do
				term.setCursorPos(localx,finalY+i)
				if v.type == "clickable" then
					term.write(" "..v.text..string.rep(" ",size-#v.text-#v.shText)..v.shText.." ")
				elseif v.type == "separator" then
					term.write(" "..string.rep(v.char,size).." ")
				end
			end
			os.pullEvent()
		end
	end
	return self
end
