if miniHand.minigameStatus == status.finished{
	print(image_angle);
	if !tweened{
		if image_angle < 90{
			TweenFire(id, EaseOutQuad,0,false,0,180,"image_angle",image_angle,30);
		}
		tweened = true;
	}
}