draw_self();

var wrapWidth = 1920;
var text = "";

if place_meeting(x, y, obj_food)
{

	text = "[scale,1][$eee7e7]" + string(string_format(obj_food.temp, 1, 1)) + "°C";
	var toDraw = scribble(text).wrap(wrapWidth).align(fa_middle).align(fa_center);
	toDraw.draw(x - 75, y + 40);
} else 
{

	text = "[scale,1][$eee7e7]" + string(string_format(roomTemp, 1, 1)) + "°C";
	var toDraw = scribble(text).wrap(wrapWidth).align(fa_middle).align(fa_center);
	toDraw.draw(x - 75, y + 40);
}