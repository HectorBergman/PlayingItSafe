tap_on = false; // Tap starts off
image_speed = 0; // Ensure correct sprite frame
image_index = 0;

// Start in OFF state
global.tap_state = tapState.OFF;

water = noone;

function tapText(newText){
	//todo: customize
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,4][$eee7e7]"+string(newText); //$eee7e7 is color in hexadecimal, change this to change text color
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(10, 450); //x and y coordinate where text will be drawn
	//fråga Hector om ni undrar något mer
}