
//add in new minigames here
enum minigame{
	none,
	dragAndDrop,
	dragAndDropFridgeLevels,
	fallingChicken,
	moreMinigamesHere,
}

//dont touch!
enum status{
	started,
	ongoing,
	finished,
	none,
}
playerPosition = [416,224];
//call this + minigameComplete when done with minigame,
//add in any required variables here
function miniHandRefresh(){
	difficulty = 1;
	
	currentMinigame = minigame.none
	minigameStatus = status.started

	minigameScore = 0;
	perfect = false;
	checkmark = noone;
	
	player = instance_find(obj_player, 0);
	debugTime = 0;
	

	//dragAndDrop
	itemsArray = [];
	doorsArray = [];
}
miniHandRefresh();