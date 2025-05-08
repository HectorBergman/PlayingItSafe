function tutorial_FF_control(){
	switch (tStatus){
		case status.started: FFState_start(); break;
		case status.ongoing: FFState_ongoing(); break;
	}
}

//create a custom start func like in the commented example case below in case you want to do something
//specific at the start of an instruction, like summon an icon or track something for your instruction
//complete check
function FF_start_func(FFState){
	switch (FFState){
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


function FF_ongoing_func(FFState){ //remember to add new states to the FFStates enum in the tutorialHandler
								   //Note that states have to be in order of appearance on the enum list.
								   //if you want to go to a state out of order, message Hector and we can make
								   //it work. It's easy, but it's on a case-by-case basis.
	switch (FFState){
		case FFStates.none: return FFState_none_ongoing();
	}
}

//do not touch this
function FFState_start(){
	if FF_start_func(FFState){
		tStatus = tutorialStatus.ongoing;
	}
}//do not touch this

//do not touch this
function FFState_ongoing(){
	var truth = FF_ongoing_func(FFState);
	if (truth){
		destroyChildren();
		tStatus = tutorialStatus.start;
		FFState++
		yapper.dialogueNoArray[miniHand.currentMinigame]++
	}
}//do not touch this



function FFState_none_ongoing(){ //return true to progress to next state,
								 //so return true when you feel the player has understood the instruction
								 //like if you're instructing them to move the thermometer
								 //check for if thermometer has been moved,
								 //(then they likely understood the instruction)
	return false
}
