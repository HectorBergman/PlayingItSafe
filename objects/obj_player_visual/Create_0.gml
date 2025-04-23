x = parent.x
y = parent.y
image_xscale = parent.image_xscale;
image_yscale = parent.image_yscale;
staticAngle = point_direction(x,y,x+parent.movementVector[0], y+parent.movementVector[1]);
increasing = 0
increasingAmount = 0.2 //basically frequency of the sine that makes him wiggle
varyAngle = sin(increasing)

