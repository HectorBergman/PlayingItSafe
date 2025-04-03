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
		mouseHeld = true;
	}
	if mouse_check_button_pressed(mb_left)
	{
		mouseClick = true;
	}
	if keyboard_check_pressed(ord("E")){
		interact = true;
	}
}

function resetInputs(){
	moveUp = false;
	moveDown = false;
	moveLeft = false;
	moveRight = false;
	mouseHeld = false;
	mouseClick = false;
	interact = false;
}