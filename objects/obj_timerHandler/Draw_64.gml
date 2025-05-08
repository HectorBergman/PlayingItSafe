if !global.pause && room == rm_kitchen{
	// Convert to minutes:seconds format
var total_seconds = floor(gameTimer / 60);
var minutes = floor(total_seconds / 60);
var seconds = total_seconds mod 60;

// Format with leading zero if needed
var seconds_text = string(seconds);
var minutes_text = string(minutes)
if (seconds < 10) seconds_text = "0" + seconds_text;
if (minutes < 10) minutes_text = "0" + minutes_text;

//draw_text(32, 32, "Tide: " + minutes_text + ":" + seconds_text);

var wrapWidth = 1200;	
var text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ 
		   " Tid kvar: \n " + minutes_text + ":" + seconds_text;
var toDraw = scribble(text).wrap(wrapWidth);
toDraw.draw(110, 750);		
}

