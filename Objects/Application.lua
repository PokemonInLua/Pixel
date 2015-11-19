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
			screens[destination].runThreads = runThreads
		else
			return false, "Peripheral is not present!"
		end
	end
	function self.set()

	end
	function self.get()

	end
	function self.addThread(th)
		if type(th) == "thread" then
			threads[#threads+1] = th
		elseif type(th) == "function" then
			local th = coroutine.wrap(th)
			threads[#threads+1] = th
		else
			return false, "You have to provide a thread or a function."
		end
	end
	function self.quit()
		run = false
	end
	--Constructor
end