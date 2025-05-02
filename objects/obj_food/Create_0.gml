// Initialization statements
time = 0;
cook_speed = 0;
state = 0;
a0 = false;
a1 = false;
a2 = false;

timer = 120;



// States:
// 0 = raw
// 1 = partially done
// 2 = done
// 3 = burned
// 4 = this shouldn't happen, something mught have gone wrong
state = 0;



// Checks when done, if time has swapped
after_done_counter = 0;
after_done_timer = 100;