
switch (currentScreen){
	case pauseScreen.notPaused: pause_notPaused_control(); break;
    case pauseScreen.paused: pause_paused_control(); break;
	case pauseScreen.settings: pause_settings_control(); break;
}

