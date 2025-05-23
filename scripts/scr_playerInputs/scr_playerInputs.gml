function playerInput(){
	if keyboard_check(ord("W")) || keyboard_check(vk_up)
	{
		moveUp = true;
	}
	if keyboard_check(ord("S")) || keyboard_check(vk_down)
	{
		moveDown = true;
	}
	if keyboard_check(ord("A")) || keyboard_check(vk_left)
	{
		moveLeft = true;
	}
	if keyboard_check(ord("D")) || keyboard_check(vk_right)
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
	if keyboard_check_pressed(vk_anykey) || mouse_check_button(mb_left) || mouse_check_button(mb_right){
		anyKey = true;
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
	anyKey = false;
}