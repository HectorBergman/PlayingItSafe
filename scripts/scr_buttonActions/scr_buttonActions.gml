function button_settings(){ //go to settings
	parent.currentScreen = pauseScreen.settings
	parent.screenState = screenStates.brandNew
	instance_destroy();
}

function button_back(){
	parent.screenState = screenStates.brandNew;

	switch (parent.currentScreen){ //go to main pause screen if in settings, else unpause
		case pauseScreen.paused: parent.currentScreen = pauseScreen.notPaused; break;
		case pauseScreen.settings: parent.currentScreen = pauseScreen.paused; with(parent){unravelSettings();} break;
		case pauseScreen.menuSettings: parent.currentScreen = pauseScreen.notPaused; with (parent){unravelSettings();} break;
	}
}
function button_plus(){
	if global.masterVolume < 1{
		global.masterVolume += 0.1
	}
}
function button_minus(){
	if global.masterVolume > 0{
		global.masterVolume -= 0.1
	}
}
