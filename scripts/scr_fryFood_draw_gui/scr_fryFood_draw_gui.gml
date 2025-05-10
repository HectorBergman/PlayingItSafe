function minigame_fryFood_control_draw_gui(){
	switch (minigameStatus){
		case status.started: minigame_fryFood_create_draw_gui(); break;
		case status.ongoing: minigame_fryFood_step_draw_gui(); break;
		case status.finished: minigame_fryFood_finish_draw_gui(); break;
		case status.none: break;
	}
}
function minigame_fryFood_create_draw_gui(){


	
	
}


function minigame_fryFood_step_draw_gui(){
	
}


function minigame_fryFood_finish_draw_gui(){
	//meatInside is true for 72 for 2 min, else false
	//meat inside is 0 for too raw, 2 for burnt, 1 for juuuust right
	var meatInsideText = "";
	if (meatInside){
		meatInsideText = "[scale,0.5][spr_correct,36][scale,1] [$61cc14]+30 poäng"
	}else{
		meatInsideText = "[scale,1][spr_wrongmark,0][scale,1] [$9c0000]-30 poäng"
	}
	var meatOutsideText = "";
	if meatOutside == 1{
		meatOutsideText = "Fin! [$61cc14]+30 poäng"
	}else if meatOutside == 0{
		meatOutsideText = "För rå! [$9c0000]-30 poäng"
	}else{
		meatOutsideText = "Bränd! [$9c0000]0 poäng"
	}
	scoreResults(scoreHand.currentScore, 
	[scoreResults_generateArray("72 °C på insidan av köttet i 2 minuter", meatInsideText, "2", "$eee7e7"),
	scoreResults_generateArray("Köttkvalité", meatOutsideText, "2", "$eee7e7"), noone]);

}

