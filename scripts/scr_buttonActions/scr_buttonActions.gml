function button_settings(){
	parent.currentScreen = pauseScreen.settings
	parent.screenState = screenStates.brandNew
	instance_destroy();
}

function button_back(){
	parent.screenState = screenStates.brandNew;
	switch (parent.currentScreen){
		case pauseScreen.paused: parent.currentScreen = pauseScreen.notPaused; break;
		case pauseScreen.settings: parent.currentScreen = pauseScreen.paused; break;
	}
}
