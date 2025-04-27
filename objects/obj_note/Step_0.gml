switch (stateOfNote){
	case noteStates.normal:{
		if panner.hover{
			if !pannerIsHovered{
				TweenEasyMove(originCoords[0],originCoords[1],hoveredCoords[0],hoveredCoords[1],0,20,EaseOutQuint);
			}
			pannerIsHovered = true;
		}else{
			if pannerIsHovered{
				TweenEasyMove(hoveredCoords[0],hoveredCoords[1],originCoords[0],originCoords[1],0,20,EaseOutQuint);
			}
			pannerIsHovered = false;
	
		}

		if place_meeting(x,y,pointer){
			if inHand.mouseClick{
				var targetCoords = [hoveredCoords[0],hoveredCoords[1]]
				with cam{
					panToCoord(targetCoords[0],targetCoords[1]);
				}
				stateOfNote = noteStates.reading;
			}
		}
	} break;
	case noteStates.reading:{
	}
}