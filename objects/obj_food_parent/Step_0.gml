
y += fall_speed; // Continues to fall 

if (is_active)
{
	
	// Tetris movement 
	if(keyboard_check(vk_down))
	{
		y += fall_speed * 3;
	}
	else
	{
		y += fall_speed;
	}
	
	if(keyboard_check(vk_left))
	{
		x -= 2;
	}
	if(keyboard_check(vk_right))
	{
		x += 2;
	}
	
}