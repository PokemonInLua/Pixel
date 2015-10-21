os.loadAPI("Pixel/Pixel")
button = Pixel.Button(3,4)
input = {
	x = 3,
	y = 4,
	width = 16,
	height = 3,
	xText = 2,
	yText = 2,
	text = "I am a button!",
	textColor = colors.white,
	bgColor = colors.cyan,
	textColorOnPress = colors.white,
	bgColorOnPress = colors.cyan,
	onLeftClick = function(self) term.clear() self.move(math.random(1,40),math.random(1,10)) end,
	onRightClick = function(self) term.clear() self.resize(math.random(4,10),math.random(3,10)) end,
}
button.set(input)
term.setbgColor(colors.white)
term.clear()
button.draw()
term.setCursorPos(60,60)
read()