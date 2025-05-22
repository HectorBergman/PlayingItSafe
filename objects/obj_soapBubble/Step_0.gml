PAUSE
if (instance_exists(parentHand)) {
    // Calculate base position from initial relative position
    var baseX = parentHand.x + initialX;
    var baseY = parentHand.y + initialY;
    
    // Apply drifting movement
    driftSpeedX += (random(1) - 0.5) * 0.1;
    driftSpeedX = clamp(driftSpeedX, -0.5, 0.5);
    
    // Update offsets (for wiggle effect)
    offsetX += driftSpeedX;
    offsetY += driftSpeedY;
    
    // Apply slight random wiggle
    var wiggleX = sin(current_time * 0.01) * wiggleAmount;
    var wiggleY = cos(current_time * 0.007) * wiggleAmount;
    
    // Set final position
    x = baseX + offsetX + wiggleX;
    y = baseY + offsetY + wiggleY;
    
    // Constrain offsets so bubbles don't wander too far
    offsetX = clamp(offsetX, -5, 5);
    offsetY = clamp(offsetY, 0, 10); // Only allow downward drift
}

// Simple animation (same as water drops)
if (image_index >= 2) {
    image_index = 2;
    image_speed = 0;
}