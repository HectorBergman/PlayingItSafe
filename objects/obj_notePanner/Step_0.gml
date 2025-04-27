
switch (state){
	case pannerStates.left:{
		hoverLogic();
	}break;
	case pannerStates.right:{
		hoverLogic();
	}break;
	case pannerStates.transition:{
		transitionLogic()
	}break;
}