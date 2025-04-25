// DRAW EVENT:
draw_self();

draw_set_color(c_orange);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch (global.tap_state) {
    case tapState.ON:
        tapText("Press [[A] to turn tap off");
        break;
		
	case tapState.OFF:
        tapText("Press [[A] to turn tap on");
        break;
}