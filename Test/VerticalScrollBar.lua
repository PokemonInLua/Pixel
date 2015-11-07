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
	percentage = 100,
	interval = 5,
		update = function() term.setCursorPos(1,1)
		print(sc.get().percentage,"  ")
	end
})

--while true do
--	sc.draw()
--	sc.event({os.pullEvent()})
--end

for totalHeight=50,19,-1 do
	sc.set({
		x = 51,
		y = 1,
		parent = {},
		height = 19,
		totalHeight = totalHeight,
		bgColor = colors.green,
		fgColor = colors.blue,
		bgButton = colors.orange,
		fgButton = colors.red,
		percentage = 100,
		interval = 100/(totalHeight-19),
			update = function() term.setCursorPos(1,1)
			print(sc.get().percentage,"  ")
		end
	})
	sc.draw()
	sleep(1)
end