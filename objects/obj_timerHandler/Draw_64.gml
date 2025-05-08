if !global.pause && room == rm_kitchen{
	var secondsLeft = ceil(gameTimer / 60); // Convert to seconds

	var wrapWidth = 1200;
	var text = ""
	text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ "Tid kvar: \n    "
													   + string(ceil(gameTimer/60));
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(120, 800);	
}
