x = mouse_x
y = mouse_y

switch (hand_state)
{
	case HandState.DIRTY:
	{
		if (place_meeting(x, y, obj_tap) && (keyboard_check_pressed(ord("E"))) && global.tap_state == tapState.ON) {
			hand_state = HandState.WET;
			print("Hands are wet")
		}
	}
	break;
	
	case HandState.WET:
	{
		if (place_meeting(x, y, obj_soap) && (keyboard_check_pressed(ord("E")))) {
			hand_state = HandState.SOAP;
			print("Hands are soapy")
		}
	}
	break;
	
	case HandState.SOAP:
	{
		if (scrub_timer <= 0 && keyboard_check_pressed(ord(scrubKey1))) {
	        scrub_count++;
	        scrub_timer = room_speed * 0.4; // 0.4 seconds in frames (assuming 60 FPS)
	        print("Scrub " + string(scrub_count));
        
	        if (scrub_count >= 5) {
	            hand_state = HandState.SCRUB1;
	            print("Scrub 1 completed!");
	        }
		}

	    // Reduce the timer every frame
	    if (scrub_timer > 0) {
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
		}
	}
	break;
	
	case HandState.SCRUB4:
	{
		if (place_meeting(x, y, obj_tap) && keyboard_check_pressed(ord("E") &&  global.tap_state == tapState.ON) ) {
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
		if (keyboard_check_pressed(ord("E")) &&  global.tap_state == tapState.OFF) {
			print("Nicely washed hands boi")
			miniHand.minigameStatus = status.finished;
		}
	}
	break;
}