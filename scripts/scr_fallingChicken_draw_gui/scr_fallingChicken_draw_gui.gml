function minigame_fallingChicken_control_draw_gui(){
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create_draw_gui(); break;
		case status.ongoing: minigame_fallingChicken_step_draw_gui(); break;
		case status.finished: minigame_fallingChicken_finish_draw_gui(); break;
		case status.none: break;
	}
}
function minigame_fallingChicken_create_draw_gui(){


	
	
}


function minigame_fallingChicken_step_draw_gui(){
	
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_fallingChicken_finish_draw_gui(){
	
	
	scoreResults(scoreHand.currentScore);

	// TODO: fler options

}

function scoreResults(totalScore, arguments = noone){
	var wrapWidth = 1200;
	//var scoreText = scribble_typist();
	//scoreText.in(10, 0);
	var text = ""
	var line = 0
	text = "[scale,4][$c20000]Points gained: " + string(totalScore); 
	var toDraw = scribble(text).outline($000023).align(fa_center)
	toDraw.draw(window_get_width()/2, 750);
	
	//line.draw(window_get_width() / 2, 750, scoreText);
	if arguments != noone{
		for (var i = 0; arguments[i] != noone; i++;) {
			text = "[scale,2][$c20000]" + string(arguments[i][0]) + ": " + string(arguments[i][1]);
			line = scribble(text).wrap(wrapWidth).outline($000023).align(fa_center);
			line.draw(window_get_width() / 2, 800+30*i, scoreText);
		}
	}
}
