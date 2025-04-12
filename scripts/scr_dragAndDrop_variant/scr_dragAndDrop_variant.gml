function minigame_dragAndDrop_variant_control(){
	switch (minigameStatus){
		case status.started: minigame_dragAndDrop_variant_create(); break;
		case status.ongoing: minigame_dragAndDrop_variant_step(); break;
		case status.finished: minigame_dragAndDrop_variant_finish(); break;
		case status.none: break;
	}
}

function minigame_dragAndDrop_variant_create(){
	//correctArea, sprite
	//spr_bananas = -1, spr_milk = 0, spr_pizza = 1;
	for (var i = 0; i < difficulty; i++){
		var randomInt = irandom_range(0,2);
		var sprite = noone;
		if randomInt == 0{
			sprite = spr_fish
		}else if randomInt == 1{
			sprite = spr_milk
		}else if randomInt == 2{
			sprite = spr_foodbox
		}
		summonObject(obj_dragAndDrop_item_vari, [["x", i*60], ["y", 318], ["correctArea", randomInt], ["sprite", sprite]]);
	}
	var highestI = 0;
	for (var i = 0; i < instance_number(obj_dragAndDrop_item_vari); i++) {
	    var inst = instance_find(obj_dragAndDrop_item_vari, i);
	    itemsArray[i] = inst;
		highestI = i;
		print(inst.sprite_index);
	}
	print(highestI);
	itemsArray[highestI + 1] = noone; //lazy crash prevention for for-loops
	//here goes any code you need to start the minigame

	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	minigameStatus = status.ongoing;
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_dragAndDrop_variant_step(){

	var minigameComplete = true;
	
	//if requirements for minigame completion not met:

	//or alternatively just have it be false and set to true when conditions met
	for (var i = 0; itemsArray[i] != noone; i++;) {
		print(itemsArray[i].sprite_index);
		print(itemsArray[i].inPosition);
		if itemsArray[i].inPosition{ //for every item in it's right place,
										//give 30 points
			//scoreHand.currentScore += 30
			print("we made it");
		}else{
			minigameComplete = false;
			print("damn");
			break;
		}
	}
	if minigameComplete{ 
		minigameStatus = status.finished;
	}
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_dragAndDrop_variant_finish(){
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