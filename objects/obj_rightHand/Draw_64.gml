// DRAW EVENT:
PAUSE
draw_set_color(c_purple);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


switch (hand_state) {
    case HandState.DIRTY:
        washingHandsText("Ta av smycken och accessoarer");
        break;
		
	 case HandState.JEWELRY:
        washingHandsText("Skölj händerna under vattnet");
        break;
        
    case HandState.WET:
        washingHandsText("Ta tvål [[Klicka med musen]");
        break;
        
    case HandState.SOAP:
        washingHandsText("Gnugga handflatorna [[" + scrubKey1 + "]");
		pulsatingCharacterDisplay(scrubKey1, 100, 50);
        break;
        
    case HandState.SCRUB1:
        washingHandsText("Gnugga ovansidorna och mellan fingrarna [[" + scrubKey2 + "]");
		pulsatingCharacterDisplay(scrubKey2, 100, 50);
        break;
		
	 case HandState.SCRUB2:
        washingHandsText("Gnugga tummarna [[" + scrubKey3 + "]");
		pulsatingCharacterDisplay(scrubKey3, 100, 50);
        break;
		
	 case HandState.SCRUB3:
        washingHandsText("Gnugga fingrarna i handflatan [[" + scrubKey4 + "]");
		pulsatingCharacterDisplay(scrubKey4, 100, 50);
        break;
		
	 case HandState.SCRUB4:
        washingHandsText("Skölj av händerna");
        break;
		
    case HandState.RINSE:
        washingHandsText("Torka händerna på handduken [[Klicka med musen]");
        break;

	 case HandState.DRYING:
        washingHandsText("Se till att händerna är helt torra [[" + dryKey + "]");
		pulsatingCharacterDisplay(dryKey, 100, 50);
        break;
        
    case HandState.DRY:
        washingHandsText("Avsluta [[Enter]");
		//pulsatingCharacterDisplay("Enter", 100, 50);
        break;
}