function minigame_fallingChicken_control(){
	switch (minigameStatus){
		case status.started: minigame_fallingChicken_create(); break;
		case status.ongoing: minigame_fallingChicken_step(); break;
		case status.finished: minigame_fallingChicken_finish(); break;
		case status.none: break;
	}
}
function minigame_fallingChicken_create(){

	//here goes any code you need to start the minigame
	// if (keyboard_check_pressed(vk_enter)) {
	// 	minigameStatus = status.ongoing;
	// }
	
	if (keyboard_check_pressed(vk_enter) || keyboard_check(vk_space)) {
        minigameStatus = status.ongoing;
    }
	
	// if (room != rm_falling_chicken_start) {
		// global.fallingChickenIntroShown = true;
	//	room_goto(rm_falling_chicken_start);
	//	return;
	// }
	

	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_fallingChicken_step(){
	
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met
	
	if minigameComplete{ 
		checkmark = 1;
		minigameStatus = status.finished;
	}
	scoreHand.currentScore = global.drop_score;
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_fallingChicken_finish(){

	if (keyboard_check_pressed(ord("R"))) {
		// global.fallingChickenIntroShown = false; // Reset for next round
		room_goto(rm_kitchen); // Change this to your actual gameplay room
	}
	if checkmark == noone{
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		//code for checking if perfect or not goes here
		if !perfect{
			checkmark.visible = false;
		}
	}else{
		if checkmark.life == checkmark.lifeTime && inHand.anyKey{
			exitMinigame();
			miniHandRefresh();
		}
	}

}