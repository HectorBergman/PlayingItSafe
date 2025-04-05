if !complete{
	if dndHand.minigameComplete{
		complete = true;
		exit;
	}
	if inHand.mouseClick && place_meeting(x,y, hand){
		image_index = image_index+1 mod 2 //close & open
	}
	
}