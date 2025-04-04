minigameComplete = true;
for (var i = 0; itemsArray[i] != noone; i++;) {
    if itemsArray[i].inPosition != true{ //if any item is not in their correct location,
										 //minigame is not completed
		minigameComplete = false;
	}
}


if (minigameComplete){
	for (var i = 0; doorsArray[i] != noone; i++;) {
	
		if doorsArray[i].image_index != 1{ //if any doors are open, minigame not completed
			minigameComplete = false;
		}
	}
	if minigameComplete{ //todo: add more code for handling minigame completion
		scoreHand.currentScore += 100
		room_goto(rm_kitchen);
	}
}