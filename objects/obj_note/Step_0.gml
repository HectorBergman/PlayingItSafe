

switch (stateOfNote){
	case noteStates.normal:{
		activateTransitionCheck(false);
	} break;
	case noteStates.reading:{
		
		activateTransitionCheck(true);
	} break;
	case noteStates.transition:{
		pannerIsHovered = false;
		transitionTimer++;
		if (transitionTimer == transitionTime){
			if transitionDestination == noteStates.reading{
				panner.state = pannerStates.left;
			}else{
				panner.state = pannerStates.right;
			}
			stateOfNote = transitionDestination
			transitionTimer = 0;
		}
	}
}