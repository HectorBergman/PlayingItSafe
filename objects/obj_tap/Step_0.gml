
if (place_meeting(200, 100, obj_rightHand) && keyboard_check_pressed(ord("A"))) {
    tap_on = !tap_on; // Toggle state
    image_index = tap_on; // Set image_index (0 = off, 1 = on)
}


switch (global.tap_state)
{
	case tapState.ON:
		if (place_meeting(200, 100, obj_rightHand) && (keyboard_check_pressed(ord("A")))) {
			global.tap_state = tapState.OFF;
			print("Tap on")
		}
	break;
	
	case tapState.OFF:
		if (place_meeting(200, 100, obj_rightHand) && (keyboard_check_pressed(ord("A")))) {
			global.tap_state = tapState.ON;
			print("Tap off")
		}
	break;
}