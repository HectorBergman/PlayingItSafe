function minigame_fallingChicken_control(){
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create(); break;
		case status.ongoing: minigame_fallingChicken_step(); break;
		case status.finished: minigame_fallingChicken_finish(); break;
		case status.none: break;
	}
}

function minigame_fallingChicken_create(){
	
	if (!instance_exists(obj_pointer_menu)) {
		instance_create_layer(0, 0, "Instances", obj_pointer_menu);
	}
	
	// TODO: Add pressed mouse
	 if (keyboard_check_pressed(vk_enter) || keyboard_check(vk_space)) {
        minigameStatus = status.ongoing;
    }
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_fallingChicken_step()
{
	
	if (!instance_exists(obj_pointer_menu)) {
		instance_create_layer(0, 0, "Instances", obj_pointer_menu);
	}
	
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met

	scoreHand.currentScore = global.drop_score;
}

function minigame_fallingChicken_finish(){
	if checkmark == noone{
		scoreHand.currentScore = global.drop_score;
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		// code for checking if perfect or not goes here
		if !perfect{
		 checkmark.visible = false;
		}
	}else{
		if checkmark.life == checkmark.lifeTime{
			
			var handler = instance_find(obj_minigameHandler, 0);
			if (instance_exists(handler)) {
				handler.fallingChickenDifficulty += 1;
			}
			
			exitMinigame();
			miniHandRefresh();
		}
			
	}

}