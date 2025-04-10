cook_timer++;
if cook_timer == time_medium
{
	sprite_index = spr_partial;	
}
else if cook_timer == time_cook
{
	sprite_index = spr_done;
}
else if cook_timer == time_burn
{
	sprite_index = spr_burn;
	check_timer++;
}

if thermometer >= 72
{
	check_timer++;
	if check_timer >= 100
	{
		points--;
	}
}