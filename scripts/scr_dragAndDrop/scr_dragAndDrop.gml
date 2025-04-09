function minigame_dragAndDrop_control(){
	switch (minigameStatus){
		case status.started: minigame_dragAndDrop_create(); break;
		case status.ongoing: minigame_dragAndDrop_step(); break;
		case status.finished: minigame_dragAndDrop_finish(); break;
		case status.none: break; //maybe add crash here
	}
}


function minigame_dragAndDrop_create(){
	
	//correctArea, sprite
	//spr_bananas = -1, spr_milk = 0, spr_pizza = 1;
	for (var i = 0; i < difficulty; i++){
		var randomInt = irandom_range(-1,1);
		var sprite = noone;
		if randomInt == -1{
			sprite = spr_bananas
		}else if randomInt == 0{
			sprite = spr_milk
		}else if randomInt == 1{
			sprite = spr_pizza
		}
		summonObject(obj_dragAndDrop_item, [["x", i*60], ["y", 318], ["correctArea", randomInt], ["sprite", sprite]]);
	}
	var highestI = 0;
	for (var i = 0; i < instance_number(obj_dragAndDrop_item); i++) {
	    var inst = instance_find(obj_dragAndDrop_item, i);
	    itemsArray[i] = inst;
		highestI = i;
	}
	itemsArray[highestI + 1] = noone; //lazy crash prevention for for-loops

	for (var i = 0; i < instance_number(obj_doors); i++) {
	    var inst = instance_find(obj_doors, i);
	    doorsArray[i] = inst;
		highestI = i;
	}
	doorsArray[highestI + 1] = noone;

	//the above code puts all items and doors into arrays

	minigameStatus = status.ongoing;
}


function minigame_dragAndDrop_step(){
	var minigameComplete = true;
	
	for (var i = 0; doorsArray[i] != noone; i++;) {
	
		if doorsArray[i].image_index != 1{ //if any doors are open, minigame not completed
			minigameComplete = false;
		}
	}
	if minigameComplete{ //todo: add more code for handling minigame completion
						 //increase complexity of minigame
		minigameStatus = status.finished;
	}
}

function minigame_dragAndDrop_finish(){
	if checkmark == noone{
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		for (var i = 0; itemsArray[i] != noone; i++;) {
			if itemsArray[i].inPosition{ //for every item in it's right place,
										 //give 30 points
				scoreHand.currentScore += 30
					
			}else{
				perfect = false;
			}
		}
		if !perfect{
			checkmark.visible = false; //todo: come up with a better alternative for failed minigame
		}
	}else{

		if checkmark.life == checkmark.lifeTime{
			exitMinigame();
			miniHandRefresh();
		}
	}
}
