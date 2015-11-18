--[[
	Name: Application
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: An application holder for Pixel.
]]--

function Name(parameters)
	--Private
	local threads = {}
	local screens = {}
	local term_events = {
		["key"] = true,
		["mouse_click"] = true,
		["paste"] = true,
		["char"] = true,
		["mouse_scroll"] = true,
		["mouse_drag"] = true,
		["key_up"] = true,
		["mouse_up"] = true
	}
	local run = true
	local function runThreads(event)
		for i,v in pairs(threads) do
			coroutine.resume(v,unpack(event))
		end
	end
	
	--Public
	local self = {}
	self.type = "Application"
	function self.event(event)
		if event[1] == "monitor_touch"
			if screens[event[2]] then
				screens[event[2]].event(event)
			end
		elseif term_events[event[1]] then
			if screens.term then
				screens.term.event(event)
			end
		elseif event[1] == "terminate" then
			--complicated
		else
			for i,v in pairs(screens) do
				v.event(event)
			end
		end
	end
	function self.run(terminate)
		run = true
		local self_event = self.event
		if terminate then
			while run do
				local event = {coroutine.yield()}
				if event[1] == terminate then
					break
				end
				self_event(event)
			end
		else
			while run do
				self_event({coroutine.yield()})
			end
		end
	end
	function self.addScreen(destination,scr)
		if peripheral.isPresent(destination) then
			screens[destination] = scr
			screens[destination].setParent(peripheral.wrap(destination))
		else
			return false, "Peripheral is not present!"
		end
	end
	function self.set()

	end
	function self.get()

	end
	function self.addThread()

	end
	function self.quit()
		run = false
	end
	--Constructor
end
--[=[
local layout = {}
	local bindings = {}
	local doRun = true
	--Public
	local self = {}
	function self.get(ser)
		return {
		layout = layout,
		bindings = bindings,
		}
	end
	function self.set(targs)
		layout = targs.layout or layout
		bindings = targs.bindings or bindings
		if targs.layout then
			layout.setApplication(self)
			layout.setParent(self)
		end
	end
	function self.addBinging(event,func)
		if not bindings[event] then
			bindings[event] = {}
		end
		bindings[event][#bindings[event]] = func
	end
	self.type = "application"
	function self.run(...)
		doRun = true
		while doRun do
			layout.set({isActive = true})
			layout.draw()
			event = {coroutine.yield()}
			layout.event(event)
			if bindings[event[1]] then
				for i,v in pairs(bindings[event[1]]) do
					v(event)
				end
			end
		end
	end
	function self.quit()
		doRun = false
	end
	return self
	]=]--