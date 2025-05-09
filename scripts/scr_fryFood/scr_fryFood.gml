function minigame_fryFood_control(){
	switch (minigameStatus){
		case status.started: minigame_fryFood_create(); break;
		case status.ongoing: minigame_fryFood_step(); break;
		case status.finished: minigame_fryFood_finish(); break;
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



function minigame_fryFood_finish(){	
	if checkmark == noone{
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		//var note = instance_find(obj_note_1,0);
		//FFRead = note.FFRead;
		// Check if perfect or not
		if obj_food.after_done_counter >= fryFoodTime {
			scoreHand.currentScore += 30;
			meatInside = true;
		}else{
			scoreHand.currentScore += -30;
			meatInside = false;
			perfect = false;
		}
		if obj_food.image_index == 2{
			scoreHand.currentScore += 30;
			meatOutside = 1;
		} else if obj_food.image_index == 3{
			meatOutside = 2;
			perfect = false;
		}else{
			scoreHand.currentScore += -30;
			meatOutside = 0;
			perfect = false;
		}
		if !perfect{
			checkmark.visible = false;
			ds_list_find_value(mainGameHand.stationsAndAlerts,mainGameHand.activeIndex).stationInfostruct.difficulty -= 1;
		}
		else {
			ds_list_find_value(mainGameHand.stationsAndAlerts,mainGameHand.activeIndex).stationInfostruct.difficulty += 4;
		}
	}else{
		if checkmark.life == checkmark.lifeTime{
			exitMinigame();
			miniHandRefresh();
		}
	}

}