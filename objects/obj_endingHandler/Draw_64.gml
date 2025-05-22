
var wrapWidth = 1200;
var text = ""
text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ "Game over";
var toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
toDraw.draw(1920 / 2, 1080 / 3);	
	
text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ "Tryck Enter för att börja om";
toDraw = scribble(text).wrap(1920).align(fa_center);
toDraw.draw(1920 / 2, 1080*2/3);	

