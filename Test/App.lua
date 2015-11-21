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
		event = {coroutine.yield()}
	end
 end)

lay = Pixel.Layout({
	x=1,
	y=1,
	width=50,
	height=40,
	color=colors.white,
	transparent=false,
	isActive=true,
	})
button = Pixel.Button({
	x = 3,
	y = 4,
	width = 4,
	height = 3,
	xText = 2,
	yText = 2,
	text = "OK",
	textColor = colors.orange,
	backgroundColor = colors.black,
	textColorOnPress = colors.white,
	backgroundColorOnPress = colors.cyan,
	onLeftClick = function(self) term.clear() self.move(math.random(1,40),math.random(1,10)) end,
	onRightClick = function(self) end,
})
lay.addChild(button)
button1 = Pixel.Button({
	x = 3,
	y = 30,
	width = 4,
	height = 3,
	xText = 2,
	yText = 2,
	text = "OK",
	textColor = colors.orange,
	backgroundColor = colors.black,
	textColorOnPress = colors.white,
	backgroundColorOnPress = colors.cyan,
	onLeftClick = function(self) term.clear() self.move(math.random(1,40),math.random(1,10)) end,
	onRightClick = function(self) end,
})
lay.addChild(button1)
scrollBar = Pixel.VerticalScrollBar({
	x = 51,
	y = 1,
	height = 19,
	totalHeight = 40,
	bgColor = colors.cyan,
	fgColor = colors.orange,
	bgButton = colors.white,
	fgButton = colors.cyan,
	percentage = 0,
	update = lay.verticalScroll,
	interval = 100/21,
})

local scr = Pixel.Screen({
	layout = lay
})


app.addScreen("term",scr)
app.run("terminate")