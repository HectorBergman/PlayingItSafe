function minigame_fallingChicken_control(){
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create(); break;
		case status.ongoing: minigame_fallingChicken_step(); break;
		case status.finished: minigame_fallingChicken_finish(); break;
		case status.none: break;
	}
}
function minigame_fallingChicken_create(){
	
	// TODO: Add pressed mouse
	 if (keyboard_check_pressed(vk_enter) || keyboard_check(vk_space)) {
        minigameStatus = status.ongoing;
    }
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_fallingChicken_step(){
	
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met
	
	// if minigameComplete{ 
		// checkmark = 1;
		
		// var handler = instance_find(obj_minigameHandler, 0);
		// if (instance_exists(handler)) {
		// 	handler.fallingChickenDifficulty += 1;
		// }

		// minigameStatus = status.finished;
	// }
	scoreHand.currentScore = global.drop_score;
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_fallingChicken_finish(){
	
	

	// if (keyboard_check_pressed(ord("R"))) {
		// global.fallingChickenIntroShown = false; // Reset for next round
	//	room_goto(rm_kitchen); // Change this to your actual gameplay room
	// }
	

	if checkmark == noone{
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
			
			// ---- DIFFICULTY ----
			// fallingChickenDifficulty += 1;
			// exitMinigame();
			// miniHandRefresh();
		}

}