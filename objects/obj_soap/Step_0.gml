if  !instance_exists(soap) && (place_meeting(x, y, obj_rightHand) && (mouse_check_button_pressed(1))) {
	soap = instance_create_layer(1545, 64, "Instances", obj_soapSquirt);
}

if  instance_exists(soap) && soap.image_index >= 5 {
	instance_destroy(soap)
	soap = noone
}