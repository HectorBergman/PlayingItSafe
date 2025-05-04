switch (global.tap_state) {
    case tapState.ON:
        tapText("Press [[A] to turn tap off");
        break;
		
	case tapState.OFF:
        tapText("Press [[A] to turn tap on");
        break;
}