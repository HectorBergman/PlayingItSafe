if (position_meeting(mouse_x, mouse_y, id)){
	image_index = 1;
	if (mouse_check_button_pressed(mb_left)){
		if (action == 1){
			parent.currentScreen = pauseScreen.settings
			parent.screenState = screenStates.brandNew
			instance_destroy();
		}
	}
}else{
	image_index = 0;
}