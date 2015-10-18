os.loadAPI("Pixel/Pixel")
button = Pixel.Button(3,4)
input = {
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
	onLeftClick = function(self) term.clear() term.setCursorPos(1,1) print("backgroundColor") end,
	onRightClick = function(self) term.clear() self.set({backgroundColor = 2^math.random(1,15)}) self.draw(false,xOffset,yOffset) end,
}
button.set(input)
button.run()