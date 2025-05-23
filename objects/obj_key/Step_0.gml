PAUSE
if image_index == 0{
	timer++
	if time <= timer{
		image_index = 1;
		timer = 0;
	}
}else{
	cooldown++
	if cooldown >= popup{
		image_index = 0;
		cooldown = 0;
	}
}