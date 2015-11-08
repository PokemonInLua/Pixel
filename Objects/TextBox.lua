--[[
	Name: TextBox
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A textBox, mate
]]--

function TextBox(args)
	--Private
	local self = {}
	local scroll = 0
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
	local wrapped = {}
	local SB = VerticalScrollBar({
		x = x+width-1,
		y = y,
		parent = self,
		height = height,
		totalHeight = #wrapped, --IDK
		bgColor = bgColor,
		fgColor = textColor,
		bgButton = fgColor,
		fgButton = bgColor,
		percentage = 0,
		update = self.verticalScroll or function() end,
		bindings = bindings,
		interval = 100/(#wrapped-height),
	})
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
		if x+width-1 >= 1 or y+height-1 >= 1 or x <= termWidth or y <= termHeight then
			return true
		end
		return false
	end
	--Public
	function self.draw()
		if isOnScreen() then
			wrapped = wordWrap()
			paintutils.drawFilledBox(finalX,finalY,finalX+width-2,finalY+height-1,bgColor)
			SB.draw()
			term.setTextColor(textColor)
			term.setBackgroundColor(bgColor)
			if text == "" then 
				term.setCursorPos(finalX,finalY)
				term.setTextColor(helpTextColor)
				term.write(helpText)
			else
				for i,v in pairs(wrapped) do
					local pos = i+y-1+scroll
					if y <= pos and pos <= y+height-1 then
						term.setCursorPos(x,pos)
						term.write(v)
					end
				end
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
			bgColor = bgColor,
			textColor = textColor,
			helpTextColor = helpTextColor,
			width = width,
			height = height,
			helpText = helpText,
			text = text,
			bindings = bindings,
			parent = parent,
			application = application,
		}
	end
	function self.set(targs)
		x = targs.x or x
		y = targs.y or y
		bgColor = targs.bgColor or bgColor
		textColor = targs.textColor or textColor
		helpTextColor = targs.helpTextColor or helpTextColor
		width = targs.width or width
		height = targs.height or height
		helpText = targs.helpText or helpText
		text = targs.text or text
		if targs.text then
			wrapped = wordWrap()
		end
		bindings = targs.bindings or bindings
		parent = targs.parent or parent
		application = targs.application or application
		finalX = xOffset + x
		finalY = yOffset + y
		SB.set({
			x = x+width-1,
			y = y,
			parent = self,
			height = height,
			totalHeight = #wrapped, --IDK
			bgColor = bgColor,
			fgColor = textColor,
			bgButton = textColor,
			fgButton = bgColor,
			percentage = 0,
			update = self.verticalScroll,
			bindings = bindings,
			interval = 100/(#wrapped-height),
		})
	end
	function self.setOffset(xOffsetT,yOffsetT)
		xOffset = xOffsetT
		yOffset = yOffsetT
		finalX = xOffset + x
		finalY = yOffset + y
	end
	self.type = ""
	function self.event(event)
		if event[1] == "mouse_click" then
			if x <= event[3] and event[3] <= x+width-1 and y <= event[4] and event[4] <= y+height-1 then
				if event[3] == x+width-1 then
					SB.event(event)
				else
					self.run()
				end
			end
		end
	end
	function self.run()
		local cursorXY={1,1}
		local textPos = #text
		while true do
			wrapped = wordWrap()
			SB.set({
				interval = 100/(#wrapped-height),
				totalHeight = #wrapped,
			})
			SB.draw()
			self.draw()
			local event = {coroutine.yield()}
			if event[1] == "key" then
				if event[2] == 28 then --Enter

				elseif event[2] == 205 then --Right
					textPos = textPos+1
					if textPos > #text then textPos = #text end
				elseif event[2] == 203 then --Left
					textPos = textPos-1
					if textPos < 0 then textPos = 0 end
				elseif event[2] == 200 then --Up

				elseif event[2] == 208 then --Down

				elseif event[2] == 15 then --Tab

				elseif event[2] == 14 then --Backspace
					text = text:sub(0,textPos-1)..text:sub(textPos+1,-1)
					textPos = textPos-1
				elseif event[2] == 211 then
					text = text:sub(0,textPos)..text:sub(textPos+2,-1)
				end
			elseif event[1] == "char" then
				text = text:sub(1,textPos)..event[2]..text:sub(textPos+1,-1)
				textPos = textPos+1
			elseif event[1] == "mouse_click" then
				if x <= event[3] and event[3] <= x+width-1 and y <= event[4] and event[4] <= y+height-1 then

				else
					break
				end
			end
		end
	end
	function self.setParent(par)
		parent = par
	end
	function self.setApplication(app)
		application = app
	end
	function self.verticalScroll(percentage)

	end
	--Constructor
	self.set(args)
	return self
end