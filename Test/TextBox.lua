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
	text = "Wow",
	bindings = {},
	parent = {},
	application = {},
})

while true do
	textbox.draw()
	textbox.event({os.pullEvent()})
end
