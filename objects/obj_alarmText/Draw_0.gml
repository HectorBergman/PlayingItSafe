var wrapWidth = 1200;
var text = ""
text = "[scale,1.5][$eee7e7][shake]" + ringText; 
var toDraw = scribble(text).wrap(wrapWidth).align(fa_center,fa_middle);
toDraw.draw(parent.x+xOffset, parent.y+yOffset);