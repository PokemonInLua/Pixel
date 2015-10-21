os.loadAPI("Pixel/Pixel")
menu = Pixel.Menu()
menu.set({
	x=1,
	y=1,
	text="Menu",
	textColor = colors.white,
	bgColor = colors.cyan,
	itemBg = colors.lightGray,
	itemTxt = colors.cyan,
	items = {
		{
			type = "clickable",
			text = "Open",
			shText = "O",
		},
		{
			type = "separator",
			char = "-"
		},
		{
			type = "clickable",
			text = "Lolssss",
			shText = "O",
		},
	}
})

while true do
	term.setBackgroundColor(colors.white)
	term.clear()
	menu.draw()
	menu.event({os.pullEvent()})
end