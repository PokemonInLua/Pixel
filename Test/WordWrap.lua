local width = 20
local text = "On a \n beautiful sunny day, Creator was sick of Interact. This lead him to start a new project called Pixel. I know, the name's original."
local function wordWrap()
	local actualWidth = width-1
	local lines = {}
	local currLine = 1
	local pos = 1
	lines[currLine] = ""
	local doRun = true
	while doRun do 
		local char = text:sub(pos,pos)
		if char == "" then doRun = false end
		if char == "\n" then
			pos = pos+1
			currLine = currLine+1
			lines[currLine] = ""
		elseif char == " " then
			if lines[currLine] == "" then

			else
				lines[currLine] = lines[currLine]..char
				if #lines[currLine] > actualWidth then
					lines[currLine] = lines[currLine]:sub(1,-2)
					currLine = currLine+1
					lines[currLine] = ""
				end
			end
			pos = pos+1
		else
			local word = char
			local lPos = pos+1
			local doRunSub
			while doRunSub do
				local lChar = text:sub(lPos,lPos)
				if lChar == "\n" or lChar == " " then
					doRunSub = false
				else
					word = word..lChar
					lPos = lPos+1
				end
			end
			pos = pos+#word
			if #lines[currLine] + #word > actualWidth then
				currLine = currLine+1
				lines[currLine] = word
			else
				lines[currLine] = lines[currLine]..word
			end
		end
	end
	return lines
end
function AnotherWordWrap()
	local actualWidth = width-1
	local lines = {}
	local line = 1
	local pos = 1
	local rest = text
	while true do
		local currText = rest:sub(1,actualWidth)
		if #currText < actualWidth then
			lines[line] = currText
			return lines
		end
		local start = currText:find("\n")
		if start then
			lines[line] = rest:sub(1,start-1)
			line = line+1
			rest = rest:sub(start+1,-1)
		elseif currText:find("%s") then
			local hasHappened = false
			for i=#currText,1,-1 do
				if currText:sub(i,i) == " " and not hasHappened then
					lines[line] = currText:sub(1,i)
					rest = rest:sub(i+1,-1)
					line = line+1
					hasHappened = true
				end
			end
		else
			lines[line] = currText
			rest = rest:sub(#currText+1,-1)
			line = line+1
		end
	end
end

local time = os.clock()
local first = wordWrap()
local firstTime = os.clock()-time

local time = os.clock()
local second = AnotherWordWrap()
local secondTime = os.clock()-time

for i,v in pairs(first) do
	print(v)
end
print(firstTime)

for i,v in pairs(second) do
	print(v)
end
print(secondTime)
print(os.clock()," ",os.clock()," ",os.clock())