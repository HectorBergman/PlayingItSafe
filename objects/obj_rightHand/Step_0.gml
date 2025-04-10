x = mouse_x
y = mouse_y

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
			hand_state = HandState.SOAP;
			print("Hands are soapy")
		}
	}
	break;
	
	case HandState.SOAP:
	{
		if (keyboard_check_pressed(ord(scrubKey1))) {
			hand_state = HandState.SCRUB1;
			print("Scrub 1")
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
		if (keyboard_check_pressed(ord("E"))) {
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