x = mouse_x
y = mouse_y

switch (hand_state)
{
	case HandState.DIRTY:
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
			hand_state = HandState.SOAP;
			print("Hands are soapy")
		}
	}
	break;
	
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
		handle_scrubbing(scrubKey4, 5, HandState.SCRUB4);
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
		if (keyboard_check_pressed(ord("E")) &&  global.tap_state == tapState.OFF) {
			print("Nicely washed hands boi")
			miniHand.minigameStatus = status.finished;
		}
	}
	break;
}