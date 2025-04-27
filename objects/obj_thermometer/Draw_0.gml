draw_self();

var wrapWidth = 1920;
var text = ""
text = "[scale,1][$eee7e7]" + string(string_format(currentTemperature, 1, 1)) + "°C";
var toDraw = scribble(text).wrap(wrapWidth).align(fa_middle).align(fa_center);
toDraw.draw(x,y);

/*draw_line_width(x,y,tempZoneXDebug,tempZoneYDebug, 8);
draw_line_width(x,y,tempZoneXDebug2,tempZoneYDebug2, 4);
draw_line_width(x,y,tempZoneXDebug3,tempZoneYDebug3, 2);
draw_line_width(x,y,tempZoneXDebug4,tempZoneYDebug4, 1);*/