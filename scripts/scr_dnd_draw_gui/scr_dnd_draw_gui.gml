function minigame_dnd_control_draw_gui(){
	switch (minigameStatus){
		case status.started: minigame_dnd_create_draw_gui(); break;
		case status.ongoing: minigame_dnd_step_draw_gui(); break;
		case status.finished: minigame_dnd_finish_draw_gui(); break;
		case status.none: break;
	}
}
function minigame_dnd_create_draw_gui(){


	
	
}


function minigame_dnd_step_draw_gui(){
	
}


function minigame_dnd_finish_draw_gui(){

	scoreResults(scoreHand.currentScore, 
	[scoreResults_generateArray(string(justRightAmnt) + " varor vid rätt temperatur", string(justRightAmnt*20), "2", "$eee7e7"),
	scoreResults_generateArray(string(tooColdAmnt) + " varor vid för kall temperatur", string(tooColdAmnt*10), "2", "$eee7e7"), 
	scoreResults_generateArray(string(tooHotAmnt) + " varor vid för varm temperatur", string(tooHotAmnt*-50), "2", "$eee7e7"),
	noone]);
	// TODO: fler options
//"$61cc14" green
//"$9c0000" red
}

