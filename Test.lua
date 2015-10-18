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
	onLeftClick = "term.setCursorPos(20,13) print(\"wow\")",
	onRightClick = "term.clear() backgroundColor = math.random(1,15)^2"
}
button.set(input)
button.run()