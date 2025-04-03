
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
resetInputs() //same effect as initializing inputs
playerVariables_movement()
generalVariables();
//initializeEnums();
visual = summonObject(obj_player_visual, [["parent", id]]);

