y += fall_speed; // Continues to fall 

if (is_active)
{
	// Tetris movement 
	if((keyboard_check(ord("S")) || keyboard_check(vk_down)))
	{
		y += fall_speed * 3*2;
	}
	else
	{
		y += fall_speed*2;
	}
	if((keyboard_check(ord("A")) || keyboard_check(vk_left)))
	{
		x -= 5;
	}
	if((keyboard_check(ord("D")) || keyboard_check(vk_right)))
	{
		x += 5;
	}	
}