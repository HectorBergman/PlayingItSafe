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
		scoreHand.currentScore += 30
		//code for checking if perfect or not goes here
		if !perfect{
			checkmark.visible = false;
		}
	}else{
		if checkmark.life == checkmark.lifeTime{
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
        // Random position on hand (adjust these values based on your hand sprite)
        var dropX = x + irandom_range(-sprite_width/2, sprite_width);
        var dropY = y + irandom_range(-sprite_height, sprite_height/2);
        
        // Create drop and add to array
        var drop = instance_create_layer(dropX, dropY, "Instances", obj_waterDrop);
        array_push(waterDrops, drop);
        
        // Set random lifetime (around 4 seconds)
        drop.lifetime = room_speed * 4 + irandom(room_speed);
        
        // Reset timer for next drop creation
        waterDropTimer = room_speed * 0.5; // Create new drop every 0.5 seconds
    }
    
    // Decrement timer if it's active
    if (waterDropTimer > 0) {
        waterDropTimer--;
    }
    
    // Update lifetimes and destroy expired drops
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
    
    // Create new drops if we have room
    if (array_length(soapBubbles) < maxSoapBubbles && soapBubbleTimer <= 0) {
        // Random position on hand (adjust these values based on your hand sprite)
        var dropX = x + irandom_range(-sprite_width/2, sprite_width);
        var dropY = y + irandom_range(-sprite_height, sprite_height/2);
        
        // Create drop and add to array
        var bubble = instance_create_layer(dropX, dropY, "Instances", obj_soapBubble);
        array_push(soapBubbles, bubble);
        
        // Set random lifetime (around 4 seconds)
        bubble.lifetime = room_speed * 4 + irandom(room_speed);
        
        // Reset timer for next drop creation
        soapBubbleTimer = room_speed * 0.5; // Create new drop every 0.5 seconds
    }
    
    // Decrement timer if it's active
    if (soapBubbleTimer > 0) {
        soapBubbleTimer--;
    }
    
    // Update lifetimes and destroy expired drops
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

