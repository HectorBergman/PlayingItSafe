function tutorial_kitchen_control_drawGUI(){
	switch (kitchenState){
		case kitchenStates.none: kitchenState_none_drawGUI(); break;
		case kitchenStates.hasMoved: kitchenState_hasMoved_drawGUI(); break;
		case kitchenStates.hasInteracted: kitchenState_hasInteracted_drawGUI(); break;
	}
}
function kitchenState_none_drawGUI(){
}
function kitchenState_hasMoved_drawGUI(){
	
}
function kitchenState_hasInteracted_drawGUI(){
	
}