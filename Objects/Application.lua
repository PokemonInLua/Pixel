--[[
	Name: Application
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: An application holder for Pixel.
]]--

function Name()
	--Private
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
			event = {os.pullEvent()}
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
end