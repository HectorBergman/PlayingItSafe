if (image_index == 0){
	adult = true;
	child = summonObject(obj_volumeBar, [["image_index", 1], ["parent", id], ["type", type],["x", x-356], ["y", y], ["scale", scale]])
	plusButton = summonObject(obj_button, [["parent", id], ["grandParent", parent], ["x", x+sprite_width*1.4], ["y", y+sprite_height], ["action", 3], ["sprite", spr_plus],["scale", scale]]) 
	minusButton = summonObject(obj_button, [["parent", id], ["grandParent", parent], ["x", x-sprite_width*1.4], ["y", y+sprite_height], ["action", 4], ["sprite", spr_minus], ["scale", scale]]) 
}else{
	adult = false;
}

//image_xscale = scale;
//image_yscale = scale;