var wrapWidth = 1200;
var text = ""
text = "[scale,1][" + color + "]" + _sign + string(abs(points)) + " poäng"; 
var toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
toDraw.draw(x,y);