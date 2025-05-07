/*function tutorial_dnd_control(){
	switch (dndState){
		case dndStates.none: dndState_none_control(); break;
		case dndStates.mouseMoved: dndState_mouseMoved_control(); break;
		case dndStates.hasDragged: dndState_hasDragged_control(); break;

	}
}
function dndState_none_control(){
	switch (tStatus){
		case tutorialStatus.start: dndState_none_start(); break;
		case tutorialStatus.ongoing: dndState_none_ongoing(); break;
	}
}

function dndState_none_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 0;
	var mainX = 1400;
	var mainY = 700;
	//ds_list_add(childrenList,summonObject(obj_key, [["x", mainX+keyWidth], ["y", mainY], ["scale", 1], ["key", "D"], ["depth", -1]]))
	tStatus = tutorialStatus.ongoing;
}

function dndState_none_ongoing(){
	if prevMousePosition[0] != -99{
		mouseDistanceMoved += point_distance(mouse_x,mouse_y,prevMousePosition[0],prevMousePosition[1]);
	}
	print(mouseDistanceMoved);
	prevMousePosition = [mouse_x,mouse_y];
	if mouseDistanceMoved > 1500{
		destroyChildren();
		tStatus = tutorialStatus.start;
		dndState = dndStates.mouseMoved;
	}
}

function dndState_mouseMoved_control(){
	switch (tStatus){
		case tutorialStatus.start: dndState_mouseMoved_start(); break;
		case tutorialStatus.ongoing: dndState_mouseMoved_ongoing(); break;
	}
}

function dndState_mouseMoved_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 1;
	tStatus = tutorialStatus.ongoing;
}

function dndState_mouseMoved_ongoing(){
	var pointer = instance_find(obj_pointer_vari,0);
	if pointer.holding{
		destroyChildren();
		tStatus = tutorialStatus.start;
		dndState = dndStates.hasDragged;
	}
}

function dndState_hasDragged_control(){
	switch (tStatus){
		case tutorialStatus.start: dndState_hasDragged_start(); break;
		case tutorialStatus.ongoing: dndState_hasDragged_ongoing(); break;
	}	
}

function dndState_hasDragged_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 2;
	tStatus = tutorialStatus.ongoing;
}

function dndState_hasDragged_ongoing(){
	if difficulty >= 4{

		tStatus = tutorialStatus.start;
		dndState = dndStates.difficulty4
	}
}

function dndState_difficulty4_control(){
	switch (tStatus){
		case tutorialStatus.start: dndState_difficulty4_start(); break;
		case tutorialStatus.ongoing: dndState_difficulty4_ongoing(); break;
	}	
}

function dndState_difficulty4_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 3;
	tStatus = tutorialStatus.ongoing;
}

function dndState_difficulty4_ongoing(){
	var thermo = instance_find(obj_thermometer,0);
	if thermo.held{
		tStatus = tutorialStatus.start;
		dndState = dndStates.hasUsedThermometer
	}
}

function dndState_hasUsedThermometer_control(){
	switch (tStatus){
		case tutorialStatus.start: dndState_hasUsedThermometer_start(); break;
		case tutorialStatus.ongoing: dndState_hasUsedThermometer_ongoing(); break;
	}	
}

function dndState_hasUsedThermometer_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 4;
	tStatus = tutorialStatus.ongoing;
}

function dndState_hasUsedThermometer_ongoing(){
	if difficulty >= 8{

		tStatus = tutorialStatus.start;
		dndState = dndStates.difficulty8
	}
}

function dndState_difficulty8_control(){
	switch (tStatus){
		case tutorialStatus.start: dndState_difficulty4_start(); break;
		case tutorialStatus.ongoing: dndState_difficulty4_ongoing(); break;
	}	
}

function dndState_difficulty8_start(){
	yapper.dialogueNoArray[miniHand.currentMinigame] = 5;
	tStatus = tutorialStatus.ongoing;
}

function dndState_difficulty8_ongoing(){
	var thermo = instance_find(obj_thermometer,0);
	if thermo.held{
		tStatus = tutorialStatus.start;
		dndState = dndStates.hasUsedThermometer
	}
}

/*hasUsedThermometer,
	difficulty8,
	timeHasPassed,
	difficulty12,
	hasChangedTemperature,*/
	
