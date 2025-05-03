image_speed = 0.1;
depth = -101;
lifetime = 0; // Will be set when created

// New variables for movement
driftSpeedX = 0;
driftSpeedY = 0.1 + random(0.2); // Slight downward drift
wiggleAmount = 0.5;
parentHand = noone;
attachPoint = [0, 0];
offsetX = 0;
offsetY = 0;