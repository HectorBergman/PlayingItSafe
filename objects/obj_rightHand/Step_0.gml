PAUSE
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
	case HandState.START:
	{
		print(miniHand.difficulty)
		if !miniHand.hasJewelry {
			hand_state = HandState.JEWELRY;
		}
		else {
			hand_state = HandState.DIRTY;
		}
	}
	break;
		
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
		if (place_meeting(x, y, obj_water)){
			hand_state = HandState.WET;
			print("Hands are wet")
		}
	}
	break;
	
	case HandState.WET:
	{
		create_water_drops();
		
		if (place_meeting(x, y, obj_soap) && (mouse_check_button_pressed(1))) {
			hand_state = HandState.scrubStart;
			print("Hands are soapy")
			movabilityState = movability.unmovable;
			
			// Destroy all water drops when leaving WET state
	        for (var i = 0; i < array_length(waterDrops); i++) {
	            if (instance_exists(waterDrops[i])) {
	                instance_destroy(waterDrops[i]);
	            }
	        }
	        waterDrops = [];
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
		create_soap_bubbles();
		handle_scrubbing(scrubKey1, 5, HandState.SCRUB1);
	}
	break;
	
	case HandState.SCRUB1:
	{
		image_angle = 20;
		create_soap_bubbles();
		handle_scrubbing(scrubKey2, 5, HandState.SCRUB2);
	}
	break;
	
	case HandState.SCRUB2:
	{
		// Changed to closed hand for this specific scrubstate
		image_index = 1;
		create_soap_bubbles();
		handle_scrubbing(scrubKey3, 5, HandState.SCRUB3);
	}
	break;
	
	case HandState.SCRUB3:
	{
		image_angle = 30;
		create_soap_bubbles();
		if handle_scrubbing(scrubKey4, 5, HandState.SCRUB4){
			movabilityState = movability.halfmovable;
		}
	}
	break;
	
	case HandState.SCRUB4:
	{
		image_angle = 0;
		create_soap_bubbles();
		if (place_meeting(x, y, obj_water)) {
			hand_state = HandState.RINSE;
			
			// Destroy all soap bubbles when leaving WET state
	        for (var i = 0; i < array_length(soapBubbles); i++) {
	            if (instance_exists(soapBubbles[i])) {
	                instance_destroy(soapBubbles[i]);
	            }
	        }
	        soapBubbles = [];
			
			
			print("Hands are rinsed")
		}
	}
	break;
	
	case HandState.RINSE:
	{
		create_water_drops()
		image_angle = 0;
		
		if (place_meeting(x, y, obj_towl) && mouse_check_button_pressed(1)) {
			hand_state = HandState.DRYSTART
			
			
			
			print("Hands are dried")
		}
	}
	break;
	
	case HandState.DRYSTART:
	{
		TweenEasyMove(x,y,dryPoint.x,dryPoint.y,0,60,EaseOutSine);
		hand_state = HandState.DRYING
		
	}
	
	case HandState.DRYING:
	{
		
		leftHand.depth = 1
		movabilityState = movability.unmovable
		if (handle_drying(dryKey)) {
			movabilityState = movability.halfmovable
		}
	}
	break;
	
	case HandState.DRY:
	{	
		// Destroy all water drops when leaving WET state
	    for (var i = 0; i < array_length(waterDrops); i++) {
	        if (instance_exists(waterDrops[i])) {
	            instance_destroy(waterDrops[i]);
	        }
	    }
	    waterDrops = [];
		if (keyboard_check_pressed(vk_enter)) || (keyboard_check_pressed(vk_space)){
			global.tap_state = tapState.OFF;
			print("Nicely washed hands boi")
			miniHand.minigameStatus = status.finished;
		}
	}
	break;
}