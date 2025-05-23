function tutorial_WH_control(){
	switch (tStatus){
		case status.started: WHState_start(); break;
		case status.ongoing: WHState_ongoing(); break;
	}
}

//create a custom start func like in the commented example case below in case you want to do something
//specific at the start of an instruction, like summon an icon or track something for your instruction
//complete check
function WH_start_func(WHState){
	switch (WHState){
		//case ExampleStates.backflip return ExampleState_backflip_ongoing();
		default: return true;
	}
}

//in this example, we summon an icon obj_coolInformativeIcon, note that we add it do the list childrenList,
//as that ensures it gets removed once the instruction has passed.
//then we set usefulTrackingVariable to 0
//finally we return true to progress to ongoing

//function ExampleState_backflip_ongoing(){
//		ds_list_add(childrenList,summonObject(obj_coolInformativeIcon));
//		usefulTrackingVariable = 0;
//		return true;
//}


function WH_ongoing_func(WHState){ //remember to add new states to the WHStates enum in the tutorialHandler
								   //Note that states have to be in order of appearance on the enum list.
								   //if you want to go to a state out of order, message Hector and we can make
								   //it work. It's easy, but it's on a case-by-case basis.
	switch (WHState){
		case WHStates.none: return WHState_none_ongoing();
		case WHStates.mouseMoved: return WHState_mouseMoved_ongoing();
		case WHStates.tapPressed: return WHState_tapPressed_ongoing();
		case WHStates.handWet: return WHState_handsWet_ongoing();
		case WHStates.soapPressed: return WHState_soapPressed_ongoing();
		case WHStates.keyPressed: return WHState_keyPressed_ongoing();
		case WHStates.icy: return WHState_icy_ongoing();
		case WHStates.finished: return WHState_finished_ongoing();
	}
}

//do not touch this
function WHState_start(){
	if WH_start_func(WHState){
		tStatus = tutorialStatus.ongoing;
	}
}//do not touch this

//do not touch this
function WHState_ongoing(){
	var truth = WH_ongoing_func(WHState);
	if (truth){
		destroyChildren();
		tStatus = tutorialStatus.start;
		WHState++
		yapper.dialogueNoArray[miniHand.currentMinigame]++
	}
}//do not touch this



function WHState_none_ongoing(){ //return true to progress to next state,
								 //so return true when you feel the player has understood the instruction
								 //like if you're instructing them to click on the soap to soap your hands,
								 //check for when soap has been clicked
								 //(then they likely understood the instruction)
	return true
}


function WHState_mouseMoved_ongoing(){
	if prevMousePosition[0] != -99{
		mouseDistanceMoved += point_distance(mouse_x,mouse_y,prevMousePosition[0],prevMousePosition[1]);
	}
	prevMousePosition = [mouse_x,mouse_y];
	print(mouseDistanceMoved);
	return mouseDistanceMoved > 1500

}

function WHState_tapPressed_ongoing(){
	if instance_exists(obj_water){
		return true;
	}
}

function WHState_handsWet_ongoing(){
	if instance_exists(obj_waterDrop){
		return true;
	}
}

function WHState_soapPressed_ongoing(){
	if instance_exists(obj_soapSquirt){
		return true;
	}
}


function WHState_keyPressed_ongoing(){
	return keyboard_check_pressed(vk_anykey);
}

function WHState_icy_ongoing(){
	return miniHand.difficulty >= 4;
}

function WHState_finished_ongoing(){
	var ice = instance_find(obj_ice, 0);
	var tray = instance_find(obj_vanityTray, 0);
	
	return point_distance(ice.x, ice.y, tray.x, tray.y) <= 256;
	
	
}

