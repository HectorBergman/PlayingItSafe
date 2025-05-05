y += fall_speed; // Continues to fall 

if (is_active)
{
	// Tetris movement 
	if(keyboard_check(ord("S")))
	{
		y += fall_speed * 3*2;
	}
	else
	{
		y += fall_speed*2;
	}
	if(keyboard_check(ord("A")))
	{
		x -= 4;
	}
	if(keyboard_check(ord("D")))
	{
		x += 4;
	}	
}