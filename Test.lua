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
	onRightClick = function() term.setCursorPos(20,13) print("wow") end,
}
button.set(input)
button.draw()