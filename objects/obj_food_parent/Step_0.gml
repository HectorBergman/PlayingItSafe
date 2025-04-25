y += fall_speed; // Continues to fall 

if (is_active)
{
	// Tetris movement 
	if(keyboard_check(vk_down))
	{
		y += fall_speed * 3*2;
	}
	else
	{
		y += fall_speed*2;
	}
	
	if(keyboard_check(vk_left))
	{
		x -= 4;
	}
	if(keyboard_check(vk_right))
	{
		x += 4;
	}	
}