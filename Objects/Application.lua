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
	function self.draw()
		layout.set({isActive = true})
		layout.draw()
	end
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
	self.type = "application"
	function self.run(...)
		while doRun do

		end
	end
	function self.quit()

	end
	return self
end