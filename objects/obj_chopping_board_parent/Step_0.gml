PAUSE
if !instance_exists(pointer){
	pointer = instance_find(obj_pointer_FC,0);
}
image_xscale = scale;
image_yscale = scale;
color = make_colour_rgb(colorR,colorG,colorB)
if place_meeting(x,y,obj_pointer_FC) && inHand.mouseHeld && pointer.held == noone{
	TweenFire(id,EaseOutQuad,0,false,0,20,"colorR",colorR,colorRGray)
	TweenFire(id,EaseOutQuad,0,false,0,20,"colorG",colorG,colorGGray)
	TweenFire(id,EaseOutQuad,0,false,0,20,"colorB",colorB,colorBGray)
	held = true;
	offset = [x-mouse_x,y-mouse_y]
	pointer.held = id;
}
if held && !inHand.mouseHeld{
	pointer.held = noone;
	held = false;
	if !place_meeting(x,y,obj_dishes){
		TweenFire(id,EaseOutQuad,0,false,0,10,"x",x,originalCoords[0])
		TweenFire(id,EaseOutQuad,0,false,0,10,"y",y,originalCoords[1])
	}
}
if held{
	x = mouse_x+offset[0];
	y = mouse_y+offset[1]
}

if !held && x == originalCoords[0] && y == originalCoords[1]{
	TweenFire(id,EaseOutQuad,0,false,0,20,"colorR",colorR,255)
	TweenFire(id,EaseOutQuad,0,false,0,20,"colorG",colorG,255)
	TweenFire(id,EaseOutQuad,0,false,0,20,"colorB",colorB,255)
}



// Chopping board animation. 

if (image_index >= image_number - 1) {
    image_speed = 0;
    image_index = image_number - 1; // lock it to the last frame
}