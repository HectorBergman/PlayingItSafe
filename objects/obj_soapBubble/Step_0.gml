if (instance_exists(obj_rightHand)) {
    // Stay within hand bounds (adjust as needed)
    if (point_distance(x, y, obj_rightHand.x, obj_rightHand.y) > 96) {
        x = obj_rightHand.x + irandom_range(-32, 64);
        y = obj_rightHand.y + irandom_range(-64, 32);
    }
}

if (image_index >= 2) {
    image_index = 2;
    image_speed = 0;
}
