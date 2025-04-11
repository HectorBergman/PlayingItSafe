PAUSE
if (heldObject != noone){
	xRelative = heldObject.x-x
	yRelative = heldObject.y-y
	heldObject.x = mouse_x + xRelative;
	heldObject.y = mouse_y + yRelative;
}