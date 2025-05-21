
CHICKENPAUSE

y += fall_speed; // Continues to fall 

if (is_active)
{
	// Tetris movement 
	if(inHand.moveDown)
	{
		y += fall_speed * 3*2;
	}
	else
	{
		y += fall_speed*2;
	}
	if(inHand.moveLeft)
	{
		x -= 5;
	}
	if(inHand.moveRight)
	{
		x += 5;
	}	
}