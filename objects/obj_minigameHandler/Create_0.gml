
//add in new minigames here
enum minigame{
	none,
	dragAndDrop,
	dragAndDropFridgeLevels,
	fallingChicken,
	washingHands,
	fryFood,
	moreMinigamesHere,
}

//dont touch!
enum status{
	started,
	ongoing,
	finished,
	none,
}


playerPosition = [592,736];
//call this + minigameComplete when done with minigame,
//add in any required variables here
currentMinigame = minigame.none;
lastMinigame = minigame.none;


dndRead = [false,false,false];
FFRead = [false];

function miniHandRefresh(){
	
	difficulty = 1;
	currentMinigame = minigame.none
	minigameStatus = status.started

	minigameScore = 0;
	perfect = false;
	checkmark = noone;
	
	player = instance_find(obj_player, 0);
	debugTime = 0;
	
	pointsEarned = 0; //pointsEarned in that specific minigame, not used super often
					  //but should be used more to allow for more dynamic score displays
					  //at end of minigame
	

	//dragAndDrop
	itemsArray = [];
	doorsArray = [];
	itemsArrayLength = 0;
	
	dragAndDropIndexer = 0;
	dragAndDropAnimationTimer = 0;
	dragAndDropAnimationTime = 30;
	
	dragAndDropAnimationTimer = 0;
	dragAndDropAnimationDelay = 60;
	
	shelfLimitTightnessUpperLimit = 10; //at difficulty 10, there will be
										//no room for inefficiency on the shelves
										//example: if there are 4 items that should go
										//onto the middle shelf, middle shelf will have
										//an item limit of exactly 4.
										
										//actually i scrapped this lol
										
										
	shelfItemsAmount = [0,0,0];
	
	//washing hands
    // letters
    letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
           "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    lettersArrayLength = array_length(letters)
    print(generateRandomLetter())
	
	//fryFood
	
	fryFoodTime = 180;
	fryFoodDesiredTemp = 72;
	meatOutside = 0;
	meatInside = false;
}
miniHandRefresh();