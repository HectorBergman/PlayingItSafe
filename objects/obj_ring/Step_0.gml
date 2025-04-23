if (instance_exists(obj_rightHand) && !on_tray) {
    x = obj_rightHand.x + 10;
    y = obj_rightHand.y - 10;
	image_index = 2;
}

if (place_meeting(x, y, obj_vanityTray) && (keyboard_check_pressed(ord("E")))) {
	on_tray = true;
	image_index = 1;
	
    x = 1680;
    y = 700;
	
	if(depth == -1001) {
		depth = -999;
	}
}
