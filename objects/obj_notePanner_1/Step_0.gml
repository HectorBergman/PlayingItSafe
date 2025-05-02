
switch (state){
	case pannerStates.left:{
		hoverLogic();
	}break;
	case pannerStates.right:{
		hoverLogic();
	}break;
	case pannerStates.transition:{
		image_alpha = 0;
		hover = false;
		transitionLogic()
	}break;
}