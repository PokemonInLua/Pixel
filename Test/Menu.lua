os.loadAPI("Pixel/Pixel")
file = Pixel.Menu()
file.set({
	x=1,
	y=1,
	text="File",
	textColor = colors.white,
	bgColor = colors.cyan,
	itemBg = colors.lightGray,
	itemTxt = colors.white,
	onRightClick = function() end,
	items = {
		{
			type = "clickable",
			text = "Open",
			shText = "O",
			shortcut = keys.o,
			onLeftClick = function(self) print("Open Left") sleep(1) end,
			onRightClick = function(self) print("Open Right") end,
		},
		{
			type = "separator",
			char = "-"
		},
		{
			type = "clickable",
			text = "Close",
			shText = "C",
			shortcut = keys.c,
			onLeftClick = function(self) end,
			onRightClick = function(self) end,
		},
	}
})
edit = Pixel.Menu()
edit.set({
	x=file.getWidth()+1,
	y=1,
	text="Edit",
	textColor = colors.white,
	bgColor = colors.cyan,
	itemBg = colors.lightGray,
	itemTxt = colors.white,
	onRightClick = function() end,
	items = {
		{
			type = "clickable",
			text = "Quit",
			shText = "Q",
			shortcut = keys.q,
			onLeftClick = function(self) self.quit() end,
			onRightClick = function(self) end,
		},
		{
			type = "separator",
			char = "-"
		},
		{
			type = "clickable",
			text = "Jokul",
			shText = "J",
			shortcut = keys.j,
			onLeftClick = function(self) end,
			onRightClick = function(self) end,
		},
	}
})


while true do
	term.setBackgroundColor(colors.white)
	term.clear()
	file.draw()
	edit.draw()
	e = {os.pullEvent()}
	file.event(e)
	edit.event(e)
end