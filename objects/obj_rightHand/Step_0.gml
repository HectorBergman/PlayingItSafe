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
		if (keyboard_check_pressed(ord("E"))) {
			hand_state = HandState.SCRUB;
			print("Hands are scrubbed")
		}
	}
	break;
	
	case HandState.SCRUB:
	{
		if (place_meeting(x, y, obj_tap) && (keyboard_check_pressed(ord("E")))) {
			hand_state = HandState.RINSE;
			print("Hands are rinsed")
		}
	}
	break;
	
	case HandState.RINSE:
	{
		if (keyboard_check_pressed(ord("E"))) {
			hand_state = HandState.DRY;
			print("Hands are dried")
		}
	}
	break;
	
	case HandState.DRY:
	{
		if (keyboard_check_pressed(ord("E"))) {
			print("Nicely washed hands boi")
			room_goto(rm_menu);
		}
	}
	break;
}