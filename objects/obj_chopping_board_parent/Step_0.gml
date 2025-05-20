image_xscale = scale;
image_yscale = scale;
if place_meeting(x,y,obj_pointer_menu) && inHand.mouseHeld{
	held = true;
	offset = [x-mouse_x,y-mouse_y]
}
if held && !inHand.mouseHeld{
	held = false;
	if !place_meeting(x,y,obj_dishes){
		x = originalCoords[0]
		y = originalCoords[1];
	}
}
if held{
	x = mouse_x+offset[0];
	y = mouse_y+offset[1]
}




// Chopping board animation. 

if (image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1; // lock it to the last frame
}