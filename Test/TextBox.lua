os.loadAPI("Pixel/Pixel")

textbox = Pixel.TextBox({
	x = 3,
	y = 5,
	bgColor = colors.orange,
	textColor = colors.blue,
	helpTextColor = colors.cyan,
	width = 20,
	height = 7,
	helpText = "wow",
	text = "Hi, bruce! How is your day going? SHlagagagagagaagagagagagagagagagaga fjsdfsdf sdf sd fsd f   werwerwerwerwerwe werwerwe  wqrqwrqwr r Hi, bruce! How is your day going? SHlagagagagagaagagagagagagagagagaga fjsdfsdf sdf sd fsd f   werwerwerwerwerwe werwerwe  wqrqwrqwr r",
	bindings = {},
	parent = {},
	application = {},
})

textbox.draw()
term.setCursorPos(60,60)
read()