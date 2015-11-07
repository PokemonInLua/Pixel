os.loadAPI("Pixel/Pixel")

textbox = Pixel.TextBox({
	x = 3,
	y = 5,
	bgColor = colors.orange,
	textColor = colors.blue,
	helpTextColor = colors.cyan,
	width = 20,
	height = 7,
	helpText = "",
	text = "Hi, bruce!",
	bindings = {},
	parent = {},
	application = {},
})

textbox.draw()