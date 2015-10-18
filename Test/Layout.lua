term.clear()
os.loadAPI("Pixel/Pixel")
lay = Pixel.Layout(1,1)
button = Pixel.Button(3,4)
input = {
	x = 3,
	y = 4,
	width = 4,
	height = 3,
	xText = 2,
	yText = 2,
	text = "OK",
	textColor = colors.orange,
	backgroundColor = colors.black,
	textColorOnPress = colors.white,
	backgroundColorOnPress = colors.cyan,
	onLeftClick = function(self) term.clear() self.move(math.random(1,40),math.random(1,10)) end,
	onRightClick = function(self) term.clear() self.resize(math.random(4,10),math.random(3,10)) end,
}
button.set(input)
lay.addChild(button)
lay.draw()

while true do
	lay.event(os.pullEvent())
	lay.draw()
end