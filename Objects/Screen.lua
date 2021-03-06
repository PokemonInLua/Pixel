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
	local parent = {}

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
		term.redirect(parent)
		layout.event(event)
		term.redirect(term.native())
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
	function self.setParent(par)
		parent = par
	end
	function self.draw()
		if layout.draw then
			layout.draw()
		end
	end
	function self.set(tabl)
		tabl = type(tabl) == "table" and tabl or {}
		layout = tabl.layout or layout
	end
	--Constructor
	self.set(parameters)

	return self
end