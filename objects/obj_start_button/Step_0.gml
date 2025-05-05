var hovering = point_in_rectangle(
    mouse_x, mouse_y,
    x - sprite_width / 2, y - sprite_height / 2,
    x + sprite_width / 2, y + sprite_height / 2
);

// Switch sprite based on hover state
if (hovering) {
    sprite_index = spr_start_button_hover;

    if (mouse_check_button_pressed(mb_left)) {
        room_goto(rm_falling_chicken); // your actual minigame room
        minigameStatus = status.started;
    }

} else {
    sprite_index = spr_start_button;
}