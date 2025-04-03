// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function playerState_normal(){
	if moveDown || moveUp{
		movementVector[1] = (moveDown-moveUp);
	}else{
		movementVector[1] = 0;
	}
	if moveLeft || moveRight{
		movementVector[0] = (moveRight-moveLeft);
	}else{
		movementVector[0] = 0;
	}
	movementVector = normalizeVector(movementVector);
}


//might be unnecessary lol
function normalizeVector(vector){
	var pythagoras = sqrt(power(abs(vector[0]), 2)+power(abs(vector[1]), 2))
	if pythagoras != 0{
		var normalize = 1/pythagoras
	
		vector[0] *= normalize;
		vector[1] *= normalize;
	}
	return vector;
}