function minigame_washingHands_control(){
	switch (minigameStatus){
		case status.started: minigame_washingHands_create(); break;
		case status.ongoing: minigame_washingHands_step(); break;
		case status.finished: minigame_washingHands_finish(); break;
		case status.none: break;
	}
}
function minigame_washingHands_create(){

	//here goes any code you need to start the minigame

	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	minigameStatus = status.ongoing;
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_washingHands_step(){
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met
	
	if minigameComplete{ 
		minigameStatus = status.finished;
	}
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_washingHands_finish(){
	if checkmark == noone{
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		//code for checking if perfect or not goes here
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

function generateRandomLetter(){
    var randLetter = irandom_range(0, lettersArrayLength - 1)
    return letters[randLetter]
}


enum tapState {
    OFF,
    ON
}
