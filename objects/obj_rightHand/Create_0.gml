depth = -100
holding = false;
heldObject = noone;

xRelative = 0;
yRelative = 0;

recencyGrabbedDepth = 999;

scrub_count = 0;
scrub_timer = 0;
currentScrubTime = 0;

scrubPoint = instance_find(obj_scrubPoint, 0);
scrubDirX = 0;
scrubDirY = 0;
bejeweled = true;
jewel_rand = irandom_range(1, 4);
ring = noone;
wristBand = noone;

scrubBar = noone;

firstGrab = false;

waterDrop = noone;

waterDrops = []; // Array to store water drop instances
waterDropTimer = 0; // Timer for creating new drops
maxWaterDrops = 8; // Maximum number of drops visible at once

soapBubble = noone;

soapBubbles = []; // Array to store water drop instances
soapBubbleTimer = 0; // Timer for creating new drops
maxSoapBubbles = 12; // Maximum number of drops visible at once


leftHand = summonObject(obj_leftHand,[["x", room_width/4], ["y", room_height*1.3], ["parent", id]]);

//washing hands
// letters
letters = ["B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M",
       "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
lettersArrayLength = array_length(letters)


scrubKey1 = generateRandomLetter();
scrubKey2 = generateRandomLetter();
scrubKey3 = generateRandomLetter();
scrubKey4 = generateRandomLetter();

// Define hand states
enum HandState {
    DIRTY,
	JEWELRY,
    WET,
	scrubStart,
    SOAP,
	SCRUB1,
	SCRUB2,
	SCRUB3,
	SCRUB4,
	RINSE,
	DRY,
}

enum movability {
	movable,
	unmovable,
	halfmovable,
}
movabilityState = movability.movable

scrubTween = noone;
// Start in dirty state
hand_state = HandState.DIRTY




function washingHandsText(newText){
	//todo: customize
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,4][$eee7e7]"+string(newText); //$eee7e7 is color in hexadecimal, change this to change text color
	var toDraw = scribble(text).wrap(wrapWidth).align(fa_center);
	
	var centerX = room_width/ 2;
	toDraw.draw(centerX, 10); //x and y coordinate where text will be drawn
	//fråga Hector om ni undrar något mer
}


/// @function handle_scrubbing(scrubKey1, scrubBar, scrub_timer, scrub_count, hand_state);
/// @description Manages the scrubbing mechanic (progress bar, timer, and state changes).
/// @param {string} scrubKey1 The keyboard key to check for scrubbing (e.g., "E").
/// @param {number} scrub_count Counter for scrubs (modified by reference).
/// @param {real} hand_state Hand state enum (modified by reference)..
function handle_scrubbing(_scrubKey, _scrubRep, _nextHandState) {
    var isDone = false;
    
    // Initialize default tween parameters (important!)
    var yDifference = 80;  // Default value
    var tweenTime = currentScrubTime/3;
    var xDifference = irandom_range(-12,12);
    var easeType = EaseInOutQuint;
    var highDestination, lowDestination;
    
    if (!instance_exists(scrubBar)) {
        scrubBar = instance_create_layer(x, y, "Instances", obj_progressBar);
    }
    
    if (scrub_timer <= 0 && keyboard_check_pressed(ord(_scrubKey))) {
        scrub_count++;
        scrub_timer = 18 + irandom_range(-6,6);
        if scrub_timer mod 3 != 0 {
            if scrub_timer mod 3 == 1 {
                scrub_timer += 2;
            } else {
                scrub_timer++;
            }
        }
        currentScrubTime = scrub_timer;
        print("Scrub (Iteration: " + string(scrub_count) + ")");

        if (instance_exists(scrubBar)) {
            scrubBar.image_index = scrub_count;
        }

        if (scrub_count >= _scrubRep) {
            hand_state = _nextHandState;
            print("Scrub completed!");
            
            if (instance_exists(scrubBar)) {
                isDone = true;
                instance_destroy(scrubBar);
                scrubBar = noone;
                scrub_count = 0;
                scrub_timer = 0;
            }
        }
    }
    
    if (scrub_timer > 0) {
        if (scrubTween == noone || !TweenIsPlaying(scrubTween)) {
            // State-specific tween parameters
            switch (hand_state) {
                case HandState.SCRUB1: // Basic scrub
                    yDifference = 80;
                    tweenTime = currentScrubTime/3;
                    xDifference = irandom_range(-12,12);
                    easeType = EaseInOutQuint;
                    break;
                    
                case HandState.SCRUB2: // More vigorous scrub
                    yDifference = 30;
                    tweenTime = currentScrubTime/4;
                    xDifference = irandom_range(-10,10);
                    easeType = EaseInOutBack;
                    break;
                    
                case HandState.SCRUB3: // Circular motion
                    yDifference = 30;
                    tweenTime = currentScrubTime/2.5;
                    xDifference = irandom_range(-10,10);
                    easeType = EaseInOutElastic;
                    break;
                    
                case HandState.SCRUB4: // Most intense scrub
                    yDifference = 120;
                    tweenTime = currentScrubTime/5;
                    xDifference = irandom_range(-10,10);
                    easeType = EaseInOutBounce;
                    break;
            }

            // Calculate destinations with safety checks
            if (instance_exists(scrubPoint)) {
                highDestination = scrubPoint.y + yDifference + irandom_range(-30,10);
                lowDestination = scrubPoint.y - yDifference + irandom_range(-30,10);
                
                var leftHand_scrubHigh = false;
				if (point_distance(0, y, 0, highDestination) > point_distance(0, y, 0, lowDestination)) {
	                scrubTween = TweenEasyMove(x, y, scrubPoint.x + xDifference, highDestination, 0, tweenTime, easeType);
	            } else {
	                scrubTween = TweenEasyMove(x, y, scrubPoint.x + xDifference, lowDestination, 0, tweenTime, easeType);
	                leftHand_scrubHigh = true;
				}
				
                // Add rotation for states 3-4
                if (hand_state == HandState.SCRUB2 || hand_state == HandState.SCRUB3) {
                    var rotAmount = (hand_state == HandState.SCRUB2) ? 15 : 25;
                    var rotTweenTime = tweenTime * 2;
                    TweenEasyRotate(image_angle, 
                        leftHand_scrubHigh ? -rotAmount : rotAmount, 
                        0, rotTweenTime, EaseInOutQuad);
                }
            } else {
                show_debug_message("Scrub point missing!");
            }
        }
        scrub_timer--;
    }
    
    return isDone;
}