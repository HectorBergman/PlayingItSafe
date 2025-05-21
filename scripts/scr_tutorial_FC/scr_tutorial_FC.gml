function tutorial_FC_control(){
	switch (tStatus){
		case status.started: FCState_start(); break;
		case status.ongoing: FCState_ongoing(); break;
	}
}

//create a custom start func like in the commented example case below in case you want to do something
//specific at the start of an instruction, like summon an icon or track something for your instruction
//complete check
function FC_start_func(FCState){
	switch (FCState){
		case FCStates.none: return FCState_none_start(); 
		case FCStates.pilotFood: return FCState_pilotFood_start();
		case FCStates.waitForFood: return FCState_waitForFood_start();
		case FCStates.pilotDifferentFood: return FCState_pilotDifferentFood_start();
		case FCStates.waitForDifficultyIncrease: return FCState_waitForDifficultyIncrease_start();
		case FCStates.teachDragging: return FCState_teachDragging_start();
		case FCStates.teachWashing: return FCState_teachWashing_start();

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


function FC_ongoing_func(FCState){ //remember to add new states to the FCStates enum in the tutorialHandler
								   //Note that states have to be in order of appearance on the enum list.
								   //if you want to go to a state out of order, message Hector and we can make
								   //it work. It's easy, but it's on a case-by-case basis.
	print(FCState);
	switch (FCState){
		case FCStates.none: return FCState_none_ongoing();
		case FCStates.pilotFood: return FCState_pilotFood_ongoing();
		case FCStates.waitForFood: return FCState_waitForFood_ongoing();
		case FCStates.pilotDifferentFood: return FCState_pilotDifferentFood_ongoing();
		case FCStates.waitForDifficultyIncrease: return FCState_waitForDifficultyIncrease_ongoing();
		case FCStates.teachDragging: return FCState_teachDragging_ongoing();
		case FCStates.teachWashing: return FCState_teachWashing_ongoing();
		
	}
}

//do not touch this
function FCState_start(){
	if FC_start_func(FCState){
		tStatus = tutorialStatus.ongoing;
	}
}//do not touch this

//do not touch this
function FCState_ongoing(){
	var truth = FC_ongoing_func(FCState);
	if (truth){
		destroyChildren();
		tStatus = tutorialStatus.start;
		FCState++
		yapper.dialogueNoArray[miniHand.currentMinigame]++
	}
}//do not touch this

function FCState_none_start(){
	FCtutTimer = 0;
	FCtutTime = 180;
	return true;
}

function FCState_none_ongoing(){ //return true to progress to next state,
								 //so return true when you feel the player has understood the instruction
								 //like if you're instructing them to move a falling chicken,
								 //check for when left & right keys or A and D have been pressed,
								 //(then they likely understood the instruction)
								 print(FCtutTimer)
								 print(FCtutTime);
								 print("------");
	if room == rm_falling_chicken{
		if inHand.moveDown{
			FCtutTimer += 2
		}else{
			FCtutTimer++;
		}
		if FCtutTimer >= FCtutTime{
			return true;
		}
		return false;
	}else{return false;};
}

function FCState_pilotFood_start(){
	global.chickenPause = true;
	food = instance_find(obj_food_parent, 1);
	return true;
}

function FCState_pilotFood_ongoing(){
	print("amIhere");
	print(food);
	if(inHand.moveLeft)
	{
		hasMoved[0] = true;
		food.x -= 5;
	}
	if(inHand.moveRight)
	{
		hasMoved[1] = true;
		food.x += 5;
	}	
	if hasMoved[0] && hasMoved[1]{
		global.chickenPause = false;
		return true;
	}else{
		return false
	}
}

function FCState_pilotDifferentFood_start(){
	global.chickenPause = true;
	for (var i = 0; i < instance_number(obj_food_parent); i++){
		food = instance_find(obj_food_parent, i);
		if food.is_active{
			break;
		}
	}
	FCtutTimer = -60;
	return true;
	
}
function FCState_waitForFood_start(){
	FCtutTimer = -99999;
	return true;
}

function FCState_waitForDifficultyIncrease_start(){
	FCtutTimer = 0;
	return true;
}
function FCState_teachDragging_start(){
	global.chickenPause = true;
	return true;
}
function FCState_teachWashing_start(){
	global.chickenPause = true;
	return true;
}

function FCState_waitForDifficultyIncrease_ongoing(){
	if miniHand.difficulty >= 2{
		FCtutTimer++
	}
	if FCtutTimer >= FCtutTime{
		return true;
	}
	return false;
}

function FCState_teachDragging_ongoing(){
	var boolValue = false;
	//for performance improvement do this one time in teachDragging_start but im too lazy :pppp
	for (var i = 0; i < instance_number(obj_chopping_board_parent); i++){ 											
		if instance_find(obj_chopping_board_parent,i).held{
			boolValue = true;
			break;
		}
			
	}
	return boolValue;
	
}
function FCState_teachWashing_ongoing(){
	var dishes = instance_find(obj_dishes,0);
	if dishes.state = dishState.acceptingBoard{
		global.chickenPause = false;
		return true;
	}	
}


function FCState_waitForFood_ongoing(){
	if !instance_exists(food) || !food.is_active{
		for (var i = 0; i < instance_number(obj_food_parent); i++){
			FCtutTimer = 150;
			food = instance_find(obj_food_parent, i);
			if food.is_active{
				break;
			}
		}
	}
	if inHand.moveDown{
		FCtutTimer += 2
	}else{
		FCtutTimer++;
	}
	return FCtutTimer >= FCtutTime
	
	
}
function FCState_pilotDifferentFood_ongoing(){
	
	FCtutTimer++;
	
	if FCtutTimer >= FCtutTime{
		global.chickenPause = false;
		return true;
	}else{
		return false;
	}
	
}


