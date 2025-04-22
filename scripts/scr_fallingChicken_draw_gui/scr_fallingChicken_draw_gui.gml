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


function minigame_fallingChicken_finish_draw_gui(){
	

	scoreResults(scoreHand.currentScore, [scoreResults_generateArray("Backflips done: ", 10, "2", "$eee7e7"), noone]);

	// TODO: fler options

}
