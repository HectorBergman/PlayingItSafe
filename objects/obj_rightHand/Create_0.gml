depth = -1000
holding = false;
heldObject = noone;

xRelative = 0;
yRelative = 0;

recencyGrabbedDepth = 999;

scrub_count = 0;
scrub_timer = 0;

scrubPoint = instance_find(obj_scrubPoint, 0);
scrubDirX = 0;
scrubDirY = 0;
bejeweled = true;
jewel_rand = irandom_range(1, 4);
ring = noone;
wristBand = noone;




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
hand_state = HandState.DIRTY;
leftHand = noone;



function washingHandsText(newText){
	//todo: customize
	var wrapWidth = 1200;
	var text = ""
	text = "[scale,4][$eee7e7]"+string(newText); //$eee7e7 is color in hexadecimal, change this to change text color
	var toDraw = scribble(text).wrap(wrapWidth);
	
    var approxWidth = string_width(newText) * 4 * 1; //4 is scale. 0.6 is a fudge factor
	var centerX = (1920 - approxWidth) / 2;
	toDraw.draw(centerX, 10); //x and y coordinate where text will be drawn
	//fråga Hector om ni undrar något mer
}


/// @function handle_scrubbing(scrubKey1, scrubBar, scrub_timer, scrub_count, hand_state);
/// @description Manages the scrubbing mechanic (progress bar, timer, and state changes).
/// @param {string} scrubKey1 The keyboard key to check for scrubbing (e.g., "E").
/// @param {number} scrub_count Counter for scrubs (modified by reference).
/// @param {real} hand_state Hand state enum (modified by reference)..
function handle_scrubbing(_scrubKey, _scrubRep, _nextHandState) {
	
    if (!instance_exists(scrubBar)) {
        scrubBar = instance_create_layer(x, y, "Instances", obj_progressBar);
    }

    // Check for scrub input and timer
    if (scrub_timer <= 0 && keyboard_check_pressed(ord(_scrubKey))) {
        // Increment scrub count and reset timer
        scrub_count++;
        scrub_timer = room_speed * 0.4; // 0.4 seconds cooldown
        print("Scrub (Iteration: " + string(scrub_count) + ")");

        // Update progress bar if it exists
        if (instance_exists(scrubBar)) {
            scrubBar.image_index = scrub_count;
        }

        // Check if scrubbing is complete
        if (scrub_count >= _scrubRep) {
            hand_state = _nextHandState;
            print("Scrub completed!");

            // Clean up progress bar and reset variables
            if (instance_exists(scrubBar)) {
                instance_destroy(scrubBar);
                scrubBar = noone;
				scrub_count = 0;
				scrub_timer = 0;
            }
        }
    }
    
    // Timer countdown
    if (scrub_timer > 0) {
        scrub_timer--;
    }
	
}
