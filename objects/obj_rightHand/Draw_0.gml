// DRAW EVENT:
draw_self();

draw_set_color(c_purple);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch (hand_state) {
    case HandState.DIRTY:
        draw_text(200, 200, "Rub hands under water [E]");
        break;
        
    case HandState.WET:
        draw_text(200, 200, "Apply soap [E]");
        break;
        
    case HandState.SOAP:
        draw_text(200, 200, "Scrub hands [" + scrubKey1 + "]");
        break;
        
    case HandState.SCRUB1:
        draw_text(200, 200, "Scrub hands [" + scrubKey2 + "]");
        break;
		
	 case HandState.SCRUB2:
        draw_text(200, 200, "Scrub hands [" + scrubKey3 + "]");
        break;
		
	 case HandState.SCRUB3:
        draw_text(200, 200, "Scrub hands [" + scrubKey4 + "]");
        break;
		
	 case HandState.SCRUB4:
        draw_text(200, 200, "Rinse under water [E]");
        break;
		
    case HandState.RINSE:
        draw_text(200, 200, "Use towel [E]");
        break;
        
    case HandState.DRY:
        draw_text(200, 200, "Exit [E]");
        break;
}