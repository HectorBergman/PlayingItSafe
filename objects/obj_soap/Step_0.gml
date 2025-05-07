if  !instance_exists(soap) && (place_meeting(x, y, obj_rightHand) && (keyboard_check_pressed(ord("E")))) {
	soap = instance_create_layer(1545, 64, "Instances", obj_soapSquirt);
}

if  instance_exists(soap) && soap.image_index >= 5 {
	instance_destroy(soap)
	soap = noone
}