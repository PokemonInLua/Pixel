--[[
	Name: Make
	Author: Wassil Janssen a.k.a. Creator
	Licence: GNU GENERAL PUBLIC LICENSE
	Description: A tool designed to compile the source code of Pixel
]]--

local final = ""
tArgs = {...}
if not tArgs[1] then error("Provide a destination filename.") end

local function readf(path)
	if not fs.exists(path) then error(path.." does not exist!") end
	local file, two = fs.open(path,"r")
	local data = file.readAll()
	file.close()
	return data
end

local function add(txt)
	final = final..(not final == "" and "\n\n" or "")..txt
end

local function explore(path)
	for i,v in pairs(fs.list(path)) do
		local fpath = v.."/"..path
		if fs.isDir(fpath) then
			explore(fpath)
		else
			add(readf(fpath))
		end
	end
end

add(readf("Pixel/BuildHeader"))

explore("Pixel/Objects")

local file = fs.open("/Pixel/Builds/"..tArgs[1],"w")
file.write(final)
file.close()

local file = fs.open("Pixel/Builds/"..tArgs[1],"w")
file.write(final)
file.close()

if tArgs[2] then
	local file = fs.open("Pixel/Build","w")
	file.write(tArgs[1])
	file.close()
end
