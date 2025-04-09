if (image_index == 0){
	adult = true;
	child = summonObject(obj_volumeBar, [["image_index", 1], ["parent", id], ["type", type],["x", x], ["y", y]])
	plusButton = summonObject(obj_button, [["parent", id], ["grandParent", parent], ["x", x-sprite_width/2-64], ["y", y+sprite_height/2], ["action", 3], ["sprite", spr_plus]]) 
	minusButton = summonObject(obj_button, [["parent", id], ["grandParent", parent], ["x", x-sprite_width*2], ["y", y+sprite_height/2], ["action", 4], ["sprite", spr_minus]]) 
}else{
	adult = false;
}