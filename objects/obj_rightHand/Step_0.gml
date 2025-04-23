if (inHand.mouseHeld){
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

switch (hand_state)
{
	case HandState.DIRTY:
	{
		if (place_meeting(x, y, obj_tap) && (keyboard_check_pressed(ord("E")))) {
			hand_state = HandState.WET;
			print("Hands are wet")
		}
	}
	break;
	
	case HandState.WET:
	{
		if (place_meeting(x, y, obj_soap) && (keyboard_check_pressed(ord("E")))) {
			hand_state = HandState.scrubStart;
			print("Hands are soapy")
			movabilityState = movability.unmovable;
			leftHand = summonObject(obj_leftHand,[["x", room_width/4], ["y", room_height*1.3], ["parent", id]]);
		}
	}
	break;
	case HandState.scrubStart:
	{
		TweenEasyMove(x,y,scrubPoint.x,scrubPoint.y,0,60,EaseOutSine);
		hand_state = HandState.SOAP
		
	}
	case HandState.SOAP:
	{
		if (scrub_timer <= 0 && keyboard_check_pressed(ord(scrubKey1))) {
	        scrub_count++;
	        scrub_timer = 48 + irandom_range(-6,6); //room_speed * 0.4; // 0.4 seconds in frames (assuming 60 FPS)
	        print("Scrub " + string(scrub_count));
        
	        if (scrub_count >= 5) {
	            hand_state = HandState.SCRUB1;
	            print("Scrub 1 completed!");
	        }
		}

	    // Reduce the timer every frame
		
	    if (scrub_timer > 0) {
			print("x: " + string(x) + " y: " + string(y) + " scrubPointx,y : " + string(scrubPoint.x) + "," + string(scrubPoint.y));
			if scrubTween == noone || !TweenIsPlaying(scrubTween){
				var yDifference = 80;
				var tweenTime = irandom_range(6,8);
				var highDestination = scrubPoint.y+yDifference+irandom_range(-30,10);
				var lowDestination = scrubPoint.y-yDifference+irandom_range(-30,10);
				var xDifference = irandom_range(-12,12);
				var leftHand_scrubHigh = false; //if rightHand scrubs low, leftHand scrubs high
				if point_distance(0,y,0,highDestination) > point_distance(0,y,0,lowDestination){
					scrubTween = TweenEasyMove(x,y,scrubPoint.x+xDifference,highDestination,0,tweenTime,EaseInOutQuint);
				}else{
					scrubTween = TweenEasyMove(x,y,scrubPoint.x+xDifference,lowDestination,0,tweenTime,EaseInOutQuint);
					leftHand_scrubHigh = true;
				}
				var scrubby = scrubPoint
				//Do this if you want the leftHand to move as well, but it looked kind of shit
				//but maybe it can work if you tweak some numbers
				/*with (leftHand){
					scrubbyDubby(leftHand_scrubHigh, scrubby, xDifference);
				}*/
			}
	        scrub_timer--;
	    }
	}
	break;
	
	case HandState.SCRUB1:
	{
		if (keyboard_check_pressed(ord(scrubKey2))) {
			hand_state = HandState.SCRUB2;
			print("Scrub 2")
		}
	}
	break;
	
	case HandState.SCRUB2:
	{
		if (keyboard_check_pressed(ord(scrubKey3))) {
			hand_state = HandState.SCRUB3;
			print("Scrub 3")
			
		}
	}
	break;
	
	case HandState.SCRUB3:
	{
		if (keyboard_check_pressed(ord(scrubKey4))) {
			hand_state = HandState.SCRUB4;
			print("Scrub 4")
			movabilityState = movability.halfmovable;
		}
	}
	break;
	
	case HandState.SCRUB4:
	{
		if (place_meeting(x, y, obj_tap) && keyboard_check_pressed(ord("E"))) {
			hand_state = HandState.RINSE;
			print("Hands are rinsed")
		}
	}
	break;
	
	case HandState.RINSE:
	{
		if (place_meeting(x, y, obj_towl) && keyboard_check_pressed(ord("E"))) {
			hand_state = HandState.DRY;
			print("Hands are dried")
		}
	}
	break;
	
	case HandState.DRY:
	{
		if (keyboard_check_pressed(ord("E"))) {
			print("Nicely washed hands boi")
			miniHand.minigameStatus = status.finished;
		}
	}
	break;
}