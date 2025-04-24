switch (state){
	case leftHandState.scrubbing:{
		image_xscale = 1;
		image_index = 2;
		if !found{
			if point_distance(x,y,parent.x+xOffset,parent.y+yOffset) < 8{
				found = true;
			}
			if firstTime{
				TweenEasyMove(x,y,scrubPoint.x+xOffset,scrubPoint.y+yOffset,0,40,EaseOutSine);
				firstTime = false;
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
	}break;
	case leftHandState.iceCheck:{
		image_index = 0;
		image_xscale = -1;
		if parent.hand_state != HandState.DIRTY{
			TweenEasyMove(x,y,room_width/3,room_height*1.3,0,40,EaseOutSine);
			state = leftHandState.waiting
		}
	}break;
	case leftHandState.waiting:{
		if parent.hand_state == HandState.scrubStart{
			state = leftHandState.scrubbing
		}
	}break;
}