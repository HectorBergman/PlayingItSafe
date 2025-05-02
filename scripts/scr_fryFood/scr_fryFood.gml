function minigame_fryFood_control(){
	switch (minigameStatus){
		case status.started: minigameTemplate_create(); break;
		case status.ongoing: minigameTemplate_step(); break;
		case status.finished: minigameTemplate_finish(); break;
		case status.none: break;
	}
}
function minigame_fryFood_create(){

	//here goes any code you need to start the minigame

	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	minigameStatus = status.ongoing;
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_fryFood_step(){
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met
	
	if minigameComplete{ 
		minigameStatus = status.finished;
	}
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_fryFood_finish(){	
	print("hej");
	if checkmark == noone{
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		
		// Check if perfect or not
		if obj_food.after_done_counter >= obj_food.after_done_timer{
			scoreHand.currentScore += 15; // Don't know if this should be worth more
			
		} else {
			perfect = false;
		}
		
		
		if !perfect{
			checkmark.visible = false;
		}
	}else{
		if checkmark.life == checkmark.lifeTime{
			exitMinigame();
			miniHandRefresh();
		}
	}

}