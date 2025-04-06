
//add in new minigames here
enum minigame{
	none,
	dragAndDrop,
	moreMinigamesHere,
}

//dont touch!
enum status{
	started,
	ongoing,
	finished,
	none,
}

//call this + minigameComplete when done with minigame,
//add in any required variables here
function miniHandRefresh(){ 
	currentMinigame = minigame.none
	minigameStatus = status.none

	minigameScore = 0;
	perfect = false;
	checkmark = noone;

	debugTime = 0;

	//dragAndDrop
	itemsArray = [];
	doorsArray = [];
}
miniHandRefresh();