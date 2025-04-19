
//add in new minigames here
enum minigame{
	none,
	dragAndDrop,
	dragAndDropFridgeLevels,
	fallingChicken,
	washingHands,
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
	
	//washing hands
    // letters
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
           "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    lettersArrayLength = array_length(letters)
    print(generateRandomLetter())
}
miniHandRefresh();