if (instance_exists(obj_rightHand)) {
    // Slight movement to make drops look more natural
    if (lifetime % 5 == 0) {
        x += irandom_range(-1, 1);
        y += irandom_range(0, 1); // Drops tend to move downward
    }
    
    // Stay within hand bounds (adjust as needed)
    if (point_distance(x, y, obj_rightHand.x, obj_rightHand.y) > 64) {
        x = obj_rightHand.x + irandom_range(-32, 32);
        y = obj_rightHand.y + irandom_range(-32, 32);
    }
}

if (image_index >= 3) {
    image_index = 3;
    image_speed = 0;
}
