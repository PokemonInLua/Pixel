local function func()
	local a = 1
	while true do
		print(a)
		a = a+1
		coroutine.yield()
	end
end

local th = coroutine.create(func)
local th1 = th
print(th==th1)
coroutine.resume(th1)
print(th1==th)
coroutine.resume(th)