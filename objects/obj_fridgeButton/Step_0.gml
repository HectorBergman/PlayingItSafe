print(bbox_left)
print(bbox_top)
print(mouse_x)
print(mouse_y);
print("-------");

print("place_meeting: " + string(place_meeting(mouse_x,mouse_y, id)));
print("mouseHeld: " + string(inHand.mouseHeld));
if place_meeting(x,y,obj_pointer_vari){
	print("weinit");
	if inHand.mouseHeld{
		
		if !clicked{
			image_index = 1;
			print("weclicked");
			clicked = true
			var cold = isCold;
			with (parent){
				changeTemp(!cold);
			}
		}
	}else{
		image_index = 0;
		clicked = false;
	}
}else{
	image_index = 0;
	clicked = false;
}

