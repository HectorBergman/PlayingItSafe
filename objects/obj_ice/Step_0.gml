PAUSE
if rightHand.hand_state == HandState.DIRTY{
	if !hasBeenGrabbed{
		x = parent.x
		y = parent.y
	}
	if place_meeting(x,y, rightHand){
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
	}
}