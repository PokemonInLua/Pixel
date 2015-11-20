--[[
	Name: Screen
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: An objects that holds the layouts drawn to the screen.
]]--

function Screen(parameters)
	--Private
	local layout = {}
	local Application = {}
	local function runThreads() end
	local onEvent = {}
	--Public
	local self = {}

	self.type = "Screen"
	function self.setApplication(app)
		Application = app
	end
	function self.runThreads(func)
		runThreads = func
	end
	function self.event(event)
		if onEvent[event[1]] then
			for i,v in pairs(onEvent[event[1]]) do
				v(self,event)
			end
		end
		layout.event(event)
	end
	function self.setLayout(lay)
		layout = lay
	end
	function self.addEvent(event,handle)
		if not onEvent[event] then
			onEvent[event] = {handle}
		else
			onEvent[event][#onEvent[event]] = handle
		end
	end
	--Constructor
end