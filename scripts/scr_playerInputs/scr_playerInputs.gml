function playerInput(){
	if keyboard_check(ord("W"))
	{
		moveUp = true;
	}
	if keyboard_check(ord("S"))
	{
		moveDown = true;
	}
	if keyboard_check(ord("A"))
	{
		moveLeft = true;
	}
	if keyboard_check(ord("D"))
	{
		moveRight = true;
	}
	if mouse_check_button(mb_left)
	{
		mouseClick = true;
	}
}

function resetInputs(){
	moveUp = false;
	moveDown = false;
	moveLeft = false;
	moveRight = false;
	mouseClick = false;
}