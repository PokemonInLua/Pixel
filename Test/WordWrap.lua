local width = 20
local text = "On a \n beautiful sunny day, Creator was sick of Interact. This lead him to start a new project called Pixel. I know, the name's original."
local function wordWrap()
	local actualWidth = width-1
	local lines = {}
	local currLine = 1
	local pos = 1
	lines[currLine] = ""
	local doRun = true
	while true do 
		local char = text:sub(pos,pos)
		print("start")
		print(char)
		print(pos)
		print(lines[currLine])
		print("end")
		read()
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
			while true do
				local lChar = text:sub(lPos,lPos)
				if lChar == "\n" or lChar == " " then
					doRunSub = false
				else
					word = word..lChar
					lPos = lPos+1
				end
			end
			pos = pos+#word
			print("---")
			print("Word: "..tostring(word))
			print("---")
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
function wordWrap()
	local actualWidth = width-1
	local lines = {}
	local currLine = 1
	local spaces = {}
	local space = 1
	for token in text:gmatch("^[%a%c%d]+") do
		spaces[#spaces+1] = token
	end
	for token in text:gmatch("[%a%c%d]+") do
		if token 
	end
end


ok,err = pcall(wordWrap)
file = fs.open("error","w")
file.write(err)
file.close()
if not ok then print(err) end
for i,v in pairs(err) do
	print(v)
end