os.loadAPI("Pixel/Pixel")
menu = Pixel.Menu()
menu.set({
	x=1,
	y=1,
	text="Menu",
	textColor = colors.white,
	backgroundColor = colors.cyan,
	items = {
		{
			type = "clickable",
			text = "Open",
			shText = "O",
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