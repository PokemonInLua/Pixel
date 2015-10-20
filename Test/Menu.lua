os.loadAPI("Pixel/Pixel")
menu = Pixel.Menu()
menu.set({
	x=1,
	y=1,
	text="Menu",
	textColor = colors.white,
	backgroundColor = colors.cyan,
})

term.setBackgroundColor(colors.white)
term.clear()
menu.draw()
term.setCursorPos(60,60)
read()