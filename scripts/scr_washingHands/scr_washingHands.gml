function minigame_washingHands_control(){
	switch (minigameStatus){
		case status.started: minigame_washingHands_create(); break;
		case status.ongoing: minigame_washingHands_step(); break;
		case status.finished: minigame_washingHands_finish(); break;
		case status.none: break;
	}
}
function minigame_washingHands_create(){

	//here goes any code you need to start the minigame

	//this could also have a requirement in-case you want to have an animation or something b4 minigame start
	minigameStatus = status.ongoing;
	if difficulty >= 4 {
		hasJewelry = true
	}
}

//template for ongoing minigame handler actions. You can also control the minigame via this
//but I chose to do it via the minigame items instead (obj_dnd_item, obj_doors)
function minigame_washingHands_step(){
	var minigameComplete = true;
	
	//if requirements for minigame completion not met:
	minigameComplete = false;
	//or alternatively just have it be false and set to true when conditions met
	
	if minigameComplete{ 
		minigameStatus = status.finished;
	}
}

//template for minigames completed, doesnt have to look like this ofc
function minigame_washingHands_finish(){
	if checkmark == noone{
		perfect = true;
		checkmark = summonObject(obj_correct, [[]]);
		scoreHand.currentScore += 50
		//code for checking if perfect or not goes here
		ds_list_find_value(mainGameHand.stationsAndAlerts,mainGameHand.activeIndex).stationInfostruct.difficulty += 1;
		if !perfect{
			checkmark.visible = false;
		}
	}else{
		if checkmark.life >= checkmark.lifeTime && inHand.anyKey{
			exitMinigame();
			miniHandRefresh();
		}
	}

}

function generateRandomLetter(){
    var randLetter = irandom_range(0, lettersArrayLength - 1)
    return letters[randLetter]
}

/// @function create_water_drops()
/// @description Creates water drops on the hand
function create_water_drops() {
    // Clean up destroyed drops first
    for (var i = array_length(waterDrops) - 1; i >= 0; i--) {
        if (!instance_exists(waterDrops[i])) {
            array_delete(waterDrops, i, 1);
        }
    }
    
    // Create new drops if we have room
    if (array_length(waterDrops) < maxWaterDrops && waterDropTimer <= 0) {
        var attempts = 0;
        var dropCreated = false;
        
        // Try to find valid position (up to 20 attempts)
        while (attempts < 20 && !dropCreated) {
            attempts++;
            
            // Get random position within sprite bounds
            var randX = x + irandom_range(-sprite_width/2, sprite_width/3);
            var randY = y + irandom_range(-sprite_height/2, sprite_height/3);
            
            // Check if position collides with hand's mask
            if (position_meeting(randX, randY, id)) {
                // Create drop at valid position
                var drop = instance_create_layer(randX, randY, "Instances", obj_waterDrop);
                
                // Store parent reference
                drop.parentHand = id;
                drop.initialX = randX - x; // Store relative position
                drop.initialY = randY - y;
                
                // Random movement properties
                drop.driftSpeedX = 0;
                drop.driftSpeedY = 0.1 + random(0.2);
                drop.wiggleAmount = 0.5;
                drop.offsetX = 0;
                drop.offsetY = 0;
                
                // Set random lifetime
                drop.lifetime = room_speed * 4 + irandom(room_speed);
                
                array_push(waterDrops, drop);
                dropCreated = true;
            }
        }
        
        waterDropTimer = room_speed * 0.5; // Reset creation timer
    }
    
    // Timer and lifetime management (keep existing code)
    if (waterDropTimer > 0) waterDropTimer--;
    
    for (var i = array_length(waterDrops) - 1; i >= 0; i--) {
        var drop = waterDrops[i];
        if (instance_exists(drop)) {
            drop.lifetime--;
            if (drop.lifetime <= 0) {
                instance_destroy(drop);
                array_delete(waterDrops, i, 1);
            }
        } else {
            array_delete(waterDrops, i, 1);
        }
    }
}

function create_soap_bubbles() {
    // Clean up destroyed bubbles first
    for (var i = array_length(soapBubbles) - 1; i >= 0; i--) {
        if (!instance_exists(soapBubbles[i])) {
            array_delete(soapBubbles, i, 1);
        }
    }
    
    // Create new bubbles if we have room
    if (array_length(soapBubbles) < maxSoapBubbles && soapBubbleTimer <= 0) {
        var attempts = 0;
        var bubbleCreated = false;
        
        // Try to find valid position (up to 20 attempts)
        while (attempts < 20 && !bubbleCreated) {
            attempts++;
            
            // Get random position within sprite bounds
            var randX = x + irandom_range(-sprite_width, sprite_width/4);
            var randY = y + irandom_range(-sprite_height, sprite_height/4);
            
            // Check if position collides with hand's mask
            if (position_meeting(randX, randY, id)) {
                // Create bubble at valid position
                var bubble = instance_create_layer(randX, randY, "Instances", obj_soapBubble);
                
                // Use EXACTLY the same attachment system as water drops
                bubble.parentHand = id;
                bubble.initialX = randX - x; // Store relative position
                bubble.initialY = randY - y;
                
                //// Same movement properties as water drops
                //bubble.driftSpeedX = 0;
                //bubble.driftSpeedY = 0.1 + random(0.2);
                //bubble.wiggleAmount = 0;
                //bubble.offsetX = 0;
                //bubble.offsetY = 0;
                
                // Same lifetime as water drops
                bubble.lifetime = room_speed * 4 + irandom(room_speed);
                
                array_push(soapBubbles, bubble);
                bubbleCreated = true;
            }
        }
        
        soapBubbleTimer = room_speed * 0.5; // Same spawn rate as water drops
    }
    
    // Timer and lifetime management (identical to water drops)
    if (soapBubbleTimer > 0) soapBubbleTimer--;
    
    for (var i = array_length(soapBubbles) - 1; i >= 0; i--) {
        var bubble = soapBubbles[i];
        if (instance_exists(bubble)) {
            bubble.lifetime--;
            if (bubble.lifetime <= 0) {
                instance_destroy(bubble);
                array_delete(soapBubbles, i, 1);
            }
        } else {
            array_delete(soapBubbles, i, 1);
        }
    }
}


enum tapState {
    OFF,
    ON
}

