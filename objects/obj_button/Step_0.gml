
if pausable{
	PAUSE
}

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
		}else if action == 5{
			room_goto(rm_kitchen);
		}else if action == 6{
			global.pause = true;
			pauseHand.currentScreen = pauseScreen.menuSettings
			pauseHand.screenState = screenStates.brandNew
		}else if action == 7{
			miniHand.minigameStatus = status.finished;
			miniHand.perfect = true;
		}else if action == 8{
			global.alertsPaused = false;
			var note = instance_find(obj_obnoxiousNote,0);
			note.hasBeenRead = true;
			var pointer = instance_find(obj_pointer_menu,0);
			instance_destroy(pointer);
			instance_destroy(self);
			
		}
	}
}else{
	image_index = 0;
}