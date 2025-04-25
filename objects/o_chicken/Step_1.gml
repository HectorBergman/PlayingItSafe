

y += fall_speed;

// Move left or right
if (keyboard_check(vk_left)) {
 
        x -= step_size;
}

if (keyboard_check(vk_right)) {
    
        x += step_size;
}



// COLLISION WITH THE BOARD 