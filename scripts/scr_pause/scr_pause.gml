function pause_notPaused_control(){ //when game is not paused
	switch (screenState){
		case screenStates.old: pause_notPaused_old(); break; //first game frame since entering notPaused
		case screenStates.brandNew: pause_notPaused_brandNew(); break; //all other game frames
	}
}

function pause_paused_control(){ //when game is on the pause page
	switch (screenState){
		case screenStates.old: pause_paused_old(); break;
		case screenStates.brandNew: pause_paused_brandNew(); break;
	}
}
function pause_settings_control(){ //when game is on the settings page of the pause page
	switch (screenState){
		case screenStates.old: pause_settings_old(); break;
		case screenStates.brandNew: pause_settings_brandNew(); break;
	}
}
function pause_menuSettings_control(){ //when game is on the settings page of the pause page
	switch (screenState){
		case screenStates.old: pause_menuSettings_old(); break;
		case screenStates.brandNew: pause_menuSettings_brandNew(); break;
	}
}

function pause_paused_brandNew(){	
	global.pause = true;
	settingsButton = summonObject(obj_button, [["x", window_get_width()/2],["y", 64*6],["sprite", spr_settings], ["parent", id], ["action", 1],["scale", scale]]);
	if (!instance_exists(backButton)){
		backButton = summonObject(obj_button,	  [["x", window_get_width()/2],["y", 64*10],["sprite", spr_back], ["parent", id], ["action", 2], ["scale", scale]]);
	}
	screenState = screenStates.old

}
function pause_paused_old(){
	if (keyboard_check_pressed(vk_escape)){ //unpause
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.notPaused;
	}
}

function pause_settings_brandNew(){
	volumeBar = summonObject(obj_volumeBar,	  [["parent", id], ["type", "master"], ["x", window_get_width()/2], ["y", 64*7],["scale", scale]])
	screenState = screenStates.old
}
function pause_settings_old(){
	if (keyboard_check_pressed(vk_escape) && global.pausable){
		mouseCoordsOnPause = [mouse_x,mouse_y];
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.notPaused;
		
		unravelSettings();
	}
}

function pause_notPaused_brandNew(){
	instance_destroy(settingsButton);
	instance_destroy(backButton);
	global.pause = false;
	screenState = screenStates.old
}


function pause_notPaused_old(){
	if (keyboard_check_pressed(vk_escape) && global.pausable){ //pause
		mouseCoordsOnPause = [mouse_x,mouse_y];
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.paused;
	}
}


function pause_menuSettings_brandNew(){
	volumeBar = summonObject(obj_volumeBar,	  [["parent", id], ["type", "master"], ["x", window_get_width()/2], ["y", 64*7],["scale", scale]])
	backButton = summonObject(obj_button,	  [["x", window_get_width()/2],["y", 64*10],["sprite", spr_back], ["parent", id], ["action", 2], ["scale", scale]]);
	screenState = screenStates.old
}
function pause_menuSettings_old(){
	if (keyboard_check_pressed(vk_escape)){
		mouseCoordsOnPause = [mouse_x,mouse_y];
		screenState = screenStates.brandNew
		currentScreen = pauseScreen.notPaused;
		
		unravelSettings();
	}
}


function unravelSettings(){
	instance_destroy(volumeBar.child);
	instance_destroy(volumeBar.plusButton);
	instance_destroy(volumeBar.minusButton);
	instance_destroy(volumeBar);
}
