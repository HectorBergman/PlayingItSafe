function minigame_fallingChicken_control(){
	print(minigameStatus);
	print("------");
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create(); break;
		case status.ongoing: minigame_fallingChicken_step(); break;
		case status.finished: minigame_fallingChicken_finish(); break;
		case status.none: break;
	}
}

function minigame_fallingChicken_create(){
	
	if (!instance_exists(obj_pointer_FC)) {
		summonObject(obj_pointer_FC, [["image_xscale", 2], ["image_yscale",2], ["gui", false]])
	}
	

	 
    minigameStatus = status.ongoing;
    
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_fallingChicken_step()
{
	
	if (!instance_exists(obj_pointer_FC)) {
		summonObject(obj_pointer_FC, [["image_xscale", 2], ["image_yscale",2], ["gui", false]])
	}
	
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met

	scoreHand.currentScore = global.drop_score;
}

function minigame_fallingChicken_finish(){
	if checkmark == noone{
		scoreHand.currentScore = global.drop_score*5;
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		// code for checking if perfect or not goes here
		if !perfect{
		 checkmark.visible = false;
		}
	}else{
		if checkmark.life == checkmark.lifeTime{
			
			ds_list_find_value(mainGameHand.stationsAndAlerts,mainGameHand.activeIndex).stationInfostruct.difficulty += 1;
			
			instance_destroy(instance_find(obj_pointer_FC,0));
			exitMinigame();
			miniHandRefresh();
		}
			
	}

}