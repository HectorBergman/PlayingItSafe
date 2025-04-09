if (position_meeting(mouse_x, mouse_y, id)){ //hover over button
	image_index = 1;
	if (mouse_check_button_pressed(mb_left)){
		if (action == 1){ //different buttons do different things, depending on action value
			button_settings();
		}else if action == 2{
			button_back();
		}
	}
}else{
	image_index = 0;
}