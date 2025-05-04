switch (global.tap_state) {
    case tapState.ON:
        tapText("Tryck [[A] för att stänga av kranen");
        break;
		
	case tapState.OFF:
        tapText("Tryck [[A] för att sätta på kranen");
        break;
}