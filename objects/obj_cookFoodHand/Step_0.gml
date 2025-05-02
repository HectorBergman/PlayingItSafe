if stoveValue < -200{
	stoveControl.state = stoveState.off
}else if stoveValue < 100{
	stoveControl.state = stoveState.low
}else if stoveValue < 300{
	stoveControl.state = stoveState.medium
}else{
	stoveControl.state = stoveState.high
}

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
		if place_meeting(x, y, obj_stoveControl){
			if inHand.mouseHeld{
				fryFoodState = fryFoodStates.changingTemp;
				movabilityState = movability.unmovable;
				TweenEasyMove(x,y,stoveControl.x+stoveControl.sprite_width/2,stoveControl.y+stoveControl.sprite_height/2,0,5,EaseOutQuint);
				turnPoint = [stoveControl.x+ stoveControl.sprite_width/2, stoveControl.y+ stoveControl.sprite_height/2];
			}
		}
	}break;
	case fryFoodStates.changingTemp:{
		var inverse = 1
		if mouse_x < stoveControl.x+ stoveControl.sprite_width/2{
			inverse = -1;
		}
		var value = clamp(inverse*point_distance(mouse_x,0,stoveControl.x+stoveControl.sprite_width/2,0), stoveRanges[0], stoveRanges[1]);
		stoveValue = value;
		image_angle = mapRange(value, stoveRanges[0], stoveRanges[1], -90, 90);
		if !inHand.mouseHeld{
			fryFoodState = fryFoodStates.normal;
			movabilityState = movability.halfmovable;
			TweenFire(id,EaseOutQuad,0, false, 0, 24, "image_angle", image_angle, 0);
		}
	}break;
}

if place_meeting(x, y, obj_stoveControl)
{
	if keyboard_check_pressed(vk_up)
	{
		obj_stoveControl.state++;
		if obj_stoveControl.state >= 3
		{
			obj_stoveControl.state = 3;
			print("The stove can't be turned any higher");
			
		}
	}
	else if keyboard_check_pressed(vk_down)
	{
		obj_stoveControl.state--;
		if obj_stoveControl.state <= 0
		{
			obj_stoveControl.state = 0;
			print("The stove is off, you can't turn it any lower");
		}
	}
}