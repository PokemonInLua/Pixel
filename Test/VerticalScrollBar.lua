os.loadAPI("Pixel/Pixel")
sc = Pixel.VerticalScrollBar()
sc.set({
	x = 51,
	y = 1,
	parent = {},
	height = 19,
	totalHeight = 38,
	bgColor = colors.green,
	fgColor = colors.blue,
	bgButton = colors.orange,
	fgButton = colors.red,
	percentage = 1,
})

sc.draw()

read()