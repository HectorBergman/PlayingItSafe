// DRAW EVENT:

draw_set_color(c_purple);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch (hand_state) {
    case HandState.DIRTY:
        washingHandsText("Rub hands under water [[E]");
        break;
        
    case HandState.WET:
        washingHandsText("Apply soap [[E]");
        break;
        
    case HandState.SOAP:
        washingHandsText("Scrub hands [[" + scrubKey1 + "]");
        break;
        
    case HandState.SCRUB1:
        washingHandsText("Scrub hands [[" + scrubKey2 + "]");
        break;
		
	 case HandState.SCRUB2:
        washingHandsText("Scrub hands [[" + scrubKey3 + "]");
        break;
		
	 case HandState.SCRUB3:
        washingHandsText("Scrub hands [[" + scrubKey4 + "]");
        break;
		
	 case HandState.SCRUB4:
        washingHandsText("Rinse under water [[E]");
        break;
		
    case HandState.RINSE:
        washingHandsText("Use towel [[E]");
        break;
        
    case HandState.DRY:
        washingHandsText("Exit [[E]");
        break;
}