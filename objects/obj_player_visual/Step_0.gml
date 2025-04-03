increasing = increasing+increasingAmount
if parent.movementVector[0] != 0  || parent.movementVector[1] != 0{
	staticAngle = point_direction(x,y,x+parent.movementVector[0], y+parent.movementVector[1]);
	varyAngle = sin(increasing)*10
	image_angle = staticAngle+varyAngle
}else{
	image_angle = staticAngle;
}