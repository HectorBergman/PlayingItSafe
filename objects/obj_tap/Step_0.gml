
if (place_meeting(200, 100, obj_rightHand) && keyboard_check_pressed(ord("E"))) {
    tap_on = !tap_on; // Toggle state
    image_index = tap_on; // Set image_index (0 = off, 1 = on)
}