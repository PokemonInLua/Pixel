os.loadAPI("Pixel/Pixel")

local app = Pixel.Application()

app.addThread(function(event) 
	local event = type(event) == "table" and event or {}
	while true do
		print(type(event))
		local str = {}
		for i,v in pairs(event) do
			str[i] = tostring(v)
		end
		local file = fs.open("Pixel/EventStuff","a")
		file.write(table.concat(str," ").."\n")
		file.close()
		print(table.concat(str," "))
		print("----")
		event = {coroutine.yield()}
	end
 end)

app.run("terminate")