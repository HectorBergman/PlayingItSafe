function pause_notPaused_control(){
	switch (screenState){
		case screenStates.old: pause_notPaused_old(); break;
		case screenStates.brandNew: pause_notPaused_brandNew(); break;
	}
}

function pause_paused_control(){
	switch (screenState){
		case screenStates.old: pause_paused_old(); break;
		case screenStates.brandNew: pause_paused_brandNew(); break;
	}
}
function pause_settings_control(){
	switch (screenState){
		case screenStates.old: pause_settings_old(); break;
		case screenStates.brandNew: pause_settings_brandNew(); break;
	}
}

function pause_paused_brandNew(){	
	global.pause = true;
	//here goes any code you need to start the minigame
	settingsButton = summonObject(obj_button, [["x", window_get_width()/4],["y", 64*3],["sprite", spr_settings], ["parent", id], ["action", 1]]);
	screenState = screenStates.old

}
function pause_paused_old(){
	if (keyboard_check_pressed(vk_escape)){
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.notPaused;
	}
}

function pause_settings_brandNew(){
	screenState = screenStates.old
}
function pause_settings_old(){
	if (keyboard_check_pressed(vk_escape) && global.pausable){
		mouseCoordsOnPause = [mouse_x,mouse_y];
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.notPaused;

	}
}

function pause_notPaused_brandNew(){
	//deleting here
	print("lol");
	instance_destroy(settingsButton);
	global.pause = false;
	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	screenState = screenStates.old
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function pause_notPaused_old(){
	if (keyboard_check_pressed(vk_escape) && global.pausable){
		mouseCoordsOnPause = [mouse_x,mouse_y];
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.paused;

	}
	/*
	if (keyboard_check_pressed(vk_escape) && global.pausable){
		if global.pause{
			instance_destroy(settingsButton);
			global.pause = false;
		}else{
			settingsButton = summonObject(obj_button, [["x", window_get_width()/4],["y", 64*3],["sprite", spr_settings]]);
			mouseCoordsOnPause = [mouse_x,mouse_y];
			global.pause = true;
		}
	}*/
}

