function tutorial_dnd_control(){
	switch (tStatus){
		case status.started: dndState_start(); break;
		case status.ongoing: dndState_ongoing(); break;
	}
}


function dnd_start_func(dndState){
	switch (dndState){
		default: return true;
	}
}

function dnd_ongoing_func(dndState){
	print(dndState);
	switch (dndState){
		case dndStates.none: return dndState_none_ongoing();
		case dndStates.mouseMoved: return dndState_mouseMoved_ongoing();
		case dndStates.hasDragged: return dndState_hasDragged_ongoing();
		case dndStates.finishFound: return dndState_finishFound_ongoing();
		case dndStates.difficulty4: return dndState_difficulty4_ongoing();
		case dndStates.thermoInfo: return dndState_thermoInfo_ongoing();
		case dndStates.hasUsedThermometer: return dndState_hasUsedThermometer_ongoing();
		case dndStates.difficulty8: return dndState_difficulty8_ongoing();
		case dndStates.finishFound2: return dndState_finishFound2_ongoing();
		case dndStates.difficulty12: return dndState_difficulty12_ongoing();
		case dndStates.hasChangedTemperature: return dndState_hasChangedTemperature_ongoing();
	}
}


function dndState_start(){
	if dnd_start_func(dndState){
		tStatus = tutorialStatus.ongoing;
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



function dndState_none_ongoing(){

	if prevMousePosition[0] != -99{
		mouseDistanceMoved += point_distance(mouse_x,mouse_y,prevMousePosition[0],prevMousePosition[1]);
	}
	prevMousePosition = [mouse_x,mouse_y];
	print(mouseDistanceMoved);
	return mouseDistanceMoved > 1500
}

function dndState_mouseMoved_ongoing(){
	var pointer = instance_find(obj_pointer_vari,0);
	return pointer.holding

}

function dndState_hasDragged_ongoing(){
	return miniHand.minigameStatus = status.finished		
}

function dndState_finishFound_ongoing(){
	return miniHand.difficulty >= 4
}


function dndState_difficulty4_ongoing(){
	var thermo = instance_find(obj_thermometer,0);
	var truth = false;
	if !thermo.held{ //if the thermometer is placed down inside the fridge, return true
		with thermo{
			var area = noone
			area = instance_place(x,y,obj_clearCheckHitbox_variant);
			if area != noone{
				if area.area != -1{
					truth = true;
				}
			}
		}
	}
	return truth;
}

function dndState_thermoInfo_ongoing(){
	thermoTimer++
	if dnd_ongoing_func(dndState+1){
		dndState++
		yapper.dialogueNoArray[miniHand.currentMinigame]++
		return true;
	}else if thermoTimer >= thermoTime{
		return true;
	}
	return false;
}

function dndState_hasUsedThermometer_ongoing(){
	return miniHand.difficulty >= 8
}

function dndState_difficulty8_ongoing(){
	return miniHand.minigameStatus = status.finished
}

function dndState_finishFound2_ongoing(){
	return miniHand.difficulty >= 12
}
function dndState_difficulty12_ongoing(){
	var button1 = instance_find(obj_fridgeButton,0);
	var button2 = instance_find(obj_fridgeButton,1);
	return button1.clicked || button2.clicked;
}
function dndState_hasChangedTemperature_ongoing(){
	
}


/*hasUsedThermometer,
	difficulty8,
	timeHasPassed,
	difficulty12,
	hasChangedTemperature,*/
	
