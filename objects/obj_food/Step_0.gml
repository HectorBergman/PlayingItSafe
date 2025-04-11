cook_timer++;
if cook_timer == time_medium
{
	sprite_index = spr_partial;	
}
else if cook_timer == time_cook
{
	sprite_index = spr_done;
	check_timer++;
}
else if cook_timer == time_burn
{
	sprite_index = spr_burn;
	check_timer++;
}
