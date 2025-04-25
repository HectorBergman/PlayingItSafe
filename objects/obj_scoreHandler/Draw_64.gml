if !global.pause && room == rm_kitchen{
	//todo: make prettier
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,1][$eee7e7]"+string("åäö");//totalScore);
	var toDraw = scribble(text).wrap(wrapWidth);
	toDraw.draw(90, 40);
	draw_text(100,100,"hej åäö");
}