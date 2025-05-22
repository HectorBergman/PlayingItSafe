PAUSE
if stoveValue < -200{
	stoveControl.state = stoveState.off
}else if stoveValue < 0{
	stoveControl.state = stoveState.low
}else if stoveValue < 200{
	stoveControl.state = stoveState.medium
}else{
	stoveControl.state = stoveState.high
}
if miniHand.minigameStatus == status.finished{
	fryFoodState = fryFoodStates.normal;
}
if canHold{
	if (inHand.mouseHeld){
		if (image_index == 0){
			firstGrab = true;
		}else{
			firstGrab = false;
		}
		image_index = 1;
	}else{
		image_index = 0;
	}
}else{
	image_index = 0;
	if !inHand.mouseHeld{
		canHold = true;
	}
}

switch (movabilityState)
{
	case movability.movable:{
		x = mouse_x;
		y = mouse_y;
	}
	break;
	case movability.unmovable:{
	}break;
	case movability.halfmovable:{
		if point_distance(x,y,mouse_x,mouse_y) < 8{
			movabilityState = movability.movable;
		}else{
			TweenEasyMove(x,y,mouse_x,mouse_y,0,10,EaseOutSine);
		}
	}break;
}

switch fryFoodState{
	case fryFoodStates.normal:{
		if place_meeting(x, y, obj_stoveControl) && inHand.mouseHeld && canHold && firstGrab && note.stateOfNote != noteStates.reading && miniHand.minigameStatus != status.finished{
			 fryFoodState = fryFoodStates.changingTemp;
			movabilityState = movability.unmovable;
			TweenEasyMove(x,y,stoveControl.x,stoveControl.y,0,5,EaseOutQuint);
			turnPoint = [x,y];
			preTurnStoveValue = stoveValue
			preTurnStoveAngle = stoveControl.image_angle;
			mouseTracker.visible = true;
			heatBar = summonObject(obj_heatBar, [["x", stoveControl.x], ["y", stoveControl.y-200]]);
		}
	}break;
	case fryFoodStates.changingTemp:{
	    var angleToMouse = point_direction(turnPoint[0], turnPoint[1], mouseTracker.x, mouseTracker.y);
		var angleDiff = angleToMouse - 90; 
		

		if (angleDiff > 180) angleDiff -= 360;
		if (angleDiff < -180) angleDiff += 360;
		if angleDiff < -160 || angleDiff > 160{
			stopChangingTemp()
			exit;
		}
		var knobRotation = angleDiff * 2; // double sensitivity

		stoveControl.image_angle = clamp(preTurnStoveAngle + knobRotation, -120, 120);
		image_angle = stoveControl.image_angle;
		
		if !inHand.mouseHeld{
			 stopChangingTemp()
		}
	}break;
}
