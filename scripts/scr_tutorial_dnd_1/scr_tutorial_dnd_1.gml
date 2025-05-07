function tutorial_dnd_control(){
	switch (tStatus){
		case status.started: dndState_start(); break;
		case status.ongoing: dndState_ongoing(); break;
	}
}
function dndState_start(){
	if dnd_start_func(dndState){
		tStatus = tutorialStatus.ongoing;
	}
}
function dnd_start_func(dndState){
	switch (dndState){
		default: return true;
	}
}

function dndState_ongoing(){
	var truth = dnd_ongoing_func(dndState);
	if (truth){
		destroyChildren();
		tStatus = tutorialStatus.start;
		dndState++
		yapper.dialogueNoArray[miniHand.currentMinigame]++
	}
}
function dnd_ongoing_func(dndState){
	print(dndState);
	switch (dndState){
		case dndStates.none: return dndState_none_ongoing();
		case dndStates.mouseMoved: return dndState_mouseMoved_ongoing();
		case dndStates.hasDragged: return dndState_hasDragged_ongoing();
		case dndStates.difficulty4: return dndState_difficulty4_ongoing();
		case dndStates.hasUsedThermometer: return dndState_hasUsedThermometer_ongoing();
	}
}


function dndState_none_ongoing(){

	if prevMousePosition[0] != -99{
		mouseDistanceMoved += point_distance(mouse_x,mouse_y,prevMousePosition[0],prevMousePosition[1]);
	}
	prevMousePosition = [mouse_x,mouse_y];
	print(mouseDistanceMoved);
	return mouseDistanceMoved > 1500
}

function dndState_mouseMoved_ongoing(){
	print("hejjj");
	var pointer = instance_find(obj_pointer_vari,0);
	return pointer.holding

}




function dndState_hasDragged_ongoing(){
	return miniHand.difficulty >= 4
}




function dndState_difficulty4_ongoing(){
	var thermo = instance_find(obj_thermometer,0);
	return thermo.held
}



function dndState_hasUsedThermometer_ongoing(){
	return miniHand.difficulty >= 8
}



function dndState_difficulty8_ongoing(){

}

/*hasUsedThermometer,
	difficulty8,
	timeHasPassed,
	difficulty12,
	hasChangedTemperature,*/
	
