var wrapWidth = 1200;
var text = ""
text = "[scale,1][$eee7e7]" + ringText; 
var toDraw = scribble(text).wrap(wrapWidth);
toDraw.draw(parent.x+xOffset, parent.y+yOffset);