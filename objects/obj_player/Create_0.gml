
depth = 0


enum playerStates{
	normal,
}
state = playerStates.normal;
function movementX(){
	return movementVector[0]*movementSpeed;
}
function movementY(){
	return movementVector[1]*movementSpeed;
}


playerVariables_movement() //initialize movement-related variables

generalVariables(); //initialize general variables
//initializeEnums();

//summon the object showing the visual player
visual = summonObject(obj_player_visual, [["parent", id]]);

interactRadius = visual.sprite_width*1.5 //area of interaction

nearbyAlerts = ds_list_create();
