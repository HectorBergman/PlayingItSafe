if rightHand.hand_state == HandState.DIRTY{
	if !hasBeenGrabbed{
		x = parent.x
		y = parent.y
	}
	if place_meeting(x,y, rightHand) && !on_tray{
		if rightHand.firstGrab{
			grabbed = true;
			grabOffset[0] = x-rightHand.x
			grabOffset[1] = y-rightHand.y
			hasBeenGrabbed = true;
		}
	}
	if rightHand.image_index != 1 && grabbed{
		grabbed = false;
		justGrabbed = true;
	
	}

	if justGrabbed{
	
	}
	if place_meeting(x,y,obj_vanityTray) && !grabbed{
		on_tray = true;
		if image_index == 0 { //Watch
			x = 1750
			y = 650
		} else { //Ring
			x = 1830
			y = 800
		}
	}
}