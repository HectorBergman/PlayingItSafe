cook_timer++;
if keyboard_check_pressed(vk_space)
{
	sprite_index = spr_partial;	
}
else if keyboard_check_pressed(vk_alt)
{
	sprite_index = spr_done;
	check_timer++;
}
//else if cook_timer == time_burn
//{
//	sprite_index = spr_burn;
//	check_timer++;
//}
