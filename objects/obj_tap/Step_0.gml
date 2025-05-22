PAUSE
//if (place_meeting(200, 100, obj_rightHand) && keyboard_check_pressed(ord("A"))) {
//    tap_on = !tap_on; // Toggle state
//    image_index = tap_on; // Set image_index (0 = off, 1 = on)
//}

switch (global.tap_state)
{
	case tapState.ON:
		image_index = 1;
		if (!instance_exists(water)) {
			water = instance_create_layer(640, 315, "Instances", obj_water);
		}
		if (place_meeting(200, 100, obj_rightHand) && (keyboard_check_pressed(ord("A")))) {
			global.tap_state = tapState.OFF;
			print("Tap off")
		}
	break;
	
	case tapState.OFF:
		if (instance_exists(water)) {
            instance_destroy(water);
            water = noone;
		}
		image_index = 0;
		if (place_meeting(200, 100, obj_rightHand) && (keyboard_check_pressed(ord("A")))) {
			global.tap_state = tapState.ON;
			print("Tap on")
		}
	break;
}