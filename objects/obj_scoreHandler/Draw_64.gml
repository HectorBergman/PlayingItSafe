if !global.pause && room == rm_kitchen{
	//todo: make prettier
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,4][$eee7e7]"+string(totalScore);
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(90, 40);
}