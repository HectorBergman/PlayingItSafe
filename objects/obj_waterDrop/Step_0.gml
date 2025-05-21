// Only move if parent hand exists
if (instance_exists(parentHand)) {
	depth = parentHand.depth - 1;
    // Calculate base position from initial relative position
    var baseX = parentHand.x + initialX;
    var baseY = parentHand.y + initialY;
    
    // Apply drifting movement
    driftSpeedX += (random(1) - 0.5) * 0.1;
    driftSpeedX = clamp(driftSpeedX, -0.5, 0.5);
    
    // Update offsets
    offsetX += driftSpeedX;
    offsetY += driftSpeedY;
    
    // Apply slight random wiggle
    var wiggleX = sin(current_time * 0.01) * wiggleAmount;
    var wiggleY = cos(current_time * 0.007) * wiggleAmount;
    
    // Set final position
    x = baseX + offsetX + wiggleX;
    y = baseY + offsetY + wiggleY;
    
    // Constrain offsets
    offsetX = clamp(offsetX, -5, 5);
    offsetY = clamp(offsetY, 0, 10);
    
    // Optional: Destroy if moved outside hand
    if (!position_meeting(x, y, parentHand)) {
        lifetime = 0; // Will be cleaned up next frame
    }
}

// Existing animation code
if (image_index >= 3) {
    image_index = 3;
    image_speed = 0;
}