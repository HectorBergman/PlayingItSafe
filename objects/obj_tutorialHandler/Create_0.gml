enum tutorialStates{
	kitchen,
	washHands,
	fallChicken,
	dragDrop,
	fryFood,
}
enum tutorialStatus{
	start,
	ongoing,
}

enum kitchenStates{
	none,
	hasMoved,
	hasInteracted,
}

enum dndStates{
	none,
	mouseMoved,
	hasDragged,
	finishFound,
	difficulty4,
	thermoInfo,
	hasUsedThermometer,
	difficulty8,
	finishFound2,
	difficulty12,
	hasChangedTemperature,
}
enum FCStates{ //fallingChicken
	none,
	pilotFood,
	waitForFood,
	pilotDifferentFood,
	waitForDifficultyIncrease,
	teachDragging,
	teachWashing,
	
}
enum FFStates{ //fryFood
	none,
	hasTouchedStove,
	hasTurnedStove,
	waitForTimer,
	timerActivated,
	finishEasy,
	difficultyHigh,
	moveThermo,
}
enum WHStates{ //washHands
	none,
	mouseMoved,
	tapPressed,
	handWet,
	soapPressed,
	keyPressed,
	icy,
	finished,
}
startSummonTimer = 0;
startSummonTime = 30;

childrenList = ds_list_create();

keyWidth = sprite_get_width(spr_keyboardKey);
keyHeight = sprite_get_height(spr_keyboardKey);

yapper = summonObject(obj_tutorialYapper);

tStatus = tutorialStatus.start
tutorialState = miniHand.currentMinigame;
kitchenState = kitchenStates.none;

dndState = dndStates.none;
FFState = FFStates.none;
FCState = FCStates.none;
WHState = WHStates.none;



//kitchen variables

hasMovedAllDirectionsArray = [0,0,0,0];

//dnd variables

mouseDistanceMoved = 0;
prevMousePosition = [-99,-99];

thermoTimer = 0;
thermoTime = 600;

//washingHands variables

//cookFood variables

eggHasLarmed = false;

//fallChicken variables

FCtutTimer = 120;
FCtutTime = 240;

food = noone;

hasMoved = [false,false];


function destroyChildren(){
	for (var i = 0; i < ds_list_size(childrenList); i++){
		var child = ds_list_find_value(childrenList,i);
		instance_destroy(child);
	}
	ds_list_clear(childrenList);
}