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
	if justRightAmnt > 0{
	}
	var results = [];

	if (justRightAmnt > 0) {
		var plural = "varor"
		if justRightAmnt == 1{
			plural = "vara";
		}
	    array_push(results, scoreResults_generateArray(
	        string(justRightAmnt) + " " + plural + " vid rätt temperatur",
	        "[$61cc14]+" + string(justRightAmnt*15) + " poäng",
	        "2",
	        "$eee7e7"
	    ));
	}

	if (tooColdAmnt > 0) {
		var plural = "varor"
		if tooColdAmnt == 1{
			plural = "vara";
		}
	    array_push(results, scoreResults_generateArray(
	        string(tooColdAmnt) + " " + plural + " vid för kall temperatur",
	        "[$b0c5ff]+" + string(tooColdAmnt*5) + " poäng",
	        "2",
	        "$eee7e7"
	    ));
	}

	if (tooHotAmnt > 0) {
		var plural = "varor"
		if tooHotAmnt == 1{
			plural = "vara";
		}
	    array_push(results, scoreResults_generateArray(
	        string(tooHotAmnt) + " " + plural + " vid för varm temperatur",
	        "[$9c0000]" + string(tooHotAmnt*-30)+ " poäng",
	        "2",
	        "$eee7e7"
	    ));
	}
	array_push(results, noone);
	
	
	scoreResults(scoreHand.currentScore, results, noone);

}
