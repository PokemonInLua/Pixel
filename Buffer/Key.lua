--[[
	Name: Key
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: Excecutes a function when a certain key is pressed.
]]--

function Key()
	--Private
	local key = 0
	local function onPress(self) end
	--Public
	end
	function self.get(ser)
		return {
			key = key,
			onPress = onPress
		}
	end
	function self.set(targs)
		key = targs.key or key
		onPress = targs.onPress or onPress
	end
	self.type = "Key"
	function self.event(e)
		if e[1] == "key" then
			if e[2] == key then
				onPress(self)
			end
		end
	end
	return self
end