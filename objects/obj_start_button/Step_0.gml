var sprite_w = sprite_get_width(sprite_index);
var sprite_h = sprite_get_height(sprite_index);

var hovering = point_in_rectangle(
    mouse_x, mouse_y,
    x - sprite_w / 2, y - sprite_h / 2,
    x + sprite_w / 2, y + sprite_h / 2
);

// Switch sprite based on hover state
if (hovering) {
    sprite_index = spr_start_button_hover;

    if (mouse_check_button_pressed(mb_left)) {
        minigameStatus = status.started;
        room_goto(rm_falling_chicken); 
    }

} else {
    sprite_index = spr_start_button;
}