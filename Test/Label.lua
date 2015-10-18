os.loadAPI("Pixel/Pixel")
label = Pixel.Label(1,1,"Hello",colors.white,colors.black)
while true do
	term.setBackgroundColor(colors.black)
	term.clear()
	label.draw()
	x = tonumber(read())
	y = tonumber(read())
	label.move(x,y)
end