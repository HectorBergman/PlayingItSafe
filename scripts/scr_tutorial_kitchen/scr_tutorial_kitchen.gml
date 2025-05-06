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
	var mainX = 1400;
	var mainY = 700;
	ds_list_add(childrenList,summonObject(obj_key, [["x", mainX], ["y", mainY], ["scale", 1], ["key", "S"], ["depth", -2]]))
	ds_list_add(childrenList,summonObject(obj_key, [["x", mainX], ["y", mainY-keyHeight], ["scale", 1], ["key", "W"], ["depth", -1]]))
	ds_list_add(childrenList,summonObject(obj_key, [["x", mainX-keyWidth], ["y", mainY], ["scale", 1], ["key", "A"], ["depth", -1]]))
	ds_list_add(childrenList,summonObject(obj_key, [["x", mainX+keyWidth], ["y", mainY], ["scale", 1], ["key", "D"], ["depth", -1]]))
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
	var mainX = 1400;
	var mainY = 700;
	ds_list_add(childrenList,summonObject(obj_key, [["x", mainX], ["y", mainY], ["scale", 1], ["key", "E"], ["depth", -1]]))
	tStatus = tutorialStatus.ongoing;
}

function kitchenState_hasMoved_ongoing(){
	if inHand.interact{
		destroyChildren();
		tStatus = tutorialStatus.start;
		kitchenState = kitchenStates.hasInteracted;
	}
}

function kitchenState_hasInteracted_control(){
	
}