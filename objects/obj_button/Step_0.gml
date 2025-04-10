
try{
	if (!instance_exists(parent)){
		instance_destroy();
	}
}catch(e){
}
if (position_meeting(mouse_x, mouse_y, id)){ //hover over button
	image_index = 1;
	if (mouse_check_button_pressed(mb_left)){
		//different buttons do different things, depending on action value
		//see: scr_buttonActions
		if (action == 1){ 
			button_settings();
		}else if action == 2{
			button_back();
		}else if action == 3{
			button_plus();
		}else if action == 4{
			button_minus();
		}
	}
}else{
	image_index = 0;
}