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
}

childrenList = ds_list_create();

keyWidth = sprite_get_width(spr_keyboardKey);
keyHeight = sprite_get_height(spr_keyboardKey);

yapper = summonObject(obj_tutorialYapper);

tStatus = tutorialStatus.start
tutorialState = miniHand.currentMinigame;
kitchenState = kitchenStates.none;
dndState = dndStates.none;


//kitchen variables

hasMovedAllDirectionsArray = [0,0,0,0];

//dnd variables

mouseDistanceMoved = 0;
prevMousePosition = [-99,-99];

//washingHands variables

//cookFood variables

//fallChicken variables


function destroyChildren(){
	for (var i = 0; i < ds_list_size(childrenList); i++){
		var child = ds_list_find_value(childrenList,i);
		instance_destroy(child);
	}
	ds_list_clear(childrenList);
}