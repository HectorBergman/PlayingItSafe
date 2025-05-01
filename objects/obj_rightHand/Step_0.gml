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

switch (hand_state)
{
	case HandState.DIRTY:
	{
		if (jewel_rand < 5 ) {
			ring = leftHand.ring
			wristBand = leftHand.wristBand
			//rename watch
		}
		if (ring.on_tray&& wristBand.on_tray){
			bejeweled = false
		}
		if (jewel_rand > 5 || place_meeting(x, y, obj_vanityTray) && (keyboard_check_pressed(ord("E")))) {
			bejeweled = false;
		}
		
		if (!bejeweled){
			hand_state = HandState.JEWELRY;
			print("Hands are un-bejeweld")
		}
	}
	break;
	
	case HandState.JEWELRY:
	{
		if (place_meeting(x, y, obj_water) && (keyboard_check_pressed(ord("E")))){
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
		handle_scrubbing(scrubKey1, 5, HandState.SCRUB1);
	}
	break;
	
	case HandState.SCRUB1:
	{
		handle_scrubbing(scrubKey2, 5, HandState.SCRUB2);
	}
	break;
	
	case HandState.SCRUB2:
	{
		handle_scrubbing(scrubKey3, 5, HandState.SCRUB3);
	}
	break;
	
	case HandState.SCRUB3:
	{
		if handle_scrubbing(scrubKey4, 5, HandState.SCRUB4){
			movabilityState = movability.halfmovable;
		}
	}
	break;
	
	case HandState.SCRUB4:
	{
		if (place_meeting(x, y, obj_water) && keyboard_check_pressed(ord("E"))) {
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
		if (keyboard_check_pressed(ord("E")) && global.tap_state == tapState.OFF) {
			print("Nicely washed hands boi")
			miniHand.minigameStatus = status.finished;
		}
	}
	break;
}