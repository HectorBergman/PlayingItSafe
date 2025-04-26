draw_self();

var wrapWidth = 1920;
var text = ""
text = "[scale,1][$eee7e7]" + string(currentTemperature) + "°C";
var toDraw = scribble(text).wrap(wrapWidth).align(fa_center).align(fa_middle);
toDraw.draw(x,y);

draw_line_width(x,y,tempZoneXDebug,tempZoneYDebug, 4);