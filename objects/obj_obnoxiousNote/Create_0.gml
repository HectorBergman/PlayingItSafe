
scale = 2;
image_xscale = scale;
image_yscale = scale;
stateOfNote = noteStates.reading;
hasBeenRead = false;

exitButton = summonObject(obj_button, [["action", 8], ["pausable", true], ["buttonText", "Jag förstår"], ["scale", 1.5], ["x", display_get_width()/2], ["y", display_get_height()-256], ["gui", true]]); 
pointer = summonObject(obj_pointer_menu, [["gui", true]]);

originCoords = [x,y];
flyOffCoords = [x,-room_height];

tweenOfChoice = EaseOutQuart
outlineColor = $000034;


tipsArray = [
"Välkommen till Playing-It-Safe-köket! " +
"Ditt mål är att fastställa god livsmedelssäkerhet inom köket. " +
"Under speltiden kommer det dyka upp notifikationer ([scale,1.5][spr_alert][scale,2]) som visar att det finns en livsmedelssäkerhetsrisk som måste åtgärdas. "+
"Det är ditt jobb att ta hand om det genom att gå fram till notifikationen och trycka på [[E] för att starta spelet. " +
"Kom ihåg att tvätta händerna innan du börjar och efter att du har hanterat livsmedel som kan sprida bakterier.\n"+
"Styr gubben genom att använda [[W][[A][[S][[D]"]



function activateTransitionCheck(reverse){
	if hasBeenRead{
		TweenEasyMove(originCoords[0],originCoords[1],flyOffCoords[0],flyOffCoords[1],0,30,tweenOfChoice);
		stateOfNote = noteStates.normal;
	}
}


