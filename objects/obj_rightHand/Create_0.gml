depth = -1000
holding = false;
heldObject = noone;

xRelative = 0;
yRelative = 0;

recencyGrabbedDepth = 999;

// Define hand states
enum HandState {
    DIRTY,
    WET,
    SOAP,
	SCRUB,
	RINSE,
	DRY,
}

// Start in IDLE state
hand_state = HandState.DIRTY;
