function tutorial_dnd_control(){
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
	yapper.dialogueNo = 0;
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
	if mouseDistanceMoved > 3000{
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
	print("hello");
	yapper.dialogueNo = 1;
	/*var mainX = 1400;
	var mainY = 700;
	ds_list_add(childrenList,summonObject(obj_key, [["x", mainX], ["y", mainY], ["scale", 1], ["key", "E"], ["depth", -1]]))
	tStatus = tutorialStatus.ongoing;*/
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
	yapper.dialogueNo = 2;
	
}