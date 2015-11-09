os.loadAPI("Pixel/Pixel")

textbox = Pixel.TextBox({
	x = 3,
	y = 5,
	bgColor = colors.orange,
	textColor = colors.blue,
	helpTextColor = colors.cyan,
	width = 20,
	height = 7,
	helpText = "On a \n beautiful sunny day, Creator was sick of Interact. This lead him to start a new project called Pixel. I know, the name's original.",
	text = "On a \n beautiful sunny day, Creator was sick of Interact. This lead him to start a new project called Pixel. I know, the name's original.",
	bindings = {},
	parent = {},
	application = {},
})

while true do
	textbox.draw()
	textbox.event({os.pullEvent()})
end
