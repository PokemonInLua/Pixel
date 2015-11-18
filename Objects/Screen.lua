--[[
	Name: Screen
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: An objects that holds the layouts drawn to the screen.
]]--

function Screen(parameters)
	--Private
	local parent = {}
	local layout = {}
	local function runThreads() end
	--Public
	local self = {}
	self.type = "Screen"
	function self.setParent(par)
		parent = par
	end

	--COnstructor
end