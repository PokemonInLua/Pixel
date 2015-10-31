x = 5
y = 5
while true do
  term.setBackgroundColor( colors.black )
  term.clear()
  paintutils.drawPixel( x, y, colors.red )
 
  event, button, xPos, yPos = os.pullEvent("mouse_drag")

  if button == 1 then -- left button was clicked
    x = xPos
    y = yPos
  end
end