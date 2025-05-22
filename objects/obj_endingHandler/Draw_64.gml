
var wrapWidth = 1200;
var text = ""
text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ "Game over";
var toDraw = scribble(text).wrap(wrapWidth);
toDraw.draw(room_width / 2, room_height / 3);	
	
text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ "Tryck Enter för att börja om";
toDraw = scribble(text).wrap(wrapWidth);
toDraw.draw(room_width / 2, room_height* 2 / 3);	

