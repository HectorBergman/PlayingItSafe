enum tutorialStates{
	kitchen,
	washHands,
	fallChicken,
	dragDrop,
	fryFood,
}

enum kitchenStates{
	none,
	hasMoved,
	hasInteracted,
}


enum tutorialStatus{
	start,
	ongoing,
}

childrenList = ds_list_create();

keyWidth = sprite_get_width(spr_keyboardKey);
keyHeight = sprite_get_height(spr_keyboardKey);

tStatus = tutorialStatus.start
tutorialState = miniHand.currentMinigame;
kitchenState = kitchenStates.none;

hasMovedAllDirectionsArray = [0,0,0,0];


function destroyChildren(){
	for (var i = 0; i < ds_list_size(childrenList); i++){
		var child = ds_list_find_value(childrenList,i);
		instance_destroy(child);
	}
	ds_list_clear(childrenList);
}