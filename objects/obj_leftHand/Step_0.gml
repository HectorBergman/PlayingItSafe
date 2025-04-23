if !found{
	firstTimeTimer++
	if point_distance(x,y,parent.x+xOffset,parent.y+yOffset) < 8{
		found = true;
	}
	if firstTimeTimer == firstTimeTime{
		TweenEasyMove(x,y,parent.x+xOffset,parent.y+yOffset,0,30,EaseOutSine);
	}
}
	
if parent.hand_state == HandState.RINSE || parent.hand_state == HandState.SCRUB4{
	var heightLimit = room_height/8*3
	var easeTime = 20;
	if parent.y > heightLimit{
		TweenEasyMove(x,y,parent.x+xOffset,parent.y+yOffset,0,easeTime,EaseOutSine);
	}else{
		TweenEasyMove(x,y,parent.x+xOffset,heightLimit+yOffset,0,easeTime,EaseOutSine);
	}
}else if parent.hand_state = HandState.DRY{
	if !leaving{
		TweenEasyMove(x,y,room_width/3,room_height*1.3,0,40,EaseOutSine);
		leaving = true;
	}
}