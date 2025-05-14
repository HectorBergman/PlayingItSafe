function minigame_WH_control_draw_gui(){
	switch (minigameStatus){
		case status.started: minigame_WH_create_draw_gui(); break;
		case status.ongoing: minigame_WH_step_draw_gui(); break;
		case status.finished: minigame_WH_finish_draw_gui(); break;
		case status.none: break;
	}
}
function minigame_WH_create_draw_gui(){


	
	
}


function minigame_WH_step_draw_gui(){
	
}


function minigame_WH_finish_draw_gui(){
	print("wtf")

	scoreResults(scoreHand.currentScore, noone);


}
