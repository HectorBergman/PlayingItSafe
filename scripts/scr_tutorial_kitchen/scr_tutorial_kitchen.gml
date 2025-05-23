function tutorial_kitchen_control(){
	switch (kitchenState){
		case kitchenStates.none: kitchenState_none_control(); break;
		case kitchenStates.hasMoved: kitchenState_hasMoved_control(); break;
		case kitchenStates.hasInteracted: kitchenState_hasInteracted_control(); break;
	}
}
function kitchenState_none_control(){
	switch (tStatus){
		case tutorialStatus.start: kitchenState_none_start(); break;
		case tutorialStatus.ongoing: kitchenState_none_ongoing(); break;
	}
}
function kitchenState_none_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 0;
	var mainX = 1600;
	var mainY = 800;
	var cooldown = 0;
	var popup = 20;
	var time = 200;
	var increase = 30;
	ds_list_add(childrenList,summonObject(obj_key, [["timer" , 0], ["time", time],["cooldown", cooldown], ["popup", popup],["x", mainX], ["y", mainY], ["scale", 1], ["key", "S"], ["depth", -2]]))
	ds_list_add(childrenList,summonObject(obj_key, [["timer" , increase*3], ["time", time],["cooldown", cooldown], ["popup", popup],["x", mainX], ["y", mainY-keyHeight], ["scale", 1], ["key", "W"], ["depth", -1]]))
	ds_list_add(childrenList,summonObject(obj_key, [["timer" , increase], ["time", time],["cooldown", cooldown], ["popup", popup],["x", mainX-keyWidth], ["y", mainY], ["scale", 1], ["key", "A"], ["depth", -1]]))
	ds_list_add(childrenList,summonObject(obj_key, [["timer" , increase*2], ["time", time],["cooldown", cooldown], ["popup", popup],["x", mainX+keyWidth], ["y", mainY], ["scale", 1], ["key", "D"], ["depth", -1]]))
	tStatus = tutorialStatus.ongoing;
}

function kitchenState_none_ongoing(){
	if (inHand.moveLeft){
		hasMovedAllDirectionsArray[0] = true;
	}
	if (inHand.moveRight){
		hasMovedAllDirectionsArray[1] = true;
	}
	if (inHand.moveUp){
		hasMovedAllDirectionsArray[2] = true;
	}
	if (inHand.moveDown){
		hasMovedAllDirectionsArray[3] = true;
	}
	
	if hasMovedAllDirectionsArray[0] && hasMovedAllDirectionsArray[1] && hasMovedAllDirectionsArray[2] && hasMovedAllDirectionsArray[3]{
		destroyChildren();
		tStatus = tutorialStatus.start;
		kitchenState = kitchenStates.hasMoved;
	}
}

function kitchenState_hasMoved_control(){
	switch (tStatus){
		case tutorialStatus.start: kitchenState_hasMoved_start(); break;
		case tutorialStatus.ongoing: kitchenState_hasMoved_ongoing(); break;
	}
}

function kitchenState_hasMoved_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 1;
	var mainX = 1600;
	var mainY = 800;
	ds_list_add(childrenList,summonObject(obj_key, [["timer" , 30], ["time", 90],["cooldown", 0], ["popup", 30], ["x", mainX], ["y", mainY], ["scale", 1], ["key", "E"], ["depth", -1]]))
	tStatus = tutorialStatus.ongoing;
}

function kitchenState_hasMoved_ongoing(){
	if inHand.interact{
		destroyChildren();
		tStatus = tutorialStatus.start;
		kitchenState = kitchenStates.hasInteracted;
		yapper.dialogueNoArray[miniHand.currentMinigame] = 2;
	}
}

function kitchenState_hasInteracted_control(){
	
	
}