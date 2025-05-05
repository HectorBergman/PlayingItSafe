if (instruction_state == 0) {
	if (keyboard_check_pressed(vk_enter)) {
		instruction_state = 1;
		sprite_index = spr_instruction_2;
	}
}
else if (instruction_state == 1) {
	if (!button_created) {
		// instance_create_layer(room_width/2, room_height/2 + 100, "GUI", obj_start_button);
		instance_create_layer(room_width/2 - spr_start_button.width/2, room_height/2 + 100, "GUI", obj_start_button);
		button_created = true;
	}
}