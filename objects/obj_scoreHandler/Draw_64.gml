if !global.pause && room == rm_kitchen{
	//todo: make prettier
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+string(totalScore);
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(90, 40);		
}

if !global.pause && room == rm_ending{
	//todo: make prettier
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,2][$eee7e7][fnt_bitmap_outline_big]"+ "Total Score:\n" +
	string(totalScore);
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(90, 40);		
}