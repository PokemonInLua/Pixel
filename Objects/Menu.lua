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
	local parent = {}
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
			if e[4] == finalY and finalX+1 <= e[3] and e[3] <= finalX+width-2 then
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
		local e = {}
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
		while doRun do
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
			term.setCursorPos(localx,finalY+#items+1)
			term.write(string.rep(" ",size+2))
			e = {os.pullEvent()}
			if bindings[e[1]] then
				for i,v in pairs(bindings[e[1]]) do
					v()
				end
			end
			if e[1] == "mouse_click" then
				print(1)
				if localx <= e[3] and e[3] <= localx+size+3 and finalY+1 <= e[4] and e[4] <= finalY+#items+3 then
					print("yay")
					if localx+1 <= e[3] and e[3] <= localx+size-2  and e[4] <= finalY+#items+1 then
						print("wowo")
						local obj = items[e[4]-finalY]
						if obj.type = "clickable" then
							if e[2]==1 then
								obj.onLeftClick(self)
							elseif e[2] == 2 then
								obj.onRightClick(self)
							end
						end
					end
					sleep(1)
				else
					doRun = false
				end
				sleep(1)
			elseif e[1] == "key" then
				
			end
		end
	end
	function self.setParent(par)
		parent = par
	end
	function self.callParent(method,...)
		parent[method](...)
	end
	function self.quit()
		doRun = false
	end
	return self
end
