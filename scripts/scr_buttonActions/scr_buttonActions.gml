function button_settings(){ //go to settings
	parent.currentScreen = pauseScreen.settings
	parent.screenState = screenStates.brandNew
	instance_destroy();
}

function button_back(){
	parent.screenState = screenStates.brandNew;
	switch (parent.currentScreen){ //go to main pause screen if in settings, else unpause
		case pauseScreen.paused: parent.currentScreen = pauseScreen.notPaused; break;
		case pauseScreen.settings: parent.currentScreen = pauseScreen.paused; break;
	}
}
