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
		mouse_click = true,
		mouse_drag = true,
		mouse_up = true,
		mouse_scroll = true,
		char = true,
		
	}
	--Public
	local self = {}
	self.type = "Application"
	function self.event(event)
		if event[1] == "monitor_touch"

		elseif 
	end
	function self.run()

	end
	function self.addScreen(destination,scr)

	end
	function self.set()

	end
	function self.get()

	end
	function self.addThread()

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