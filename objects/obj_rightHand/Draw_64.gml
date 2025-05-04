// DRAW EVENT:

draw_set_color(c_purple);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

switch (hand_state) {
    case HandState.DIRTY:
        washingHandsText("Ta av smycken och accessoarer");
        break;
		
	 case HandState.JEWELRY:
        washingHandsText("Skölj händerna under vattnet [[E]");
        break;
        
    case HandState.WET:
        washingHandsText("Ta tvål [[E]");
        break;
        
    case HandState.SOAP:
        washingHandsText("Gnugga handflatorna [[" + scrubKey1 + "]");
        break;
        
    case HandState.SCRUB1:
        washingHandsText("Gnugga ovansidorna och mellan fingrarna [[" + scrubKey2 + "]");
        break;
		
	 case HandState.SCRUB2:
        washingHandsText("Gnugga tummarna [[" + scrubKey3 + "]");
        break;
		
	 case HandState.SCRUB3:
        washingHandsText("Gnugga fingrarna i handflatan [[" + scrubKey4 + "]");
        break;
		
	 case HandState.SCRUB4:
        washingHandsText("Skölj av händerna [[E]");
        break;
		
    case HandState.RINSE:
        washingHandsText("Torka händerna på handduken [[E]");
        break;
        
    case HandState.DRY:
        washingHandsText("Avsluta [[E], (Kranen måste vara avstängd!)");
        break;
}