depth = -1000
holding = false;
heldObject = noone;

xRelative = 0;
yRelative = 0;

recencyGrabbedDepth = 999;

scrubKey1 = "E";
scrubKey2 = "Q";
scrubKey3 = "F";
scrubKey4 = "H";

// Define hand states
enum HandState {
    DIRTY,
    WET,
    SOAP,
	SCRUB1,
	SCRUB2,
	SCRUB3,
	SCRUB4,
	RINSE,
	DRY,
}

// Start in IDLE state
hand_state = HandState.DIRTY;
